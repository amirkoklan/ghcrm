{* Template: crm_project.tpl
   Purpose: CRM Project Line View
   Granite Horizon CRM *}

{*
{def status = hash( 0, "no contact",
        1, "initial contact",
        2, "mutual contact",
        3, "regular/frequent contact",
        4, "expressed interest",
        6, "discussing project",
        7, "pre-proposal",
        8, "RFP/RFI stage",
        9, "proposal submitted",
        10, "finalist presentation",
        11, "contract negotiations",
        12, "contract signed/client",
        13, "in development",
        14, "project completed",
        90, "project lost",
        91, "project cancelled" )}
*}

{def $org = false()}

{if eq($object.parent.object.class_name, 'CRM Organization')}
    {set $org = true()}
{/if}

<tr>
    <td>
        <a href={$object.url_alias|ezurl()}>
            {if $object.data_map.title.has_content}
                {$object.data_map.title.content|wash()}
            {else}
                Unknown
            {/if}
        </a>
    </td>
    <td>
        <a href={$object.parent.url_alias|ezurl()}>
            {if and($org, $object.parent.data_map.name.has_content)}
                {$object.parent.data_map.name.content|wash()}
            {else}
                Unknown
            {/if}
        </a>
    </td>
    <td>
        {if $object.data_map.status.has_content}
            {$object.data_map.status.content|wash()}
        {else}
            Unknown
        {/if}
    </td>
    <td>{$object.modified_subnode|datetime('custom', '%n/%d/%Y')}</td>
    <td>
        {if and($org, $object.parent.data_map.assigned_to.has_content)}
            {attribute_view_gui attribute=$object.parent.data_map.assigned_to}
        {else}
            {'-'|wash()}
        {/if}
    </td>
</tr>