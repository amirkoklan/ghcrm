{* Template: crm_dashboard.tpl
   Purpose: CRM Tabbed View
   Granite Horizon CRM *}

{set-block scope=global variable=cache_ttl}0{/set-block}
{def $tab_container1 = hash( 'tab_id', 'crm_tab_0',
                             'class_id', 'crm_activity',
                             'header', 'Upcoming Activities', 
                             'button', 'Activity', 
                             'sort_order', false(),
                             'sort_field', 'date_scheduled' )

     $tab_container2 = hash( 'tab_id', 'crm_tab_1',
                             'class_id', 'crm_project', 
                             'header', 'Pipeline Report', 
                             'button', 'Project',
                             'sort_order', false(), 
                             'sort_field', 'status' )

     $tab_container3 = hash( 'tab_id', 'crm_tab_2',
                             'class_id', 'crm_latest_sales_content',
                             'header', 'Latest Sales Content', 
                             'button', 'Latest Sales Content' )

     $tab_container4 = hash( 'tab_id', 'crm_tab_3', 
                             'class_id', 'crm_organization', 
                             'header', 'Organizations',
                             'button' , 'Organization',
                             'sort_order', true(), 
                             'sort_field', 'name' )

     $tab_container5 = hash( 'tab_id', 'crm_tab_4',
                             'class_id', 'none',
                             'header', 'Others',
                             'button', 'Others' )

     $tab_container6 = hash( 'tab_id', 'crm_tab_5',
                             'class_id', 'crm_contact',
                             'header', 'People Not Contacted',
                             'button', 'Organization',
                             'sort_order', true(), 
                             'sort_field', 'last_name' )
     $tabs = array()
     $other_tabs = array()}

{set $tabs = $tabs|append( $tab_container1 )}
{set $tabs = $tabs|append( $tab_container2 )}
{set $tabs = $tabs|append( $tab_container3 )}
{set $tabs = $tabs|append( $tab_container4 )}
{set $tabs = $tabs|append( $tab_container5 )}
{set $other_tabs = $other_tabs|append( $tab_container6 )}

<div id="tab_headers">
    <ul class="main">
        {foreach $tabs as $idx => $tab}
            <li class="items">
                {if $tab.header|eq("Others")}
                       <a  href="#" title="{$tab.header|i18n()}">{$tab.header|i18n()}</a>

                     <!--[If IE]>
                        <ul class="sub ie">
                    <![endif]-->    

                     <!--[If !IE]><!-->
                        <ul class="sub">
                    <![endif]-->    

                     {foreach $other_tabs as $other_idx => $other_tab}
                         <li class="sub_items">
                               <a class="tab_header" name="#crm_sub_tab_content-{$other_idx}" href="#" title="{$other_tab.header}">{$other_tab.header|i18n()}</a>
                        </li>
                    {/foreach}
                     </ul> 
                {else}
                     <a class="tab_header" name="#crm_tab_content-{$idx}" href="#" title="{$tab.header}">{$tab.header|i18n()}</a>
                 {/if}
            </li>
         {/foreach}
    </ul>
</div><!-- ends #tab_headers -->

{* The foreach is split into a separate template to accomodate for sub items *}
{set $tabs = array()}
{set $tabs = $tabs|append( $tab_container1 )}
{set $tabs = $tabs|append( $tab_container2 )}
{set $tabs = $tabs|append( $tab_container3 )}
{set $tabs = $tabs|append( $tab_container4 )}

   {include uri='design:parts/tab_loop/tab_container_loop.tpl' tabs=$tabs id_string='crm_tab_content'}
   {include uri='design:parts/tab_loop/tab_container_loop.tpl' tabs=$other_tabs id_string='crm_sub_tab_content'}

{undef $tabs
       $tab_container1
       $tab_container2
       $tab_container3
       $tab_container4
       $tab_container5
       $tab_container6}