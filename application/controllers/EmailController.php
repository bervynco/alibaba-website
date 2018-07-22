<?php

require 'PHPMailer/PHPMailerAutoload.php';
defined('BASEPATH') OR exit('No direct script access allowed');

class EmailController extends CI_Controller
{
    public function sendEmail(){
        $this->load->library("Phpmailer_library");
        $postData = json_decode(file_get_contents('php://input'), true);
        
        $mail = $this->phpmailer_library->load();
        $mail->isSMTP();
        $mail->SMTPDebug = 0;
        //Set the hostname of the mail server
        $mail->Host = 'smtp.gmail.com.';
        $mail->Port = 587;
        //Set the encryption system to use - ssl (deprecated) or tls
        $mail->SMTPSecure = 'tls';
        //Whether to use SMTP authentication
        $mail->SMTPAuth = true;
        //Username to use for SMTP authentication - use full email address for gmail
        $mail->Username = "cbsnoreplygeneric@gmail.com";
        // //Password to use for SMTP authentication
        $mail->Password = "123cbs123";
        //Set who the message is to be sent from
        $mail->setFrom('cbsnoreplygeneric@gmail.com', 'Website Inquiry');
        //Set who the message is to be sent to
        $mail->addAddress('fdsf_faam@yahoo.com', 'Frank and David Snack Food Corporation');
        $mail->addCc($postData['email'], $postData['name']);
        $mail->addBcc('bervyn_co2010@yahoo.com', "Bervyn Co");
        //Set the subject line
        $mail->Subject = 'An Email from alibabachips.com';
        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML($postData['message']);
        //send the message, check for errors
        if (!$mail->send()) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            echo "Message sent!";
        }
    }
}
