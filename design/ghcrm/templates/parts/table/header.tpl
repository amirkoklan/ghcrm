{* Template: header.tpl
   Purpose: 
   Granite Horizon CRM *}

{* Table Header *}
    {def $fields = ""}
{if eq( $tab.class_id, "crm_organization" )}
    {set $fields = array( 'name', 'city', 'phone', 'contacts', 'modified' )}
    {include uri='design:parts/table/headers/crm_organization.tpl' fields=$fields}
{elseif eq( $tab.class_id, "crm_activity" )}
    {set $fields = array( 'name', 'organization', 'phone', 'web20', 'lastc', 'nextc')}
    {include uri='design:parts/table/headers/crm_activity.tpl' fields=$fields}
{elseif eq( $tab.class_id, "crm_contact" )}
    {set $fields = array( 'name', 'organization', 'phone', 'web20', 'lastc', 'nextc')}
    {include uri='design:parts/table/headers/crm_contact.tpl' fields=$fields}
{elseif eq( $tab.class_id, "crm_latest_sales_content" )}
    {include uri='design:parts/table/headers/crm_latest_sales_content.tpl' fields=$fields}
{elseif eq( $tab.class_id, "crm_opportunity" )}
        {include uri='design:parts/table/headers/crm_opportunity.tpl' fields=$fields}
{else}
    {'Error!'|wash()}
{/if}