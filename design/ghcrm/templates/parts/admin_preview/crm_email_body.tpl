{* Template: crm_email_body.tpl
   Purpose: Get email body
   Granite Horizon CRM *}


<div class="content_right">

    <div class="crm-header">
        <h1>Email Body</h1>        
        {if $node.data_map.email_body.has_content}
            <div class="downbutton" style="display:none;">
                <a href="#"></a>
            </div><!-- ends downbutton -->

            <div class="upbutton" style="display:block;">
                <a href="#"></a>
            </div><!-- ends upbutton -->
        {else}
            <div class="no_contact_notes">(No Email Body)</div><!-- ends no_contact_notes --> 
        {/if}
    </div><!-- ends crm-header -->

    {if $node.data_map.email_body.has_content}
        <div class="container" style="display:block;">
    {else}
        <div class="container" style="display:none;">
    {/if}

    {if $node.data_map.email_body.has_content}
    <div class="crm_contact_notes left">
        <span class="contact_notes_left">Email</span><br>
        <span class="contact_notes_left">Body:</span>
        <span class="client_info_right">
            <p>{attribute_view_gui attribute=$node.data_map.email_body}</p>
	    </span>
    </div><!-- ends crm_contact_notes -->
    {/if}

    </div><!-- ends container-->
</div><!-- ends content_right-->