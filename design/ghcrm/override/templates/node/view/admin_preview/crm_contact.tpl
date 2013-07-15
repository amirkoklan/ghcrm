{* Template: crm_contact.tpl
   Purpose: CRM Contact in Admin Preview
   Granite Horizon CRM *}

<div class="crm-preview"> 

<div class="crm-header">
<h2 class="no_website"> 
    {attribute_view_gui attribute=$node.data_map.first_name} {attribute_view_gui attribute=$node.data_map.last_name}
    <span class="contact_icon"></span>

    <div class="send_email_icon">
        <form method="post" action={"/content/action"|ezurl()}>
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ClassIdentifier" value="crm_email" />
            <input type="hidden" name="ContentLanguageCode" value="{$node.object.current_language}" />
            <input type="hidden" name="NewButton" value="Here" />
            <input type="hidden" name="ViewMode" value="full" />
            <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
            <input type="hidden" name="SortingField" value="6" />
            <input type="hidden" name="SortingOrder" value="1" />
            <input onmouseover='this.src={"send_email_icon_hover.png"|ezimage()}'                                                                                       onmouseout='this.src={"send_email_icon.png"|ezimage()}'
                   type="image" src={"send_email_icon.png"|ezimage()} class="pending_button" value="Submit" alt="Submit" />                                 </form>
    </div>

</h2>
</div><!-- ends crm-header -->

<div class="content_left_wrapper">
<div class="content_left">

<div class="crm-header">
    <h1>Client Information</h1>

    <div class="downbutton" style="display:none;">
        <a href="#"></a>
    </div><!-- ends downbutton -->

    <div class="upbutton" style="display:block;">
        <a href="#"></a>
    </div><!-- ends upbutton -->

</div><!-- ends crm-header -->

<div class="container" style="display:block;">

    {* Display the basic information *}
    {if eq( $node.data_map.do_not_contact.data_int, 1 )}
    <span class="client_info_left do_not_call">Do Not Call List:</span> 
    <span class="client_info_right do_not_call">    
        Please do not contact this client.
	</span>        
    <hr>
    {/if}

    {if $node.data_map.id_photo.has_content}
        <div class="contact_photo" style="float:right;">
            {attribute_view_gui attribute=$node.data_map.id_photo image_class=medium}
        </div><!-- ends contact_photo -->
    {/if}

{if $node.data_map.title.has_content}
    {if $node.data_map.id_photo.has_content}
    <span class="client_info_left_title">Title:</span>
    <span class="client_info_right_title">
        {attribute_view_gui attribute=$node.data_map.title}
    </span>
    {else}
    <span class="client_info_left">Title:</span>
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.title}
    </span>
    {/if}
 <hr>
{/if}

{if $node.data_map.phone_1.has_content}
    <span class="client_info_left">Primary Phone:</span> 
    <span class="client_info_right">    
        {attribute_view_gui attribute=$node.data_map.phone_1}
    </span>        
    <hr>
{/if}

{if $node.data_map.phone_2.has_content}
    <span class="client_info_left">Alternate Phone:</span>
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.phone_2}
    </span>        
    <hr>
{/if}

{if $node.data_map.email.has_content}
    <span class="client_info_left">Email:</span>
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.email}
    </span>
    <hr>
{/if}

<span class="client_info_left">Organization:</span><span class="client_info_right"> {node_view_gui content_node=$node.parent view='line'}</span>
    {if $node.parent.can_edit}
        <a href="{concat( 'content/edit/', $node.parent.contentobject_id )|ezurl('no')}">
            <img src={'edit.gif'|ezimage} alt="Edit" title="Edit {$node.parent.name|wash()}" />
        </a>
        <hr>
    {else}
        <img src="{'edit-disabled.gif'|ezimage('no')}" alt="Edit" title="You do not have permission to edit {$node.parent.name|wash()}." />
        <hr>
    {/if}

<span class="client_info_left">Social Media:</span> 

{if $node.data_map.personal_email.has_content}
    <a href="mailto:{$node.data_map.personal_email.content|wash()}">
        <img class="gradualfader" src={'images/email.png'|ezdesign()} alt="{$node.data_map.personal_email.content|wash()}" height="32px" width="32px" />
    </a>
{/if}

{if $node.data_map.twitter_id.has_content}
    <a href="http://twitter.com/{$node.data_map.twitter_id.content|wash()}">
        <img class="gradualfader" src={'images/twitter.png'|ezdesign()} alt="{$node.data_map.twitter_id.content|wash()}" height="32px" width="32px" />
    </a>
{/if}

{if $node.data_map.skype_id.has_content}<a href="skype:{$node.data_map.skype_id.content|wash()}?userinfo"><img class="gradualfader" src={'images/skype.png'|ezdesign()} alt="{$node.data_map.skype_id.content|wash()}" height="32px" width="32px" /></a>{/if}

{if $node.data_map.linkedin_url.has_content}<a href="{$node.data_map.linkedin_url.content|wash()}"><img class="gradualfader" src={'images/linkedin.png'|ezdesign()} alt="{$node.data_map.linkedin_url.content|wash()}" height="32px" width="32px" /></a>{/if}

{if $node.data_map.blog.has_content}<a href="{$node.data_map.blog.content|wash()}"><img class="gradualfader" src={'images/blog.png'|ezdesign()} alt="{$node.data_map.blog.content|wash()}" height="32px" width="32px" /></a>{/if}

{attribute_view_gui attribute=$node.data_map.other_social_networks}<br />

{if or($node.data_map.email.has_content, $node.data_map.personal_email, $node.data_map.twitter_id.has_content, $node.data_map.skype_id.has_content, $node.data_map.linkedin_url.has_content, $node.data_map.blog.has_content, $node.data_map.other_social_networks.has_content)}
    <hr>
{/if}


<span class="client_info_left">Assigned to:</span> 
<span class="client_info_right">    
    {if $node.data_map.assigned_to.has_content}
        {attribute_view_gui attribute=$node.data_map.assigned_to}
    {else}
        no one.
    {/if}
</span>
<hr>

{if $node.data_map.family_information.has_content}
    <span class="client_info_left">Family Information:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.family_information}
    </span>
    <hr>
{/if}

{if $node.data_map.education.has_content}
    <span class="client_info_left">Education:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.education}
    </span>
    <hr>
{/if}

{if $node.data_map.peers.has_content}
    <span class="client_info_left">Peers:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.peers}
    </span>
    <hr>
{/if}

{if $node.data_map.previous_employers.has_content}
    <span class="client_info_left">Previous Employers:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.previous_employers}
    </span>
    <hr>
{/if}

{if or( $node.data_map.home_address.has_content,
        $node.data_map.home_city.has_content,
        $node.data_map.home_state.has_content,
        $node.data_map.home_zip.has_content,
        $node.data_map.country.has_content )}
<div class="crm_address_info right">
    <span class="client_info_left">Home Address:</span>
    <span class="client_info_right">
    {if $node.data_map.home_address.has_content}
        {attribute_view_gui attribute=$node.data_map.home_address}<br>
    {/if}
    {if $node.data_map.home_city.has_content}
        {attribute_view_gui attribute=$node.data_map.home_city},
    {/if}
    {if $node.data_map.home_state.has_content}
        {attribute_view_gui attribute=$node.data_map.home_state}
    {/if}
    {if $node.data_map.home_zip.has_content}
        {attribute_view_gui attribute=$node.data_map.home_zip}<br>
    {/if}
    {if $node.data_map.country.has_content}
        {attribute_view_gui attribute=$node.data_map.country}
    {/if}
    </span>
</div><!-- .crm_address_info -->
<hr>
{/if}

{if or( $node.data_map.business_address.has_content,
        $node.data_map.business_city.has_content,
        $node.data_map.business_state.has_content,
        $node.data_map.business_zip.has_content,
        $node.data_map.country.has_content )}
<div class="crm_address_info right">
    <span class="client_info_left">Business Address:</span>
    <span class="client_info_right">
    {if $node.data_map.business_address.has_content}
        {attribute_view_gui attribute=$node.data_map.business_address}<br>
    {/if}
    {if $node.data_map.business_city.has_content}
        {attribute_view_gui attribute=$node.data_map.business_city},
    {/if}
    {if $node.data_map.business_state.has_content}
        {attribute_view_gui attribute=$node.data_map.business_state}
    {/if}
    {if $node.data_map.business_zip.has_content}
        {attribute_view_gui attribute=$node.data_map.business_zip}<br>
    {/if}
    {if $node.data_map.country.has_content}
        {attribute_view_gui attribute=$node.data_map.country}
    {/if}
    </span>
</div><!-- .crm_address_info -->
<hr>
{/if}

{if $node.data_map.home_phone.has_content}
    <span class="client_info_left">Home Phone:</span>
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.home_phone}
    </span>
{/if}

</div><!-- ends client_info -->
</div><!-- ends content_left -->
</div><!-- ends content_left_wrapper -->

<div class="right_content_wrapper">{* This div ends in the middle of the crm_pending activities include below *}
{* Include some templates for outputting relevant content *}
    {include uri="design:parts/admin_preview/crm_contact_notes.tpl" node=$node}
    {include uri="design:parts/admin_preview/crm_opportunities_list.tpl" node=$node}
    {include uri="design:parts/admin_preview/crm_pending_activities.tpl" node=$node}
    {include uri="design:parts/admin_preview/crm_recent_activities.tpl" node=$node}
</div> <!-- end crm-preview -->


{literal}
<script type="text/javascript">
gradualFader.init() //activate gradual fader
</script>
{/literal}