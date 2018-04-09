<?php
class user_model extends CI_Model {
    function signIn($credentials){
        $query = $this->db->select(array('username', 'password'))
            ->where('username', $credentials['username'])
            ->where('password', $credentials['password'])
            ->get('user');
        return $query->num_rows();
    }

    function signOut($encryptedString){
        $query = $this->db->set('token', $encryptedString)->insert('session');

        // return $query->insert_id();
    }
}
?>