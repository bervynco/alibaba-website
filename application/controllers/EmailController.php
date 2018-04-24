<?php

require 'PHPMailer/PHPMailerAutoload.php';
defined('BASEPATH') OR exit('No direct script access allowed');

class EmailController extends CI_Controller
{
    public function sendEmail(){
        $this->load->library("phpmailer_library");
        $mail = $this->phpmailer_library->load();
        $mail->isSMTP();
        //Enable SMTP debugging
        // 0 = off (for production use)
        // 1 = client messages
        // 2 = client and server messages
        $mail->SMTPDebug = 2;
        //Set the hostname of the mail server
        $mail->Host = 'smtp.mail.yahoo.com.';
        // use
        // $mail->Host = gethostbyname('smtp.gmail.com');
        // if your network does not support SMTP over IPv6
        //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
        $mail->Port = 465;
        //Set the encryption system to use - ssl (deprecated) or tls
        $mail->SMTPSecure = 'tls';
        //Whether to use SMTP authentication
        $mail->SMTPAuth = true;
        //Username to use for SMTP authentication - use full email address for gmail
        // $mail->Username = "username@gmail.com";
        // //Password to use for SMTP authentication
        // $mail->Password = "yourpassword";
        //Set who the message is to be sent from
        $mail->setFrom('from@example.com', 'First Last');
        //Set an alternative reply-to address
        $mail->addReplyTo('bervyn_co2010@yahoo.com', 'First Last');
        //Set who the message is to be sent to
        $mail->addAddress('bervyn_co2010@yahoo.com', 'First Last');
        //Set who the message is to be sent to
        $mail->addAddress('whoto@example.com', 'John Doe');
        //Set the subject line
        $mail->Subject = 'PHPMailer GMail SMTP test';
        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML('Hello World');
        //Replace the plain text body with one created manually
        $mail->AltBody = 'This is a plain-text message body';
        //send the message, check for errors
        if (!$mail->send()) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            echo "Message sent!";
        }
    }
}
