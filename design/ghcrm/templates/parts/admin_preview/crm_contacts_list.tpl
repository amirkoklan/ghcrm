{* Template: crm_contacts_list.tpl
   Purpose: Get contacts of this organization
   Granite Horizon CRM *}

{def $count=fetch( 'content', 'list_count',
    hash( 'parent_node_id', $node.node_id,
            'class_filter_type', 'include',
            'class_filter_array', array( 'crm_contact' ) )
)}

<div class="content_right">
    <div class="crm-header">
        <h1>Contacts</h1>        
        {if ne($count, '0')}
            <div class="downbutton" style="display:none;">
                <a href="#"></a>
            </div><!-- ends downbutton -->

            <div class="upbutton" style="display:block;">
                <a href="#"></a>
            </div><!-- ends upbutton -->
        {else}
            <div class="no_contacts">(No Contacts)</div><!-- ends no_content -->
        {/if}
    </div><!-- ends crm-header -->

    {* Add New Contact button *}
    <form class="form_button_dropdown" method="post" action={"/content/action"|ezurl()}>
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="NodeID" value="{$node.node_id}" />
        <input type="hidden" name="ClassIdentifier" value= "crm_contact"/>
        <input type="hidden" name="ContentLanguageCode" value="{$node.object.current_language}" />
        <input type="hidden" name="NewButton" value="Here" />
        <input type="hidden" name="ViewMode" value="full" />
        <input type="hidden" name="ContentObjectID" value="{$node.parent.contentobject_id}" />
        <input type="hidden" name="SortingField" value="6" />
        <input type="hidden" name="SortingOrder" value="1" />
        <input id="add_contact_small" type="submit" class="add_new_button_dropdown" value="" />
    </form>

    {if ne($count, '0')}
        <div class="container" style="display:block;">
    {else}
        <div class="container" style="display:none;">
    {/if}

{def $counter=0}

    <ul>
        {foreach $node.children as $child}
            {if eq($child.object.content_class.identifier,'crm_contact')}
                {set $counter=inc( $counter )}
                <li>
                    <span class="contacts_list">{node_view_gui content_node=$child view='line'}</span>
                    {if $child.can_edit}
                        <a href="{concat( 'content/edit/', $child.contentobject_id )|ezurl('no')}">
                            <img src={'edit.gif'|ezimage} alt="Edit" title="Edit {$child.name|wash()}" />
                        </a>
                    {else}
                        <img src="{'edit-disabled.gif'|ezimage('no')}" alt="Edit" title="You do not have permission to edit {$child.name|wash()}." />
                    {/if}
        
                    {if ne($count, $counter)}    
                        <hr>
                    {/if}
                </li>
            {/if}
        {/foreach}
    </ul>

{undef $counter $count}

    </div><!-- ends .container -->
</div><!-- ends content_right-->