{* Template: crm_pending_activities.tpl
   Purpose: 
   Granite Horizon CRM *}

<div class="pending_activities_right">
    {* Add New Activity button *}
    <div>
        <form method="post" action={"/content/action"|ezurl()}>
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ClassID" value="46" />
            <input type="hidden" name="ContentLanguageCode" value="{$node.object.current_language}" />
            <input type="hidden" name="NewButton" value="Here" />
            <input type="hidden" name="ViewMode" value="full" />
            <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
            <input type="hidden" name="SortingField" value="6" />
            <input type="hidden" name="SortingOrder" value="1" />
            <input onmouseover='this.src={"add_new_button_hover.png"|ezimage()}'
                    onmouseout='this.src={"add_new_button.png"|ezimage()}'
                    type="image" src={"add_new_button.png"|ezimage()} class="pending_button" value="Submit" alt="Submit" />
               <div class="add_new_text pending_activities">Add New <br />Activity</div><!-- ends add_new_text -->
        </form>
    </div>
</div><!-- ends pending_activities_right-->
</div><!-- ends right_content_wrapper -->

{def $activities=fetch('content','tree', hash( 'parent_node_id', $node.node_id,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array('crm_activity', 'crm_email'),
                                               'sort_by', array('attribute',true(),'crm_activity/date_scheduled')))}

<table class="list">
    <tr>
        <th>Pending Activity</th>
        <th>Scheduled</th>
        <th>Type</th>
        <th>Assigned To</th>
        <th>&nbsp;</th>
    </tr>
    {foreach $activities as $activity sequence array( 'bglight', 'bgdark' ) as $style}
        {if eq($activity.data_map.date_completed.has_content,false())}
            <tr class='{$style}'>
                <td>{node_view_gui content_node=$activity view='line'}</td>
                <td>{attribute_view_gui attribute=$activity.data_map.date_scheduled}{if gt(currentdate(),$activity.data_map.date_scheduled.content.timestamp)} (overdue){/if}</td>
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