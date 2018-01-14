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

    public function createAboutReturnArray($name, $link, $data){
        return array('title' => $name, 'link' => $link, 'body' => $data);
    }
    public function objectToArray($data){
        return json_decode(json_encode($data), true);
    }

    public function getAllSiteData(){
        $siteData = array();
        $arrOverallDetail = $this->site_model->selectOverallData()[0];
        
        $arrHomeDetail = $this->createReturnArray('home', 
                            $this->site_model->selectHomeData($arrOverallDetail['home_id']));
        $arrContactDetail = $this->createReturnArray('contact', 
                            $this->site_model->selectContactData($arrOverallDetail['contact_id']));
        
        $arrContentDetail = $this->site_model->selectContentData($arrOverallDetail['id']);
        $productIndex = array_search('products', array_column($arrContentDetail, 'link'));
        $visionIndex = array_search('vision', array_column($arrContentDetail, 'link'));
        $processIndex = array_search('process', array_column($arrContentDetail, 'link'));

        $arrProducts = $this->createAboutReturnArray(
                            $arrContentDetail[$productIndex]['title'],
                            $arrContentDetail[$productIndex]['link'],
                            $this->site_model->selectProductData($arrOverallDetail['id'], $arrContentDetail[$productIndex]['id'])
        );

        $arrVision = $this->createAboutReturnArray(
                            $arrContentDetail[$visionIndex]['title'],
                            $arrContentDetail[$visionIndex]['link'],
                            $this->site_model->selectVisionData($arrOverallDetail['id'], $arrContentDetail[$visionIndex]['id'])
        );
        
        $arrProcess = $this->site_model->selectProcessData($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id']);
        
        foreach($arrProcess as $index => $row){
            $arrProcess[$index]['steps'] = $this->site_model->selectProcessDetail($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id'], $row['id']);
        }
        $arrNewProcess = $this->createAboutReturnArray(
                            $arrContentDetail[$processIndex]['title'],
                            $arrContentDetail[$processIndex]['link'],
                            $arrProcess
        );
        $aboutDetail = array();
        array_push($aboutDetail, $arrProducts);
        array_push($aboutDetail, $arrVision);
        array_push($aboutDetail, $arrNewProcess);

        $arrAboutDetail = array('section' => 'about', 'content' => $aboutDetail);
        array_push($siteData, $arrHomeDetail);
        array_push($siteData, $arrAboutDetail);
        array_push($siteData, $arrContactDetail);
        
        echo json_encode($siteData);
    }
}
