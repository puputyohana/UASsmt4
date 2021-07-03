<?php
class cetaknilai extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->library('pdf');
		$this->load->database();
		$this->load->helper('url');
		$this->load->model('Model_cetak');
	}

	function index(){
		$pdf = new FPDF();

		$pdf -> AddPage();
		$pdf -> SetFont('Arial','B', 16);
		$pdf -> Cell(190,7,'DATA SISWA',0,1,'C');
		$pdf -> Cell(10,7,'',0,1);

		$pdf -> SetFont('Arial','B', 13);
		$pdf -> Cell(20,6,'NO',1,0);
		$pdf -> Cell(30,6,'NIS',1,0);
		$pdf -> Cell(50,6,'Nama',1,0);
		$pdf -> Cell(30,6,'Alamat',1,0);
		$pdf -> Cell(50,6,'NO. Hp',1,1);

		
		$datacetak = $this->Model_cetak->getData();
		$no = 1;

			foreach ($datacetak as $id => $cetak) {
				$pdf -> SetFont('Arial','', 10);
				$pdf -> Cell(20,6,$no,1,0);
				$pdf -> Cell(30,6,$cetak['nis'],1,0);
				$pdf -> Cell(50,6,$cetak['nama'],1,0);
				$pdf -> Cell(30,6,$cetak['alamat'],1,0);
				$pdf -> Cell(50,6,$cetak['no_hp_ortu'],1,1);
				$no++;
		}
		$pdf -> Output();
	}
}
?>