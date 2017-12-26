<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class SiteController extends CI_Controller
{
    public function assignDataToArray($section, $postData, $arrColumns){
        foreach($arrColumns as $col){
            $insertArray[$col] = (!empty($postData[$col])) ? $postData[$col] : null;
        }
        $insertArray['section'] = $section;
        return $insertArray;
    }

    public function returnArray($status, $message, $data = null){
        return array('status' => $status, 'message' => $message, 'data', $data);
    }

    public function createReturnArray($section, $data){

    }

    public function objectToArray($data){
        return json_decode(json_encode($data), true);
    }
    public function getAllSiteData(){
        $siteData = array();
        $defaultColumns = array('section', 'title', 'body', 'image');
        $contactColumns = array('telephone', 'mobile', 'email', 'address');

        $arrHomeDetail = $this->objectToArray($this->site_model->selectHomeData());
        $homeData = $this->assignDataToArray('home', $arrHomeDetail, $defaultColumns);
        
        $arrContactDetail = $this->objectToArray($this->site_model->selectContactData());
        $contactData = $this->assignDataToArray('contact', $arrContactDetail, $contactColumns);
        
        array_push($siteData, $homeData);
        array_push($siteData, $contactData);
        echo json_encode($siteData);
    }
}
