{* Template: crm_latest_content.tpl
   Purpose: CRM Latest Content Full View - Sorting Rules
   Granite Horizon CRM *}

{* initally sort on the $tab.sort_field, can add support later for more fields/columns to sort on. *}
{def $sort_mechanism = array()
     $sort_field = ""
     $sort_order_str = ""
     $attribute_filter = false()}

{if eq( $tab.class_id, 'crm_contact')}
    {set $attribute_filter = array(
                array( 'crm_contact/date_first_contacted', '=', 'null' ) )}
{/if}

{if and( is_set( $tab.sort_field ), 
         is_set( $tab.sort_order ) )}
    {set $sort_field = concat( $tab.class_id, '/' , $tab.sort_field )
         $sort_mechanism = array( 'attribute', $tab.sort_order, $sort_field )}
    {if $tab.sort_order|eq( false() )}
        {set $sort_order_str = 'desc'}
    {else}
        {set $sort_order_str = 'asc'}
    {/if}
{else}
    {set $sort_mechanism = array( 'modified', false() )}
{/if}

{def $parent_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ) ) )}

{def     $latest_content = fetch( 'content', 'tree', hash( 'parent_node_id', ezini( 'CRMNodeSettings', 'RootNode', 'content.ini' ),
                               'class_filter_array', array( $tab.class_id ),
                               'class_filter_type', 'include',
                               'main_node_only',   true(),
                               'attribute_filter', $attribute_filter,
                               'sort_by',          $sort_mechanism,
                               'limit', 10) )

    $parent_node_id = $parent_node.node_id
    $parent_obj_id = $parent_node.contentobject_id
    $contentlanguage_code = "eng-US"}

{def $new_entries_node = ezini( 'CRMNodeSettings', 'PutNewEntriesHereNode', 'ghcrm.ini' ) }

<div class="header">
    <h2>{$tab.header|i18n( 'design/admin/dashboard/latest_content' )}</h2>
        
    {if $latest_content}
        <div class="add_new">
            <form method="post" action={"/content/action"|ezurl()}>
                <input type="hidden" name="ContentNodeID" value="{$new_entries_node}" />
                <input type="hidden" name="NodeID" value="{$new_entries_node}" />
                <input type="hidden" name="ClassIdentifier" value="crm_organization" />
                <input type="hidden" name="ContentLanguageCode" value="{$contentlanguage_code}" />
                <input type="hidden" name="NewButton" value="Here" />
                <input type="hidden" name="ViewMode" value="full" />
                <input type="hidden" name="ContentObjectID" value="{$parent_obj_id}" />
                <input type="hidden" name="SortingField" value="6" />
                <input type="hidden" name="SortingOrder" value="1" />
                <input onmouseover='this.src={"add_new_button_hover.png"|ezimage()}'
                          onmouseout='this.src={"add_new_button.png"|ezimage()}'
                       type="image" src={"add_new_button.png"|ezimage()} class="add_new_button" value="Submit" alt="Submit" />
                {if eq( $tab.header, "People not Contacted" )}
                    <div class="add_new_text">Add New <br />{$tab.button}</div><!-- ends add_new_text -->
                {elseif eq( $tab.header, "Upcoming Contacts" )}
                    <div class="add_new_text">Add New <br />{$tab.button}</div><!-- ends add_new_text -->
                {else}
                       <div class="add_new_text">Add New <br />{$tab.button}</div><!-- ends add_new_text -->
                {/if}
            </form>
        </div><!-- ends .add_new -->

        <div id="{$tab.tab_id}">
            <h5>Sort by Name:</h5> 
            <a class="sort" id="sort_asc">asc</a> 
            <a class="sort" id="sort_desc">desc</a>

            <h5>Limit:</h5> 
            <a class="limit selected" id="limit_first">10</a> 
            <a class="limit">20</a> 
            <a class="limit">100</a> 
            <a class="limit">200</a> 
            <a class="limit">300</a> 
            <a class="limit">1000</a>
        </div><!-- ends tab.tab_id -->

</div><!-- .header -->

<table class="tablesorter list" cellpadding="0" cellspacing="0" border="0">
    {* Get table header *}
    <thead>
        {include uri='design:parts/table/header.tpl' class_id=$tab.class_id}
    </thead>

    {* Loop through objects *}
    {def $show_child = true()}
    <tbody>
        {foreach $latest_content as $obj}
            {set $show_child = true()}
            {if eq( $tab.class_id, 'crm_contact')}
               {* sub items: check the contact's activities. Are there any items with a completed date? *}
               {foreach $obj.children as $child}
                  {if and( is_set( $child.data_map.date_completed ), 
                           $child.data_map.date_completed.has_content )}
                          {set $show_child = false()}
                        {break}
                  {/if}
               {/foreach}
            {/if}
            {if $show_child}
                {content_view_gui content_object=$obj view='line'}
            {/if}
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
    'sort'      : '{$sort_order_str}',
    'field'     : '{$sort_field}',
    'limit'     : '10'
{rdelim};

</script>

{undef $parent_node $latest_content $parent_node_id $parent_obj_id $class_id_num $sort_mechanism $contentlanguage_code $sort_field $sort_order_str}
