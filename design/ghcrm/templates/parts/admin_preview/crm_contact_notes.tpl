{* Template: crm_contact_notes.tpl
   Purpose: Get contact notes
   Granite Horizon CRM *}


<div class="content_right">

    <div class="crm-header">
        <h1>Contact Notes</h1>        
        {if or($node.data_map.notes.has_content, $node.data_map.contact_notes.has_content)}
            <div class="downbutton" style="display:none;">
                <a href="#"></a>
            </div><!-- ends downbutton -->

            <div class="upbutton" style="display:block;">
                <a href="#"></a>
            </div><!-- ends upbutton -->
        {else}
            <div class="no_contact_notes">(No Notes)</div><!-- ends no_contact_notes --> 
        {/if}
    </div><!-- ends crm-header -->

    {if or($node.data_map.notes.has_content, $node.data_map.contact_notes.has_content)}
        <div class="container" style="display:block;">
    {else}
        <div class="container" style="display:none;">
    {/if}

    {if $node.data_map.notes.has_content}
    <div class="crm_contact_notes left">
        <span class="contact_notes_left">General</span><br>
        <span class="contact_notes_left">Notes:</span>
        <span class="client_info_right">
            <p>{attribute_view_gui attribute=$node.data_map.notes}</p>
	    </span>
    </div><!-- ends crm_contact_notes -->
        <hr>
    {/if}

    {if $node.data_map.contact_notes.has_content}
    <div class="crm_contact_notes left">
        <span class="contact_notes_left">Contact</span><br>
        <span class="contact_notes_left">Notes:</span>
        <span class="client_info_right">
            <p>{attribute_view_gui attribute=$node.data_map.contact_notes}</p>
	    </span>
    </div><!-- ends crm_contact_notes -->
    {/if}
    </div><!-- ends container-->
</div><!-- ends content_right-->