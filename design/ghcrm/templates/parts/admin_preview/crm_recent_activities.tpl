{* Template: crm_recent_activities.tpl
   Purpose: 
   Granite Horizon CRM *}

<b>Recent Activities</b>
{def $activities=fetch('content', 'tree', hash( 'parent_node_id', $node.node_id,
                                          'class_filter_type', 'include',
                                          'class_filter_array', array('crm_activity'),
                                          'sort_by', array( 'attribute',false(),'crm_activity/date_completed')))}
<table class="list">
    <tr>
        <th>Activity</th>
        <th>Completed</th>
        <th>Type</th>
        <th>Assigned To</th>
        <th>&nbsp;</th>
    </tr>
    {foreach $activities as $activity sequence array( 'bglight', 'bgdark' ) as $style}
        {if eq($activity.data_map.date_completed.has_content,true())}
            <tr class='{$style}'>
                <td>{node_view_gui content_node=$activity view='line'}</td>
                <td>{attribute_view_gui attribute=$activity.data_map.date_completed}</td>
                <td>{attribute_view_gui attribute=$activity.data_map.type}</td>
                <td>{if $activity.data_map.assigned_to.has_content}{attribute_view_gui attribute=$activity.data_map.assigned_to}{/if}</td>
                <td>
                    {if $activity.can_edit}
                        <a href="{concat( 'content/edit/', $activity.contentobject_id )|ezurl('no')}">
                            <img src={'edit.gif'|ezimage} alt="Edit" title="Edit {$activity.name|wash()}" />
                        </a>
                    {else}
                        <img src="{'edit-disabled.gif'|ezimage('no')}" alt="Edit" title="You do not have permission to edit {$activity.name|wash()}." />
                    {/if}
                </td>
            </tr>
        {/if}
    {/foreach}
</table>

{undef $activities}