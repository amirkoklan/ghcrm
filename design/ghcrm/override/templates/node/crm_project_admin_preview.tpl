{* Template: crm_project_admin_preview.tpl
   Purpose: CRM Project in Admin Preview
   Granite Horizon CRM *}

{if eq($node.object.current.contentobject_attributes.0.contentclass_attribute_name, 'Title')}
    <div class="crm-header">
        <h2 class="no_website">{$node.object.contentobject_attributes.0.data_text}<span class="project_icon"></span></h2>
    </div><!-- ends .crm-header -->
{/if}

<div class="content_left">
    <div class="crm-header">
            
        <h1>Project Information</h1>
    
        <div class="downbutton" style="display:none;">
            <a href="#"></a>
        </div><!-- ends downbutton -->

        <div class="upbutton" style="display:block;">
            <a href="#"></a>
        </div><!-- ends upbutton -->
    </div><!-- ends .crm-header -->

    <div class="container" style="display:block;">

    {if $node.data_map.title.has_content}
        <span class="client_info_left">Project Title:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.title}
        </span>
        <hr>
    {/if}

    {if $node.data_map.date_rfi_received.has_content}
        <span class="client_info_left">Date RFI Received:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.date_rfi_received}
        </span>
        <hr>
    {/if}

    {if $node.data_map.date_rfp_received.has_content}
        <span class="client_info_left">Date RFP Received:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.date_rfp_received}
        </span>
        <hr>
    {/if}

    {if $node.data_map.date_and_time_due.has_content}
        <span class="client_info_left">Due Date:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.date_and_time_due}
        </span>
        <hr>
    {/if}

    {if $node.data_map.date_and_time_proposal_submitted.has_content}
        <span class="client_info_left">Date Submitted:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.date_and_time_proposal_submitted}
        </span>
        <hr>
    {/if}

    {if $node.data_map.notes.has_content}
        <span class="client_info_left">Notes:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.notes}
        </span>
        <hr>
    {/if}

    {if $node.data_map.estimated_value.has_content}
        <span class="client_info_left">Estimated Value:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.estimated_value}
        </span>
        <hr>
    {/if}

    {if $node.data_map.status.has_content}
        <span class="client_info_left">Status:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.status}
        </span>
        <hr>
    {/if}

    {if $node.data_map.contacts.has_content}
        <span class="client_info_left">Contacts:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.contacts}
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