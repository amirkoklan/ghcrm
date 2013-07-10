{* Template: crm_activity_admin_preview.tpl
   Purpose: CRM Activity Admin Preview
   Granite Horizon CRM *}

<div class="crm-header">
    <h2 class="no_website">{$node.object.contentobject_attributes.0.data_text}<span class="activity_icon"></span></h2>
</div><!-- ends .crm-header -->

<div class="content_left_wrapper">
<div class="content_left">
    <div class="crm-header">
        
        <h1>Activity Information</h1>
        <div class="downbutton" style="display:none;">
            <a href="#"></a>
        </div><!-- ends downbutton -->

        <div class="upbutton" style="display:block;">
            <a href="#"></a>
        </div><!-- ends upbutton -->
    </div><!-- ends .crm-header -->

    <div class="container" style="display:block">
        {if $node.data_map.name.has_content}
            <span class="client_info_left">Name:</span>
            <span class="client_info_right">
                {attribute_view_gui attribute=$node.data_map.name}
            </span>
            <hr>
        {/if}
    
        {if $node.data_map.date_scheduled.has_content}
            <span class="client_info_left">Date Scheduled:</span>
            <span class="client_info_right">
                {attribute_view_gui attribute=$node.data_map.date_scheduled}
            </span>
        <hr>
        {/if}

        {if $node.data_map.date_completed.has_content}
            <span class="client_info_left">Date Completed:</span>
            <span class="client_info_right">
                {attribute_view_gui attribute=$node.data_map.date_completed}
            </span>
            <hr>
        {/if}

        {if $node.data_map.type.has_content}
            <span class="client_info_left">Type:</span>
            <span class="client_info_right">
                {attribute_view_gui attribute=$node.data_map.type}
            </span>
            <hr>
        {/if}

        {if $node.data_map.assigned_to.has_content}
            <span class="client_info_left">Assigned To:</span>
            <span class="client_info_right">
                {attribute_view_gui attribute=$node.data_map.assigned_to}
            </span>
        {/if}
        
    </div><!-- ends .container -->
</div><!-- ends .content_left -->
</div><!-- ends .content_left_wrapper -->

<div class="right_content_wrapper">
    {include uri="design:parts/admin_preview/crm_activity_notes.tpl" node=$node}
</div> <!-- end right_content_wrapper -->

{undef $counter $count}