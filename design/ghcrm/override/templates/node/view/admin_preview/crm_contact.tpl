{* Admin preview of CRM Contact *}
<div class="crm-preview"> 

<div class="crm-header">
<h2 class="no_website"> 
    {attribute_view_gui attribute=$node.data_map.first_name} {attribute_view_gui attribute=$node.data_map.last_name}
    <span class="contact_icon"></span>
</h2>
</div><!-- ends crm-header -->


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
    {if $node.data_map.id_photo.has_content}
        <div class="contact_photo" style="float:right;">
            {attribute_view_gui attribute=$node.data_map.id_photo image_class=medium}
        </div><!-- ends contact_photo -->
    {/if}

{if $node.data_map.title.has_content}
    <span class="client_info_left">Title:</span>
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.title}
    </span>
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
{/if}

{if $node.data_map.fax.has_content}
    <span class="client_info_left">Fax:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.fax}
    </span>        
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
{if $node.data_map.email.has_content}
    <a href="mailto:{$node.data_map.email.content|wash()}">
        <img class="gradualfader" src={'images/email.png'|ezdesign()} alt="{$node.data_map.email.content|wash()}" height="32px" width="32px" />
    </a>
{/if}

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

{if $node.data_map.notes.has_content}
    <span class="client_info_left">Notes:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.notes}
    </span>
    <hr>
{/if}

{if $node.data_map.contact_notes.has_content}
    <span class="client_info_left">Contact Notes:</span> 
    <span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.contact_notes}
    </span>
    <hr>
{/if}

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

{if $node.data_map.country.has_content}
<span class="client_info_left">Home:</span>
<span class="client_info_right">
    <address>
        {if $node.data_map.home_address.has_content}{attribute_view_gui attribute=$node.data_map.home_address}{/if}

        {if $node.data_map.home_city.has_content}{if $node.data_map.home_address.has_content}, {/if}{attribute_view_gui attribute=$node.data_map.home_city}{/if}

        {if $node.data_map.home_state.has_content}{attribute_view_gui attribute=$node.data_map.home_state}{/if}

        {if $node.data_map.home_zip_code.has_content}{attribute_view_gui attribute=$node.data_map.home_zip_code}{/if}

        {if $node.data_map.country.has_content}{attribute_view_gui attribute=$node.data_map.country}{/if}
    </address>
</span>
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

<div class="right_content_wrapper">{* This div ends in the middle of the crm_pending activities include below *}
{* Include some templates for outputting relevant content *}
    {include uri="design:parts/admin_preview/crm_projects_list.tpl" node=$node}
    {include uri="design:parts/admin_preview/crm_pending_activities.tpl" node=$node}
    {include uri="design:parts/admin_preview/crm_recent_activities.tpl" node=$node}
</div> <!-- end crm-preview -->


{literal}
<script type="text/javascript">
gradualFader.init() //activate gradual fader
</script>
{/literal}