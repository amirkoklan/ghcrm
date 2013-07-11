{* Template: tab_container_loop.tpl
   Purpose: Used by override/templates/crm_dashboard.tpl - This is to accomodate Sub Tabs
   Granite Horizon CRM *}
        
        {foreach $tabs as $idx => $tab}
                <div id="{$id_string}-{$idx}" class="tab_container" style="display:none">
            {if eq( $tab.class_id, "crm_activity" )}
                    {include uri='design:dashboard/crm_activity.tpl' tab=$tab}
            {elseif eq( $tab.class_id, "crm_latest_sales_content" )}
                    {include uri='design:dashboard/crm_latest_sales_content.tpl' tab=$tab}
            {elseif eq( $tab.class_id, "crm_opportunity" )}
                    {include uri='design:dashboard/crm_opportunity.tpl' tab=$tab}
            {else}
                    {include uri='design:dashboard/crm_latest_content.tpl' tab=$tab}
            {/if}
                </div><!-- #{$id_string}-{$idx} -->
        {/foreach}