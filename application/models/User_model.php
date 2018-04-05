<?php
class user_model extends CI_Model {
    function signIn($credentials){
        $query = $this->db->select(array('username', 'password'))
            ->where('username', $credentials['username'])
            ->where('password', $credentials['password'])
            ->get('user');
        return $query->num_rows();
    }
}
?>