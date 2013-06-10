{* Template: crm_activity.tpl
   Purpose: CRM Activity Full View
   Granite Horizon CRM *}

{def $sort_field = ''
     $sort_mechanism = array()
     $attribute_filter = array( array( 'crm_activity/date_scheduled', "!=", "null") )
     $parent_node_id = ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ) 
     $parent_node = fetch( 'content', 'node', hash( 'node_id', $parent_node_id ) )
     $parent_obj_id = $parent_node.contentobject_id
     $class_id_num = 46
     $contentlanguage_code = "eng-US"}

{* initally sort on the $tab.sort_field, can add support later for more fields/columns to sort on. *}
{set sort_mechanism = array()
     $sort_field = ""}

{if and( is_set( $tab.sort_field ), 
         is_set( $tab.sort_order ) )}
    {set $sort_field = concat( $tab.class_id, '/' , $tab.sort_field )
         $sort_mechanism = array( 'attribute', $tab.sort_order, $sort_field )}
{else}
    {def $sort_mechanism = array( 'modified', false() )}
{/if}

{if eq( $tab.class_id, "crm_activity")}
    {set $attribute_filter = array( 'and',
                array( 'crm_activity/date_completed', '=', 'null'  ),
                array( 'crm_activity/date_scheduled', '!=', 'null' ) )}
{/if}

{def $activities = fetch( 'content', 'tree', hash( 'parent_node_id', $parent_node_id,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array( $tab.class_id ),
                                                       'attribute_filter', $attribute_filter,
                                                       'main_node_only',   true(),
                                                       'sort_by',          $sort_mechanism,
                                                       'limit', 10 ) )}

{def $new_entries_node = ezini( 'CRMNodeSettings', 'PutNewEntriesHereNode', 'ghcrm.ini' ) }

<div class="header">
    <h2>{$tab.header|i18n( 'design/admin/dashboard/latest_content' )}</h2>
        
    {if $activities}
        <div class="add_new">
            <form method="post" action={"/content/action"|ezurl()}>
                <input type="hidden" name="ContentNodeID" value="{$new_entries_node}" />
                <input type="hidden" name="NodeID" value="{$new_entries_node}" />
                <input type="hidden" name="ClassID" value="{$class_id_num}" />
                <input type="hidden" name="ContentLanguageCode" value="{$contentlanguage_code}" />
                <input type="hidden" name="NewButton" value="Here" />
                <input type="hidden" name="ViewMode" value="full" />
                <input type="hidden" name="ContentObjectID" value="{$parent_obj_id}" />
                <input type="hidden" name="SortingField" value="6" />
                <input type="hidden" name="SortingOrder" value="1" />
                <input onmouseover='this.src={"add_new_button_hover.png"|ezimage()}'
                        onmouseout='this.src={"add_new_button.png"|ezimage()}'
                        type="image" src={"add_new_button.png"|ezimage()} class="add_new_button" value="Submit" alt="Submit" />
                   <div class="add_new_text">Add New <br />{$tab.button}</div><!-- ends add_new_text -->
            </form>
        </div><!-- .add_new -->

        <div id="{$tab.tab_id}">
            
            <h5>Sort by Date:</h5> 
            <a class="sort" id="sort_asc">asc</a> 
            <a class="sort" id="sort_desc">desc</a>
            
            <h5>Limit:</h5> 
            <a class="limit selected" id="limit_first">10</a> 
            <a class="limit" id="limit_second">20</a> 
            <a class="limit" id="limit_third">100</a> 
            <a class="limit" id="limit_fourth">200</a> 
            <a class="limit" id=limit_fifth"">300</a> 
            <a class="limit" id="limit_sixth">1000</a>
        </div><!-- ends tab.tab_id -->
</div><!-- .header -->
    
<table class="tablesorter list" cellpadding="0" cellspacing="0" border="0">
    {* Get table header *}
    <thead>
        {include uri='design:parts/table/header.tpl' tab=$tab}
    </thead>

    {* Loop through objects *}
    <tbody>
        {foreach $activities as $obj}
            {content_view_gui content_object=$obj view='line'}
        {/foreach}
    </tbody>
</table>

        {else}
              <p class="crm_error">{'This content list is empty.'|i18n( 'design/admin/dashboard/latest_content' )}</p>
        {/if}    

<script type="text/javascript">

{* Javascript created dynamically *}
var {$tab.tab_id} = {ldelim}
        'class_id'  : '{$tab.class_id}',
        'sort'      : 'desc',
        'field'     : '{$sort_field}',
        'limit'     : '10'
{rdelim};

</script>

{undef $sort_field $attribute_filter}