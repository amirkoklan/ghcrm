{* Template: crm_latest_sales_content.tpl
   Purpose: CRM Latest Sales Content Full View - Sorting Rules
   Granite Horizon CRM *}

{* initally sort on the $tab.sort_field, can add support later for more fields/columns to sort on. *}
{def $sort_mechanism = array()
     $sort_field = ""}

{if and( is_set( $tab.sort_field ), 
         is_set( $tab.sort_order ) )}
    {set $sort_field = concat( $tab.class_id, '/' , $tab.sort_field )
         $sort_mechanism = array( 'attribute', $tab.sort_order, $sort_field )}
{else}
    {set $sort_mechanism = array( 'modified', false() )}
{/if}

{if eq( $tab.class_id, "crm_activity")}
    {set $attribute_filter = array( 'and',
                 array( 'crm_activity/date_completed', '=', 'null'  ),
                 array( 'crm_activity/date_scheduled', '!=', 'null'  ) )}
{/if}

{def $parent_node_id = ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ) 
    $parent_node = fetch( 'content', 'node', hash( 'node_id', $parent_node_id ) )
    $latest_content = fetch( 'content', 'tree', hash( 'parent_node_id', ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' ),
                                                       'main_node_only',   true(),
                                                       'sort_by',          $sort_mechanism,
                                                        'limit', 10) )
    $parent_obj_id = $parent_node.contentobject_id
    $contentlanguage_code = "eng-US"}

<div class="header">
    <h2>{$tab.header|i18n( 'design/admin/dashboard/latest_content' )}</h2>

        {if $latest_content}
            <div id="{$tab.tab_id}">
                <h5>Sort by Date:</h5> 
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
</div><!-- ends .header -->

<table class="tablesorter list" cellpadding="0" cellspacing="0" border="0">
    {* Get table header *}
    <thead>
        {include uri='design:parts/table/header.tpl' class_id=$tab.class_id}
    </thead>

    {* Loop through objects *}
    <tbody>
        {foreach $latest_content as $obj}
            {include uri='extension/ghcrm/design/ghcrm/override/templates/line/crm_latest_sales_content.tpl' tab=$tab object=$obj}
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

{undef $parent_node $latest_content $parent_node_id $parent_obj_id $sort_mechanism $contentlanguage_code $sort_field}
