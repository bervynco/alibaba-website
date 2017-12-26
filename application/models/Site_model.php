<?php
class site_model extends CI_Model {
    function selectAllSiteData(){
        $homeData = $this->selectHomeData();
        print_r($homeData);
        // return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectHomeData(){
        $query = $this->db->select(array('title', 'body', 'image'))->order_by("timestamp", "asc")->get('home', 1);
        return $query->first_row();
        // return($query->num_rows() > 0) ? $query->result_array(): array();
    }

    function selectContactData(){
        $query = $this->db->select(array('telephone', 'mobile', 'email', 'address'))->order_by("timestamp", "asc")->get('contact', 1);
        return $query->first_row();
        // return($query->num_rows() > 0) ? $query->result_array(): array();
    }
    
}
?>