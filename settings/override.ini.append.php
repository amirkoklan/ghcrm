<?php /* #?ini charset="utf-8"?
# File: override.ini.append.php 
# Purpose: Lists template overrides for Granite CRM
# Granite Horizon CRM

[crm_organization_preview]
Source=node/view/admin_preview.tpl
MatchFile=node/view/admin_preview/crm_organization.tpl
Subdir=templates
Match[class_identifier]=crm_organization

[crm_contact_preview]
Source=node/view/admin_preview.tpl
MatchFile=node/view/admin_preview/crm_contact.tpl
Subdir=templates
Match[class_identifier]=crm_contact

[crm_email_message_select]
Source=content/datatype/edit/eztext.tpl
MatchFile=edit/crm_email_eztext_body.tpl
Subdir=templates
Match[class_identifier]=crm_email
Match[attribute_identifier]=email_body

[crm_email_admin_preview]
Source=node/view/admin_preview.tpl
MatchFile=node/crm_email_admin_preview.tpl
Subdir=templates
Match[class_identifier]=crm_email

[crm_opportunity_admin_preview]
Source=node/view/admin_preview.tpl
MatchFile=node/crm_opportunity_admin_preview.tpl
Subdir=templates
Match[class_identifier]=crm_opportunity

[crm_activity_admin_preview]
Source=node/view/admin_preview.tpl
MatchFile=node/crm_activity_admin_preview.tpl
Subdir=templates
Match[class_identifier]=crm_activity

[crm_email_verify_send_edit_attribute]
Source=content/edit_attribute.tpl
MatchFile=edit_attribute/crm_email.tpl
Subdir=templates
Match[class_identifier]=crm_email
#Match[attribute_identifier]=send_email

[crm_email_edit]
Source=content/edit.tpl
MatchFile=edit/crm_email.tpl
Subdir=templates
Match[class_identifier]=crm_email

[crm_sales]
Source=node/view/full.tpl
MatchFile=node/crm_dashboard.tpl
Subdir=templates
Match[node]=

[crm_organization_line]
Source=content/view/line.tpl
MatchFile=line/crm_organization.tpl
Subdir=templates
Match[class_identifier]=crm_organization

[crm_contact_line]
Source=content/view/line.tpl
MatchFile=line/crm_contact.tpl
Subdir=templates
Match[class_identifier]=crm_contact

[crm_activity_line]
Source=content/view/line.tpl
MatchFile=line/crm_activity.tpl
Subdir=templates
Match[class_identifier]=crm_activity

[crm_opportunity_line]
Source=content/view/line.tpl
MatchFile=line/crm_opportunity.tpl
Subdir=templates
Match[class_identifier]=crm_opportunity

[crm_email_line]
Source=content/view/line.tpl
MatchFile=line/crm_email.tpl
Subdir=templates
Match[class_identifier]=crm_email

[crm_email_datatype]
Source=content/datatype/view/ezemail.tpl
MatchFile=content/datatype/view/ezemail.tpl
Subdir=templates

*/ ?>
