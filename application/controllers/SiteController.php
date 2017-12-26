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
        return array('section' => $section, 'content' => array($data));
    }

    public function objectToArray($data){
        return json_decode(json_encode($data), true);
    }
    public function getAllSiteData(){
        $siteData = array();
        
        $arrHomeDetail = $this->site_model->selectHomeData();
        $homeData = $this->createReturnArray('home', $arrHomeDetail);
        $arrContactDetail = $this->site_model->selectContactData();
        $contactData = $this->createReturnArray('contact', $arrContactDetail);
        
        array_push($siteData, $homeData);
        array_push($siteData, array());
        array_push($siteData, $contactData);
        
        echo json_encode($siteData);
    }
}
