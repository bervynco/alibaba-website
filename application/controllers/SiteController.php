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

    public function createAboutReturnArray($name, $link, $data, $id, $overallID){
        return array('title' => $name, 'link' => $link, 'body' => $data, 'id' => $id,  'overall_id' => $overallID);
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
        // print_r($arrContentDetail);
        // echo '<br>';
        $productIndex = array_search('products', array_column($arrContentDetail, 'link'));
        $visionIndex = array_search('vision', array_column($arrContentDetail, 'link'));
        $processIndex = array_search('process', array_column($arrContentDetail, 'link'));

        $arrProducts = $this->createAboutReturnArray(
                            $arrContentDetail[$productIndex]['title'],
                            $arrContentDetail[$productIndex]['link'],
                            $this->site_model->selectProductData($arrOverallDetail['id'], $arrContentDetail[$productIndex]['id']),
                            $productIndex + 1,
                            $arrContentDetail[$productIndex]['overall_id']
        );

        $arrVision = $this->createAboutReturnArray(
                            $arrContentDetail[$visionIndex]['title'],
                            $arrContentDetail[$visionIndex]['link'],
                            $this->site_model->selectVisionData($arrOverallDetail['id'], $arrContentDetail[$visionIndex]['id']),
                            $visionIndex + 1,
                            $arrContentDetail[$visionIndex]['overall_id']
        );
        
        $arrProcess = $this->site_model->selectProcessData($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id']);
        
        foreach($arrProcess as $index => $row){
            $arrProcess[$index]['steps'] = $this->site_model->selectProcessDetail($arrOverallDetail['id'], $arrContentDetail[$processIndex]['id'], $row['id']);
        }
        $arrNewProcess = $this->createAboutReturnArray(
                            $arrContentDetail[$processIndex]['title'],
                            $arrContentDetail[$processIndex]['link'],
                            $arrProcess,
                            $processIndex + 1,
                            $arrContentDetail[$processIndex]['overall_id']
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

    public function updateTitleInfo(){
        $postData = json_decode(file_get_contents('php://input'), true);
        print_r($postData);
        $truncateResponse = $this->site_model->truncateTable('home');
        print_r($truncateResponse);

        if($truncateResponse){
            foreach($postData as $index => $titleContent){
                $insertRows = $this->site_model->insertTitle($titleContent);
            }
        }
        
        

    }
    public function updateVisionMission(){
        $errorFlag = 0;
        $postData = json_decode(file_get_contents('php://input'), true);
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

    public function updateProductInfo(){
        $errorFlag = 0;
        $postData = json_decode(file_get_contents('php://input'), true);

        foreach($postData['body'] as $index => $body){
            $id = (int) $body['id'];
            if($id == 0){
                // INSERT
                $updateInfo = $this->site_model->insertNewProduct($body, $postData['overall_id'], $postData['id']);
                if($updateInfo == 0){
                    $errorFlag = 1;
                }
            }
            else {
                // UPDATE
                $insertInfo = $this->site_model->updateProductInfo($body, $postData['overall_id'], $postData['id']);
                if($insertInfo == 0){
                    $errorFlag = 1;
                }
            }
        }
        if($errorFlag == 1)
            echo "Error";
        else
            echo "Successful";
    }
}
