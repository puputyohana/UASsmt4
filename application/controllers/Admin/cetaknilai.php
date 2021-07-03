<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Laporanfpdf extends CI_Controller {
 
    function __construct(){
        parent::__construct();
        $this->load->library('Pdf'); // MEMANGGIL LIBRARY YANG KITA BUAT TADI
    }
 
    function index()
    {
        error_reporting(0); // AGAR ERROR MASALAH VERSI PHP TIDAK MUNCUL
        $pdf = new FPDF('L', 'mm','Letter');
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(0,7,'Daftar Peminjaman Graha Pancasila',0,1,'C');

        $pdf->Cell(10,7,'',0,1);
 
        $pdf->SetFont('Arial','B',10);
        $pdf->Cell(10,6,'No',1,0,'C');
        $pdf->Cell(105,6,'Kegiatan',1,0,'C');
        $pdf->Cell(40,6,'Tanggal Acara',1,0,'C');
        $pdf->Cell(40,6,'Waktu',1,0,'C');
        $pdf->Cell(65,6,'Penanggung Jawab',1,1,'C');
 
        $pdf->SetFont('Arial','',10);
        $tbl_data_kegiatan = $this->db->get('penilaian')->result();
        $no=0;
        foreach ($tbl_data_kegiatan as $data){
            $no++;
           $pdf->Cell(10,6,$no,1,0, 'C');
            $pdf->Cell(105,6,$data->Kegiatan,1,0);
            $pdf->Cell(40,6,$data->Tanggal_Acara,1,0);
            $pdf->Cell(40,6,$data->Waktu,1,0);
            $pdf->Cell(65,6,$data->Penanggung_Jawab,1,1);

        }
        $pdf->Output();
    }
}