<?php
/*
 * File: ghcrmemailactivitytype.php
 * Purpose: The purpose of this workflow event is to send a simple email through the GHCRM interface.
 * Granite Horizon CRM
 *
 */
require_once( 'autoload.php' );

class ghcrmEmailActivityType extends eZWorkflowEventType
{
    const WORKFLOW_TYPE_STRING = "ghcrmemailactivity";

    function ghcrmEmailActivityType()
    {
            $this->eZWorkflowEventType( ghcrmEmailActivityType::WORKFLOW_TYPE_STRING, 'GHCRM Email Activity' );
            $this->setTriggerTypes( array( 'content' => array( 'publish' => array( 'after' ) ) ) );
            eZDebug::writeDebug( 'ghcrmEmailActivityType :: Initialized class' );
    }

    function execute( $process, $event )
    {
        $crmlog = new eZLog();
        $crmlog->write( "Starting workflow ghcrmEmailActivityType::execute()", "ghcrm.log" );
                                             
        $currentDate = date("Y m d");

        $parameters = $process->attribute( 'parameter_list' );
        $objectID = $parameters['object_id'];
        $object = eZContentObject::fetch( $objectID );
        
        $node = $object->attribute( 'main_node' );
        $node_id = $node->NodeID;
        $data_map = $node->attribute( 'data_map' );

        $email_name = $data_map['name']->DataText;

        $from_name = $data_map['email_from_name']->DataText;
        $from_email_address = $data_map['email_from_address']->DataText;
        $bcc_address = $data_map['email_bcc']->DataText;
        
        $to_name = $data_map['email_to_name']->DataText;
        $subject = $data_map['email_subject']->DataText;
        $to_email_address = $data_map['email_to_address']->DataText;
        
        $email_body = $data_map['email_body']->DataText;
        $str2 = nl2br($email_body);
        $email_body = $str2;
       
        
        $file_attachment_object = $data_map['email_attachment'];
        $file_attachment = $file_attachment_object->attribute( 'content' );

        if ( $file_attachment)
        {
            $file_attachment_path = $file_attachment->filePath(); 
            $file_attachment_file_name = $file_attachment->attribute( 'original_filename' );
        }
        
        // make sure the user clicked "send email" and not just "send for publishing"
        $htmlSendEmail = $_REQUEST['PublishButton'];
        if ( $htmlSendEmail == 'Send Email Now' )
        {
            // Build the email
            $mail = new ezcMailComposer();
            $mail->from = new ezcMailAddress( $from_email_address, $from_name );
            $mail->addTo( new ezcMailAddress( $to_email_address, $to_name ) );
            $mail->addBcc( new ezcMailAddress( $bcc_address ) );
            $mail->subject = $subject;
            $mail->htmlText = $email_body;
                
            if ( $file_attachment )
            {
                $file_disposition = new ezcMailContentDispositionHeader();
                $file_disposition->fileName = $file_attachment_file_name;
                $file_disposition->disposition = 'attachment';
                $mail->addFileAttachment( $file_attachment_path, null, null, $file_disposition );
            }
            
            // Set Date Completed in Email object
            /* 

            TO BE COMPLETED
            eZContentFunctions::updateAndPublishObject( $object, $updateParams );
            */
            
            // Send the email
            $mail->build();
            $mail_transport = new ezcMailMtaTransport();
            $mail_transport->send( $mail ); 
        } // end send email
           
        if(1)
        {
            return eZWorkflowType::STATUS_ACCEPTED;
        }
        else
        {
            return eZWorkflowType::STATUS_CANCELLED;
        }
    }
}
eZWorkflowEventType::registerEventType( ghcrmEmailActivityType::WORKFLOW_TYPE_STRING, "ghcrmEmailActivityType" );
?>
