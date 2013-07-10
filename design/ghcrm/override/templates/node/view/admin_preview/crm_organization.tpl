{* Template: crm_organization.tpl
   Purpose: CRM Organization in Admin Preview
   Granite Horizon CRM *}

<div class="crm-preview">
    <div class="crm-header">

    {if $node.data_map.website.has_content}
        <h2>
            <a class="title" href="{$node.data_map.website.content}" target="_blank" title="{$node.data_map.name.content|wash()} - website">{$node.data_map.name.content|wash()}<span class="website_icon"></span>
            </a>
        </h2>
    {else}
        <h2 class="no_website">{$node.data_map.name.content|wash()}<span class="website_icon"></span></h2>
    {/if}

    <div class="header_right">
        {if $node.data_map.industry.has_content}
            {if $node.data_map.industry.content.relation_list.0.in_trash|not()}
                {def $item = $node.data_map.industry.content.relation_list.0}
                <strong>Industry: </strong>{content_view_gui view=embed content_object=fetch( content, object, hash( object_id, $item.contentobject_id ) )} 
            {/if}
        {elseif $node.data_map.industry_old.has_content}
            <strong>Industry: </strong>{attribute_view_gui attribute=$node.data_map.industry_old}
        {/if}

    {if eq($node.data_map.industry.has_content, 0)}
        {if $node.data_map.relationship_level.has_content}
            <span class="stars chrome_margin" title="{$node.data_map.relationship_level.content|wash()}/5">{$node.data_map.relationship_level.content|wash()}</span>
        {else}
            <span class="stars">0</span> (please assign a relationship level!)
        {/if}
    {else}

        {if $node.data_map.relationship_level.has_content}
            <span class="stars" title="{$node.data_map.relationship_level.content|wash()}/5">{$node.data_map.relationship_level.content|wash()}</span>
        {else}
            <span class="stars">0</span> (please assign a relationship level!)
        {/if}
    {/if}
    </div><!-- ends header_right -->

    </div><!-- .crm-header -->

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
{if or( $node.data_map.phone_1.has_content,
        $node.data_map.phone_2.has_content )}
    <div class="crm_phone_numbers">
    {if $node.data_map.phone_1.has_content}
        <span class="client_info_left">Phone: </span><span class="client_info_right">{attribute_view_gui attribute=$node.data_map.phone_1}</span>
    {/if}
    {if $node.data_map.phone_2.has_content}
       <span class="client_info_left">Phone: </span><span class="client_info_right">{attribute_view_gui attribute=$node.data_map.phone_2}</span>
    {/if}
    </div><!-- .crm_phone_numbers -->
<hr>
{/if}

{if or( $node.data_map.address.has_content,
        $node.data_map.city.has_content,
        $node.data_map.state.has_content,
        $node.data_map.zip.has_content,
        $node.data_map.country.has_content )}
<div class="crm_address_info right">
    <span class="client_info_left">Address:</span>
    <span class="client_info_right">
    {if $node.data_map.address.has_content}
        {attribute_view_gui attribute=$node.data_map.address}<br>
    {/if}
    {if $node.data_map.city.has_content}
        {attribute_view_gui attribute=$node.data_map.city},
    {/if}
    {if $node.data_map.state.has_content}
        {attribute_view_gui attribute=$node.data_map.state}
    {/if}
    {if $node.data_map.zip.has_content}
        {attribute_view_gui attribute=$node.data_map.zip}<br>
    {/if}
    {if $node.data_map.country.has_content}
        {attribute_view_gui attribute=$node.data_map.country}
    {/if}
    </span>
</div><!-- .crm_address_info -->
<hr>
{/if}

{if $node.data_map.assigned_to.has_content}
<span class="client_info_left">Assigned to:</span>
<span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.assigned_to}
</span>
<hr>
{/if}

{if $node.data_map.referred_by.has_content}
<span class="client_info_left">Referred by:</span>
<span class="client_info_right">
        {attribute_view_gui attribute=$node.data_map.referred_by}
</span>
<hr>
{/if}

</div><!-- ends admin_content -->
</div><!-- ends content_left -->

<div class="content_left_notes">

<div class="crm-header">
    <h1>Organization Notes</h1>
	{if or($node.data_map.notes.has_content, $node.data_map.organization_notes.has_content)}
        <div class="downbutton" style="display:none;">
            <a href="#"></a>
        </div><!-- ends downbutton -->

        <div class="upbutton" style="display:block;">
            <a href="#"></a>
        </div><!-- ends upbutton -->
	{else}
        <div class="no_notes">(No Notes)</div><!-- ends no_notes -->
    {/if}

</div><!-- ends crm-header -->

	{if or($node.data_map.notes.has_content, $node.data_map.organization_notes.has_content)}
        <div class="container" style="display:block;">
    {else}
        <div class="container" style="display:none;">
	{/if}
{if $node.data_map.notes.has_content}
<div class="crm_organization_notes left">
    <span class="organization_notes_left">General</span><br>
    <span class="organization_notes_left">Notes:</span>
    <span class="client_info_right"><p>{attribute_view_gui attribute=$node.data_map.notes}</p></span>
</div><!-- .crm_organization_notes -->
<hr>
{/if}

{if $node.data_map.organization_notes.has_content}
<div class="crm_organization_notes left">
    <span class="organization_notes_left">Organization</span><br>
    <span class="organization_notes_left">Notes:</span>
    <span class="client_info_right"><p>{attribute_view_gui attribute=$node.data_map.organization_notes}</p></span>
</div><!-- .crm_organization_notes -->
{/if}

</div><!-- ends admin_content -->
</div><!-- ends content_left_notes -->
</div><!-- ends content_left_wrapper -->

<div class="right_content_wrapper">{* This div ends in the middle of the crm_pending activities include below *}

{include uri="design:parts/admin_preview/crm_contacts_list.tpl" node=$node}
{include uri="design:parts/admin_preview/crm_projects_list.tpl" node=$node}
{include uri="design:parts/admin_preview/crm_pending_activities.tpl" node=$node}
{include uri="design:parts/admin_preview/crm_recent_activities.tpl" node=$node}

</div> <!-- end crm-preview -->

{literal}
<script type="text/javascript">
gradualFader.init() //activate gradual fader
</script>
{/literal}