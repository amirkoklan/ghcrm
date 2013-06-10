{* Template: crm_latest_sales_content.tpl
   Purpose: CRM Latest Sales Content Line View
   Granite Horizon CRM *}

{def $name = false()}

{if is_unset( $object.data_map.name )}
    {if and(is_set( $object.data_map.first_name), is_set( $object.data_map.last_name ))}
        {set $name = concat( $object.data_map.first_name.content, $object.data_map.last_name.content )}
    {/if}
{elseif is_set($object.data_map.title.content)}
    {set $name = $object.data_map.title.content}
{else}
    {set $name = $object.data_map.name.content}
{/if}

<tr>
    <td>
        <a href="{$object.url_alias|ezurl('no')}" title="{$object.name|wash()}">
            {$object.name|shorten('30')|wash()}
        </a>
    </td>
    <td>{$object.class_name|remove(0, 4)}</td>
    <td>{$object.object.modified|datetime('custom', '%n/%d/%Y')}</td>
    <td>{$object.object.owner.name|wash()}</td>
    <td>&nbsp;</td>
</tr>

{undef $name}