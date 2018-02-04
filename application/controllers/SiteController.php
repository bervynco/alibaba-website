<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class SiteController extends CI_Controller
{
    public function assignDataToArray($postData, $arrColumns){
        $insertArray = array();
        foreach($arrColumns as $col){
            $insertArray[$col] = (!empty($postData[$col])) ? $postData[$col] : null;
        }
        // $insertArray['section'] = $section;
        return $insertArray;
    }

    public function returnArray($status, $message, $data = null){
        return array('status' => $status, 'message' => $message, 'data', $data);
    }

    public function createReturnArray($section, $data){
        return array('section' => $section, 'content' => array($data));
    }

    public function createAboutReturnArray($name, $link, $data, $id){
        return array('title' => $name, 'link' => $link, 'body' => $data, 'id' => $id);
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
                            $this->site_model->selectProductData($arrOverallDetail['id'], $arrContentDetail[$productIndex]['id']),
                            $productIndex + 1
        );

        $arrVision = $this->createAboutReturnArray(
                            $arrContentDetail[$visionIndex]['title'],
                            $arrContentDetail[$visionIndex]['link'],
                            $this->site_model->selectVisionData($arrOverallDetail['id'], $arrContentDetail[$visionIndex]['id']),
                            $visionIndex + 1
        );
        
        $arrProcess = $this->site_model->selectProcessData($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id']);
        
        foreach($arrProcess as $index => $row){
            $arrProcess[$index]['steps'] = $this->site_model->selectProcessDetail($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id'], $row['id']);
        }
        $arrNewProcess = $this->createAboutReturnArray(
                            $arrContentDetail[$processIndex]['title'],
                            $arrContentDetail[$processIndex]['link'],
                            $arrProcess,
                            $processIndex + 1
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

    public function updateVisionMission(){
        // $arrColumns = array('id', 'overall_id', 'content_id', 'name', 'description', 'image');
        //name
        $errorFlag = 0;
        $postData = json_decode(file_get_contents('php://input'), true);
        // $arrVisionMissionDetail = $this->assignDataToArray($postData, $arrColumns);
        foreach($postData['body'] as $index => $bodyContent){
            $visionMissionDetail = $this->site_model->updateVisionMission($postData['id'], $bodyContent['description']);
            if($visionMissionDetail == 1){
                $errorFlag = 1;
            }
        }
        
       if($errorFlag == 1){
           echo 'Error';
       }
       else {
           echo 'Successful';
       }

    }

    public function updateContactInfo(){
        $arrColumns = array('id', 'telephone', 'mobile', 'email', 'address');
        $postData = json_decode(file_get_contents('php://input'), true);
        $contact = $this->site_model->updateContactInfo($postData[0]);
        if($contact > 0){
            echo "Successful";
        }
        else{
            echo "Error";
        }

    }
}
