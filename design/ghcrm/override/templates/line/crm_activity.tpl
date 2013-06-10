{* Template: crm_activity.tpl
   Purpose: CRM Activity Line View
   Granite Horizon CRM *}

{def $contact = ""
        $organization_name = ""
        $org_url = ""
        $contact_phone = ""
        $contact_email = ""
        $contact_url = ""

        $contact_name = ""}

{def $timestamp=currentdate()}

{if eq( $object.parent.class_identifier, "crm_contact" )}
 {set $organization_name = $object.parent.parent.data_map.name.content
        $org_url = $object.parent.parent.url_alias
        $contact_phone = $object.parent.data_map.phone_1.content
        $contact_email = $object.parent.data_map.email.content
        $contact_url = $object.parent.url_alias
        $contact_name = concat( $object.parent.data_map.first_name.content, " ", $object.parent.data_map.last_name.content )}
{elseif eq( $object.parent.class_identifier, "crm_organization" )}
 {set $contact = fetch( 'content', 'list', hash( 'parent_node_id', $object.parent_node_id,
                                                       'offset', 0,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array( 'crm_contact' ),
                                                       'limit', 1) )}

  {if is_set( $contact.0 )}
    {set $contact = $contact.0
        $organization_name = $object.parent.data_map.name.content
        $org_url = $object.parent.url_alias
        $contact_email = $contact.data_map.email.content
        $contact_phone = $contact.data_map.phone_1.content
        $contact_url = $contact.url_alias
        $contact_name = concat( $contact.data_map.first_name.content, " ", $contact.data_map.last_name.content )}
  {else}
        {set $contact_email = "No Contact"
                $contact_phone = "None"
                $contact_url="#"
                $contact_name="No Contact"}
  {/if}

{/if}

<tr>
        <td>
        {if ne($contact_name, "")}
            <a href={$contact_url|ezurl()}>{$contact_name}</a>
        {else}
            None
        {/if}
        </td>
        <td>{if ne( $organization_name, "" )}<a href={$org_url|ezurl()}>{$organization_name|wash()}</a>{else}None{/if}</td>
        <td>{if $object.data_map.type.has_content}{attribute_view_gui attribute=$object.data_map.type}{/if}</td>
        <td>{if $object.data_map.name.has_content}<a href={$object.url_alias|ezurl()}>{$object.data_map.name.content}</a>{else}None{/if}</td>
        <td>
        {if ne($contact_phone, "" )}
            {$contact_phone|wash()}
        {else}
            {'-'|wash()}
        {/if}
        </td>
        <td><a href="mailto:{$contact_email|wash()}"><img class="gradualfader" src={'images/email.png'|ezdesign()} alt="{$contact_email|wash()}" height="32px" width="32px" /></a></td>
        <td>{if $object.data_map.assigned_to.has_content}{attribute_view_gui attribute=$object.data_map.assigned_to}{else}{'-'|wash()}{/if}</td>
    <td>
        {if $object.data_map.date_scheduled.has_content}
            {if lt($object.data_map.date_scheduled.data_int, $timestamp )}
                <span class="past_due">
            {/if}
                {$object.data_map.date_scheduled.content.timestamp|datetime('custom','%n/%d/%Y')}
            {if lt($object.data_map.date_scheduled.data_int, $timestamp )}
                </span>
            {/if}
        {else}
            None
        {/if}
    </td>
    <td>
    {if $object.can_edit}
        <a href={concat( 'content/edit/', $object.contentobject_id )|ezurl()}>
            <img src={'edit.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/dashboard/latest_content' )}" title="{'Edit <%child_name>.'|i18n( 'design/admin/dashboard/latest_content',, hash( '%child_name', $object.name) )|wash}" />
         </a>
    {else}
         <img src={'edit-disabled.gif'|ezimage()} alt="{'Edit'|i18n( 'design/admin/dashboard/latest_content' )}" title="{'You do not have permission to edit <%child_name>.'|i18n( 'design/admin/dashboard/latest_content',, hash( '%child_name', $child_name ) )|wash}" />
    {/if}
    </td>
</tr>

{undef $organization_name $org_url $contact $contact_url $contact_name $contact_email $contact_phone $timestamp}