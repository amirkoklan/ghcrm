<?php
/**
 * File: ghcrmfetch.php
 * Purpose: This file contains the GHCRMFetch class.
 * Granite Horizon CRM
 *
 * @package GHCRM Fetch
 * @version //autogentag//
 * @copyright Copyright (C) 2010 Granite Horizon, LLC. All rights reserved.
 * @license Lincensed under GNU 2.0
 */

include_once( 'kernel/common/template.php' );

class GHCRMFetch extends ezjscServerFunctions
{
    public static function getDataSet( $args )
    {

    $ini = eZINI::instance( 'content.ini' );
    $root_node_id = $ini->variable( 'CRMNodeSettings', 'RootNode' );
    
    $sort_order = false;
    $class_id = 'crm_organization';
    $limit = 10;

        $http = eZHTTPTool::instance();

    $error = false;
    $errors = array(
        'args' =>"<p class=\"error\">Error: Invalid arguments sent to AJAX script. Expecting: class_id,sort_by,limit </p>",
        'object_fetch' =>"<p class=\"error\">Error: Failed to fetch child objects. Have your website administrator check your permissions.</p>");

    if ( isset( $args[0] ) 
            && isset( $args[1] ) 
            && isset( $args[2] ) 
            && isset( $args[3] ) )
    {
        $class_id = htmlspecialchars( $args[0] );
        $sort_order_string =  htmlspecialchars( $args[1] );
        $sort_field = htmlspecialchars( $args[2] );
        $limit = htmlspecialchars( $args[3] );
        $limit = (int)$limit;
    }
    //$.ez( 'ghcrmfetch::getdataset', {class_id: obj.class_id, sort_order: obj.sort, sort_by: obj.field, limit: obj.limit}, function( ezp_data )
    else if ( $http->hasPostVariable( 'class_id' ) 
            && $http->hasPostVariable( 'sort_order' ) 
            && $http->hasPostVariable( 'sort_by' ) 
            && $http->hasPostVariable( 'limit' ) )
    {
        $class_id = htmlspecialchars( $http->postVariable( 'class_id') );
        $sort_order_string = htmlspecialchars( $http->postVariable( 'sort_order' ) );
        $sort_field = htmlspecialchars( $http->postVariable( 'sort_by' ) );
        $limit = htmlspecialchars( $http->postVariable( 'limit') );
        $limit = (int)$limit;
    }
    else
    {
        return $error['args'];
    }

    // Intialize sorting order variable
    $sort_order = false;
    if ( strcmp( $sort_order_string, "asc" ) == 0 )
    {
        $sort_order = true;
    }

    //check limits
    if ( $limit > 1000 || $limit < 10 )
    {
        //default to 10 if bad data received
        $limit = 10;
    }

    // Default Fetch Settings
    $attribute_filter = false;
    $class_filter = array( $class_id );
    
    $sort_mechanism = array( 'attribute', $sort_order, $sort_field );

    // CRM Latest Sales Content Settings
    if ( strcmp( $class_id, "crm_latest_sales_content" ) == 0 )
    {
        $attribute_filter = false;
        $class_filter = array();
        $sort_mechanism = array( 'modified', $sort_order );
    }

    // CRM Project Settings
    if ( strcmp( $class_id, "crm_project" ) == 0 )
    {
        $attribute_filter = array( array( $sort_field, '<', '12' ));
    }

    // CRM Activity Settings
    if ( strcmp( $class_id, "crm_activity" ) == 0 )
    {
        $attribute_filter = array( 'and', 
                                array( 'crm_activity/date_completed', '=', 'null'  ),
                                array( 'crm_activity/date_scheduled', '!=', 'null'  ) );
    }

    $contentobjects = eZFunctionHandler::execute( 'content', 'tree', array( 
                             'parent_node_id'     => $root_node_id,
                             'class_filter_type'  => 'include',
                             'class_filter_array' => $class_filter,
                             'sort_by'            => $sort_mechanism,
                             'limit'              => $limit,
                             'main_node_only'     => true,
                                 'attribute_filter'   => $attribute_filter ) );

    if ( isset( $contentobjects ) )
    {
        $result = "";

        $tpl = eZTemplate::factory();
        $res = eZTemplateDesignResource::instance();

        $show_child = true;
        foreach( $contentobjects as $idx => $obj )
        {
            $show_child = true;
            if( $class_id === "crm_contact" )
            {
                $children = $obj->attribute( 'children' );
                foreach( $children as $child )
                { 
                    $childDataMap = $child->dataMap();
                    if( $childDataMap["date_completed"]->hasContent() )
                    {
                        $show_child = false;
                        break;
                    }
                }
            }
            if( $show_child )
            {
                $params = array(
                    'object' => $obj,
                    'contentobject_id' => $obj->attribute( 'object')->attribute( 'id' ),
                );

                $res->setKeys( array( array( 'class_identifier', $obj->attribute('object')->attribute( 'class_identifier' ) ) ) );

                foreach( $params as $key => $value )
                {    
                    $tpl->setVariable( $key, $value );
                }
                if( strcmp( $class_id, "crm_latest_sales_content" ) == 0 )
                {
                    $result .= $tpl->fetch( "extension/ghcrm/design/ghcrm/override/templates/line/crm_latest_sales_content.tpl" );
                }
                else
                {
                    $result .= $tpl->fetch( "design:content/view/line.tpl" );
                }
            } //end show child check
        }

        // Used for debugging via HTTP request:
        // http://dev.server.com/ezjscore/call/ghcrmfetch::getdataset::3::crm_contact::asc::10
        
        //echo $result;
        //eZDebug::printReport();
        //eZExecution::cleanExit();

        return $result;
    }
    else 
    {
        return $error['object_fetch'];
    }
    }
}
?>
