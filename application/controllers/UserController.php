<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class UserController extends CI_Controller
{
    public function assignDataToArray($postData, $arrColumns){
        $insertArray = array();
        foreach($arrColumns as $col){
            $insertArray[$col] = (!empty($postData[$col])) ? $postData[$col] : null;
        }
        // $insertArray['section'] = $section;
        return $insertArray;
    }

    public function isLoggedIn(){

    }
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
        // else{
        //     echo null;
        // }    
    }

    public function closeSession(){
        $characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
        $randomString = '';
        $max = strlen($characters) - 1;
        for ($i = 0; $i < 32; $i++) {
            $randomString .= $characters[mt_rand(0, $max)];
        }
        $encryptedString = md5($randomString);
        $insertId = $this->user_model->signOut($encryptedString);
    }

    public function signOut(){
        $this->session->unset_userdata('authenticated');
        // $this->closeSession();
        
    }
}
?>