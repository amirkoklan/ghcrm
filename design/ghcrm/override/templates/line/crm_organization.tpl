{* Template: crm_organization.tpl
   Purpose: CRM Organization Line View
   Granite Horizon CRM *}

{def     $child_contacts = fetch( 'content', 'tree', hash( 'parent_node_id', $object.node_id,
                               'class_filter_array', array( 'crm_contact' ),
                               'class_filter_type', 'include') )}
<tr>
    <td><a href="{$object.url_alias|ezurl('no')}" title="{$object.name|wash()}">{$object.name|shorten('30')|wash()}</a></td>
    {if $object.data_map.city.has_content}
        <td>{$object.data_map.city.content|trim(' ,')}</td>
    {else}
        <td>{'-'|wash()}</td>
    {/if}
    {if $object.data_map.phone_1.has_content}
        <td>{$object.data_map.phone_1.content}</td>
    {else}
        <td>{'-'|wash()}</td>
    {/if}
    <td>
        {foreach $child_contacts as $contact}<a href="{$contact.url_alias|ezurl( 'no' )}">{$contact.data_map.first_name.content|wash()} {$contact.data_map.last_name.content|wash()}</a>{delimiter}, {/delimiter}{/foreach}
    </td>
    <td>
        {$object.object.modified|l10n('shortdate')}
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