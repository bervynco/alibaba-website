<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class UserController extends CI_Controller
{
    public function signIn(){
        $arrColumns = array('username', 'password');
        $postData = json_decode(file_get_contents('php://input'), true);

        $postData['password'] = md5($postData['password']);
        
        $response = $this->user_model->signIn($postData);

        if($response == 1){
            $encryptedAuth = md5('authenticated');
            $this->session->set_userdata('authenticated', $encryptedAuth);
            echo $encryptedAuth;
        }
        else{
            echo null;
        }    
    }

    public function signOut(){
        $this->session->unset_userdata('authenticated');
    }
}
?>