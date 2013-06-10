{* Template: crm_contact.tpl
   Purpose: CRM Contact Line View
   Granite Horizon CRM *}

<tr>
    <td><a href="{$object.url_alias|ezurl('no')}" title="{$object.name|wash()}">{$object.name|shorten('30')|wash()}</a></td>
    <td><a href={$object.parent.url_alias|ezurl()}>{$object.parent.data_map.name.content|trim(' ')}</a></td>
    {if $object.data_map.phone_1.has_content}
        <td>{$object.data_map.phone_1.content}</td>
    {elseif $object.data_map.phone_2.has_content}
        <td>{$object.data_map.phone_2.content}</td>
    {else}
        <td>{'-'|wash()}</td>
    {/if}

    {* Web 2.0 elements *}
    <td>
    {if or($object.data_map.email.has_content, $object.data_map.twitter_id.has_content, $object.data_map.skype_id.has_content, $object.data_map.linkedin_url.has_content, $object.data_map.blog.has_content)}

        {if $object.data_map.email.has_content}<a href="mailto:{$object.data_map.email.content|wash()}"><img class="gradualfader" src={'images/email.png'|ezdesign()} alt="{$object.data_map.email.content|wash()}" height="32px" width="32px" /></a>{/if}

        {if $object.data_map.twitter_id.has_content}<a href="http://twitter.com/{$object.data_map.twitter_id.content|wash()}"><img class="gradualfader" src={'images/twitter.png'|ezdesign()} alt="{$object.data_map.twitter_id.content|wash()}" height="32px" width="32px" /></a>{/if}

        {if $object.data_map.skype_id.has_content}<a href="skype:{$object.data_map.skype_id.content|wash()}?userinfo"><img class="gradualfader" src={'images/skype.png'|ezdesign()} alt="{$object.data_map.skype_id.content|wash()}" height="32px" width="32px" /></a>{/if}

        {if $object.data_map.linkedin_url.has_content}<a href="{$object.data_map.linkedin_url.content|wash()}"><img class="gradualfader" src={'images/linkedin.png'|ezdesign()} alt="{$object.data_map.linkedin_url.content|wash()}" height="32px" width="32px" /></a>{/if}

        {if $object.data_map.blog.has_content}<a href="{$object.data_map.blog.content|wash()}"><img class="gradualfader" src={'images/blog.png'|ezdesign()} alt="{$object.data_map.blog.content|wash()}" height="32px" width="32px" /></a>{/if}
    {else}
        {'-'|wash()}
    {/if}
    </td>

    <td>
    {if $object.can_edit}
        <a href="{concat( 'content/edit/', $object.contentobject_id )|ezurl('no')}">
            <img src={'edit.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/dashboard/latest_content' )}" title="{'Edit <%child_name>.'|i18n( 'design/admin/dashboard/latest_content',, hash( '%child_name', $object.name) )|wash}" />
        </a>
    {else}
    <img src="{'edit-disabled.gif'|ezimage('no')}" alt="{'Edit'|i18n( 'design/admin/dashboard/latest_content' )}" title="{'You do not have permission to edit <%child_name>.'|i18n( 'design/admin/dashboard/latest_content',, hash( '%child_name', $child_name ) )|wash}" />
    {/if}
    </td>
</tr>