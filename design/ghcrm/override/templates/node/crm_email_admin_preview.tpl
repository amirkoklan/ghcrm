{* Template: crm_email_admin_preview.tpl
   Purpose: CRM Email in Admin Preview
   Granite Horizon CRM *}

<div class="crm-preview"> 
    <div class="crm-header">
        <h2 class="no_website"> 
            {$node.object.contentobject_attributes.0.data_text}
            <span class="email_icon"></span>
        </h2>
    </div><!-- ends crm-header -->

    <div class="content_left_wrapper">
    <div class="content_left">
        <div class="crm-header">
            <h1>Email Information</h1>

            <div class="downbutton" style="display:none;">
                <a href="#"></a>
            </div><!-- ends downbutton -->

            <div class="upbutton" style="display:block;">
                <a href="#"></a>
            </div><!-- ends upbutton -->
        </div><!-- ends crm-header -->

    <div class="container" style="display:block;">

    {* Display the basic information *}
    {if $node.data_map.email_subject.has_content}
        <span class="client_info_left">Subject:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_subject}
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

    {if $node.data_map.assigned_to.has_content}
        <span class="client_info_left">Assigned To:</span>
          <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.assigned_to}
           </span>        
        <hr>
    {/if}

    {if $node.data_map.email_to_name.has_content}
        <span class="client_info_left">To:</span> 
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_to_name}
        </span>
        <hr>        
    {/if}

    {if $node.data_map.email_to_address.has_content}
        <span class="client_info_left">Email To Address:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_to_address}
        </span>
        <hr>
    {/if}

    {if $node.data_map.email_from_name.has_content}
        <span class="client_info_left">From:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_from_name}
        </span>
        <hr>
    {/if}

    {if $node.data_map.email_from_address.has_content}
        <span class="client_info_left">Email From Address:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_from_address}
        </span>
        <hr>
    {/if}

    {if $node.data_map.email_bcc.has_content}
        <span class="client_info_left">BCC:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.email_bcc}
        </span>
        <hr>
    {/if}

    {if $node.data_map.send_email.has_content}
        <span class="client_info_left">Email Sent:</span>
        <span class="client_info_right">
            {attribute_view_gui attribute=$node.data_map.send_email}
        </span>
        <hr>
    {/if}

    </div><!-- ends .container -->
</div><!-- ends content_left -->
</div><!-- ends content_left_wrapper -->

<div class="right_content_wrapper">
    {include uri="design:parts/admin_preview/crm_email_body.tpl" node=$node}
</div> <!-- end right_content_wrapper -->