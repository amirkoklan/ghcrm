{* Template: crm_email_eztext_body.tpl 
   Purpose: This template allow the user to select the body of an email based on pre-written templates from a library of such templates
   Granite Horizon CRM *}

{def $ghcrm_node_id = ''
     $container_node_id = ezini( 'CRMNodeSettings', 'EmailTemplateContainerNode', 'ghcrm.ini' )}

{if is_set( $container_node_id )}
    {set $ghcrm_node_id = ezini( 'CRMNodeSettings', 'EmailTemplateContainerNode', 'ghcrm.ini' )}
{else}
    {set $ghcrm_node_id = ezini( 'CRMNodeSettings', 'RootNode', 'ghcrm.ini' )}
{/if}

{def $email_body = $attribute.content|wash
     $templates = fetch( 'content', 'tree', hash(
        'parent_node_id', $ghcrm_node_id,
        'class_filter_type', 'include',
        'class_filter_array', array( 'crm_email_template' ),
        'sort_by', array( 'class_name', false() ) ) )}

{* Create a dropdown box for users to choose which email template to use. All email templates below EmailTemplateContainerNode will be found and included in the list. *}

<p>Begin writing or clear text below and subject by selecting an email template from the drop down list.&nbsp;
    <select id="email-template-select">
        <option value="">Empty Email Body</option>
        <option value="{$attribute.object.main_node.data_map.email_body.content|wash}" subject="{$attribute.object.main_node.data_map.email_subject.content|wash}">Revert to Saved</option>
        {foreach $templates as $template}
            <option value="{$template.object.data_map.template_email_body.content|wash()}" subject="{$template.object.data_map.template_email_subject.content|wash()}">{$template.object.name|wash()}</option>
        {/foreach}
    </select>
</p>

{* Grab the subject line from the email template *}
{def $subject_contentclassattribute_id = ''}

{foreach $attribute.object.contentobject_attributes as $these_attributes}
    {if $these_attributes.contentclass_attribute_identifier|eq('email_subject')}
        {set $subject_contentclassattribute_id = $these_attributes.contentclassattribute_id}
    {/if}
{/foreach}    

{* The "default" below is from design/.../eztext.tpl *}
{default attribute_base='ContentObjectAttribute'
         html_class='full'}

    <textarea id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_text_{$attribute.id}" cols="70" rows="{$attribute.contentclass_attribute.data_int1}">{$email_body}</textarea>

{/default}

<script type="text/javascript">

{literal}
<!--
$(document).ready(function(){
    $('#email-template-select').click(function(){
        templateSelectSubject = $('option:selected', this).attr('subject');
        templateSelect = $('#email-template-select').val();
        templateSelect = templateSelect.replace(/<br \/><br \/>/gi, '\n');
        templateSelect = templateSelect.replace('[FirstName]', '{/literal}{$attribute.object.main_node.parent.data_map.first_name.content|wash}{literal}');
        templateSelect = templateSelect.replace('[LastName]', '{/literal}{$attribute.object.main_node.parent.data_map.last_name.content|wash}{literal}');
        
        // apply the content to the text box
        $('#{/literal}ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}{literal}').val(templateSelect);
        
        // also apply the subject line to the subject box
        $('#{/literal}ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$subject_contentclassattribute_id}_email_subject{literal}').val(templateSelectSubject);
    });
});
-->
{/literal}

</script>