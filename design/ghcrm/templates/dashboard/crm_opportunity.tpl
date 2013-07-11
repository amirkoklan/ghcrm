{* Template: crm_opportunity.tpl
   Purpose: CRM Opportunity Full View - Sorting Rules
   Granite Horizon CRM *}

{* initally sort on the $tab.sort_field, can add support later for more fields/columns to sort on. *}
{def $sort_mechanism = array()
     $sort_field = ""}

{if and( is_set( $tab.sort_field ), 
         is_set( $tab.sort_order ) )}
    {set $sort_field = concat( $tab.class_id, '/' , $tab.sort_field )
         $sort_mechanism = array( 'attribute', $tab.sort_order, $sort_field )}
{else}
    {def $sort_mechanism = array( 'modified', false() )}
{/if}

{def $parent_node_id = ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ) 
     $parent_node = fetch( 'content', 'node', hash( 'node_id', $parent_node_id ) )
     $opportunitys = fetch( 'content', 'tree', hash( 'parent_node_id', $parent_node_id,
                                   'class_filter_type', 'include',
                                   'class_filter_array', array( $tab.class_id ),
                                   'main_node_only',   true(),
                                   'sort_by',          $sort_mechanism,
                                   'attribute_filter', array( array( 'crm_opportunity/status', '<', '12' )),
                                   'limit', 200) )
    $parent_obj_id = $parent_node.contentobject_id
    $contentlanguage_code = "eng-US"}

{def $new_entries_node = ezini( 'CRMNodeSettings', 'PutNewEntriesHereNode', 'ghcrm.ini' ) }

<div class="header">
    <h2>{$tab.header|i18n( 'design/admin/dashboard/latest_content' )}</h2>

            <div class="add_new">
                <form method="post" action={"/content/action"|ezurl()}>
                    <input type="hidden" name="ContentNodeID" value="{$new_entries_node}" />
                    <input type="hidden" name="NodeID" value="{$new_entries_node}" />
                    <input type="hidden" name="ClassIdentifier" value="crm_opportunity" />
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
                <h5>Sort by Status:</h5> 
                <a class="sort" id="sort_asc">asc</a> 
                <a class="sort" id="sort_desc">desc</a>

                <h5>Limit:</h5> 
                <a class="limit" id="limit_first">10</a> 
                <a class="limit">20</a> 
                <a class="limit">100</a> 
                <a class="limit selected">200</a> 
                <a class="limit">300</a> 
                <a class="limit">1000</a>
            </div><!-- ends tab.tab_id -->

</div><!-- .header -->

        {if $opportunitys}
<table class="tablesorter list" cellpadding="0" cellspacing="0" border="0">
    {* Get table header *}
    <thead>
        {include uri='design:parts/table/header.tpl' tab=$tab}
    </thead>

    {* Loop through objects *}
    <tbody>
        {foreach $opportunitys as $obj}
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
        'field'        : '{$sort_field}',
        'limit'     : '200'
{rdelim};

</script>

{undef $sort_field}