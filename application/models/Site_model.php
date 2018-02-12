<?php
class site_model extends CI_Model {

    function selectOverallData(){
        $query = $this->db->select(array('id', 'home_id', 'contact_id'))->order_by("timestamp", "asc")->get('overall');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }
    function selectHomeData($id){
        $query = $this->db->select(array('title', 'body', 'image'))->where('id', $id)->get('home');
        return $query->first_row();
        // return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectContactData($id){
        $query = $this->db->select(array('id', 'telephone', 'mobile', 'email', 'address'))->where('id', $id)->get('contact');
        return $query->first_row();
        // return($query->num_rows() > 0) ? $query->result_array(): array();
    }
    
    function selectContentData($id){
        $query = $this->db->select(array('id', 'overall_id', 'title', 'link'))->where('overall_id', $id)->get('content');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectProductData($overallID, $contentID){
        $query = $this->db->select(array('id', 'overall_id', 'content_id', 'name', 'description', 'image'))
                ->where('overall_id', $overallID)
                ->where('content_id', $contentID)
                ->get('body');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectVisionData($overallID, $contentID){
        $query = $this->db->select(array('id', 'name', 'description', 'image'))
                ->where('overall_id', $overallID)
                ->where('content_id', $contentID)
                ->get('body');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectProcessData($overallID, $contentID){
        // $query = $this->db->select(array('step.id', 'step.name', 'step.description', 'step.image', 'sub.id', 'sub.detail'))
        //                 ->join('sub', 'step.id = sub.step_id')
        //                 ->get('step');
        $query = $this->db->select(array('id', 'overall_id', 'content_id', 'name', 'description', 'image'))
                 ->where('overall_id', $overallID)
                 ->where('content_id', $contentID)
                 ->get('body');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectProcessDetail($overallID, $contentID, $bodyID){
        // $query = $this->db->select(array('step.id', 'step.name', 'step.description', 'step.image', 'sub.id', 'sub.detail'))
        //                 ->join('sub', 'step.id = sub.step_id')
        //                 ->get('step');
        $query = $this->db->select(array('id', 'overall_id', 'content_id', 'body_id', 'name', 'description', 'image', 'sub'))
                 ->where('overall_id', $overallID)
                 ->where('content_id', $contentID)
                 ->get('step');
        return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function updateContactInfo($detail){
        $query = $this->db->where('id', $detail['id'])
                          ->update(
                                'contact', 
                                array(
                                    'telephone' => $detail['telephone'],
                                    'email' => $detail['email'],
                                    'address' => $detail['address'],
                                    'mobile' => $detail['mobile'],
                                )
                            );
        return $this->db->affected_rows();
    }

    function updateVisionMission($contentID, $description){
        $query = $this->db->where('content_id', $contentID)
                          ->update(
                                'body', 
                                array(
                                    'description' => $description
                                )
                            );
        return $this->db->affected_rows();
    }

    function updateProductInfo($data, $overallID, $contentID){
        $query = $this->db
                ->where('content_id', $contentID)
                ->where('id', $data['id'])
                ->update(
                    'body', 
                    array(
                        'description' => $data['description'],
                        'name' => $data['name'],
                        'image'=> $data['image']
                    )
                );
        return $this->db->affected_rows();
    }

    function insertNewProduct($data, $overallID, $contentID){
        $data['overall_id'] = $overallID;
        $data['content_id'] = $contentID;
        $query = $this->db->insert('body', $data);
        return $this->db->insert_id();
    }
}
?>