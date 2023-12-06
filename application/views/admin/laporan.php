                <div class="page-content">
                    <div class="container-fluid">
                        <!-- start page title -->
                        <div class="page-title-box">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h6 class="page-title">Laporan</h6>
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>admin/dashboard">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Laporan</li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
    
                                    <h4 class="card-title mb-4">Total Transaksi Per Bulan</h4>

                                    <!-- end row -->
                                    <canvas id="myChart"></canvas>
    
                                </div>
                            </div>
                        </div> <!-- end col -->

                        <div class="card">
                            <div class="card-body">
                                <div class="col-12 clearfix my-3">
                                    <a href="<?php echo base_url(); ?>/admin/laporan/cetakExcel" class="btn btn-sm btn-primary float-end">Cetak Excel</a>
                                </div>
                                <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Kode Pesanan</th>
                                            <th>Pemesan</th>
                                            <th>Tanggal Pengambilan</th>
                                            <th>Total Pembayaran</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        foreach ($transaksi as $key => $value) {
                                        ?>
                                        <tr>
                                            <td style="font-family: Consolas, monaco, monospace;">#<?php echo $value['kode_pesanan']; ?></td>
                                            <td><?php echo $value['nama_user']; ?></td>
                                            <td><?php echo date('d F Y', strtotime($value['tgl_pengambilan'])); ?></td>
                                            <td>Rp. <?php echo number_format($value['total']); ?></td>
                                            <td>
                                                <?php
                                                switch ($value['status']) {
                                                    case '1':
                                                        echo '<span class="badge bg-warning">Menunggu</span>';
                                                        break;
                                                    case '2':
                                                        echo '<span class="badge bg-success">Berhasil</span>';
                                                        break;
                                                    default:
                                                        echo '<span class="badge bg-danger">Gagal</span>';
                                                        break;
                                                }
                                                ?>
                                            </td>
                                        </tr>
                                        <?php 
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                <script>
                    $("#datatable").DataTable();


                    let bulanChart = <?php echo $cart['bulan']; ?>;
                    let valueChart = <?php echo $cart['value']; ?>;

                    console.log(bulanChart, valueChart);

                    const ctx = document.getElementById('myChart');

                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: bulanChart,
                            datasets: [{
                                label: 'Total Transaksi',
                                data: valueChart,
                                borderWidth: 1,
                                tension: 0.3
                            }]
                        },
                        options: {
                        scales: {
                            y: {
                            beginAtZero: true
                            }
                        }
                        }
                    });
                </script>
