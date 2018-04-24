
<?php
    class PHPMailer_Library
    {
        public function __construct()
        {
            log_message('Debug', 'PHPMailer class is loaded.');
        }

        public function load()
        {
            require_once("./PHPMailer/PHPMailerAutoload.php");
            $objMail = new PHPMailer;
            return $objMail;
        }
    }
?>