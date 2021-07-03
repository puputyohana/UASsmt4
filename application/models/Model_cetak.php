<?php
	Class Model_cetak extends CI_Model{
		function __construct(){
			parent::__construct();
			$this->tabel = "siswa";
			}
		function getData(){
			$this->db->select('nis,nama,alamat,no_hp_ortu');
			$this->db->from($this->tabel);
			$this->db->order_by('nis', 'asc');
			$query = $this->db->get();
			$row = $query->result_array();
			return $row;
		}

	}
?>