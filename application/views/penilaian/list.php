<?php  
if ($this->session->flashdata('Berhasil')) {
    echo "<div class='alert alert-info'>";
    echo $this->session->flashdata('Berhasil');
    echo "</div>";
} elseif ($this->session->flashdata('Hapus')) {
    
    echo "<div class='alert alert-warning bg-danger'>";
    echo $this->session->flashdata('Hapus');
    echo "</div>";
}elseif ($this->session->flashdata('edit')) {
    
    echo "<div class='alert alert-danger bg-danger'>";
    echo $this->session->flashdata('edit');
    echo "</div>";
}
?>
<h4>DATA PENILAIAN</h4> 
<?php echo anchor('Admin/Penilaian/add', '<button type="submit" class="btn btn-info pull-right">TAMBAH NILAI</button> ') ?>
<table id="example" class="table table-striped table-responsive table-bordered bg-white" style="width:100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>NIS</th>
            <th>TANGGAL</th>
            <th>BOBOT</th>
            <th>NO HP ORTU</th>
            <th>ALAMAT</th>
            <th>NILAI SISWA</th>
            <th>KETERANGAN</th>
            <th>AKSI EDIT</th>
            <th>AKSI DELETE</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 1;
        foreach ($nilai as $row) {
            echo "<tr>
                <td>$no</td>
                <td>$row->nama</td>
                <td>$row->nis</td>
                <td>$row->tanggal</td>
                <td>$row->bobot</td>
                <td>$row->no_hp_ortu</td>
                <td>$row->alamat</td>
                <td>$row->tingkat_kenakalan</td>
                <td>$row->keterangan</td>
                <td>" . anchor('Admin/Penilaian/edit/' . $row->id_nilai, 'Edit', array('class' => 'btn btn-info')) . "</td>
                <td>" . anchor('Admin/Penilaian/Hapus/' . $row->id_nilai, 'Hapus', array('class' => 'btn btn-danger')) . "</td>
            </tr>";

            $no++;
        }
        ?>

    </tbody>
</table>    