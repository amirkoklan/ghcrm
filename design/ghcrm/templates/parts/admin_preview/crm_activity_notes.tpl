{* Template: crm_activity_notes.tpl
   Purpose: Get activity notes
   Granite Horizon CRM *}


<div class="content_right">

    <div class="crm-header">
        <h1>Activity Notes</h1>        
        {if $node.data_map.notes.has_content}
            <div class="downbutton" style="display:none;">
                <a href="#"></a>
            </div><!-- ends downbutton -->

            <div class="upbutton" style="display:block;">
                <a href="#"></a>
            </div><!-- ends upbutton -->
       {else}
            <div class="no_activity_notes">(No Notes)</div><!-- ends no_activity_notes -->
       {/if}

    </div><!-- ends crm-header -->

    {if $node.data_map.notes.has_content}
        <div class="container" style="display:block;">
    {else}
        <div class="container" style="display:none;">
    {/if}

    {if $node.data_map.notes.has_content}
        <span class="notes_left">Notes:</span>
        <span class="client_info_right">
            <p>{attribute_view_gui attribute=$node.data_map.notes}</p>
	    </span>
    {/if}

    </div><!-- ends container-->
</div><!-- ends content_right-->