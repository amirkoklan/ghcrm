{* Template: crm_project_by_state.tpl
   Purpose: CRM Project by State Full View - Sorting Rules
   Granite Horizon CRM *}

{def $field = ""}
{if eq( $tab.class_id, "crm_activity")}
	{set $field = "date_scheduled"}
{elseif eq( $tab.class_id, "crm_project")}
	{set $field = "state"}
{elseif eq( $tab.class_id, "crm_latest_sales_content")}
	{set $field = "modified"}
{elseif eq( $tab.class_id, "crm_organization")}
	{set $field = "name"}
{elseif eq( $tab.class_id, "crm_contact")}
	{set $field = "name"}
{/if}

{def $sort_mechanism = array( 'attribute', false(), 'crm_project/status' )
     $attribute_filter = array( array( 'state', '!=', 8 ) )}

{def $parent_node_id = ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ) 
     $parent_node = fetch( 'content', 'node', hash( 'node_id', $parent_node_id ) )
     $projects = fetch( 'content', 'tree', hash( 'parent_node_id', $parent_node_id,
                                   'attribute_filter', $attribute_filter,
                                   'class_filter_type', 'include',
                                   'class_filter_array', array( $tab.class_id ),
                                   'main_node_only',   true(),
                                   'sort_by',          $sort_mechanism,
                                   'limit', 10) )
    $parent_obj_id = $parent_node.contentobject_id
    $class_id_num = 57
    $contentlanguage_code = "eng-US"}

<div class="header">
    <h2>{$tab.header|i18n( 'design/admin/dashboard/latest_content' )}</h2>

    {if $projects}
        <div class="add_new">
            <form method="post" action={"/content/action"|ezurl()}>
                <input type="hidden" name="ContentNodeID" value="{$parent_node_id}" />
                <input type="hidden" name="NodeID" value="{$parent_node_id}" />
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
            <a class="limit" id="limit_first">10</a> 
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
        {include uri='design:parts/table/header.tpl' tab=$tab}
    </thead>

    {* Loop through objects *}
    <tbody>
        {foreach $projects as $obj}
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
        'field'	    : '{$field}',
        'limit'     : '10'
{rdelim};

</script>

{undef $field}