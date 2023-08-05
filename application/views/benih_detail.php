
        <!-- CONTENT -->
        <div class="col-12 m-0 p-0 content">
            <div class="col-12 m-0 p-5 pt-3">
                <div class="col-12 m-0 p-5">
                    <div class="col-12 m-0 mt-5 p-0">
                        <div class="col-12 m-0 p-0 row">
                            <div class="col-6 p-3">
                                <div class="col-12 m-0 rounded background-corousel"
                                    style="background-image: url(<?php echo base_url(); ?>assets/images/benih/<?php echo $benih['gambar']; ?>); height: 400px;">
                                </div>
                            </div>
                            <div class="col m-0 p-3 fs-7 fm-inter">
                                <h3>benih Produsen <span class="fw-semibold"><?php echo $benih['nama']; ?></span></h3>
                                <div class="fw-medium">
                                    <?php echo $benih['deskripsi']; ?>
                                </div>
                                <table>
                                    <tr>
                                        <td class="fw-semibold pe-5 py-1">Jumlah Benih</td>
                                        <td>: <?php echo number_format($benih['jumlah']).' '.$benih['satuan']; ?></td>
                                    </tr>
                                </table>
                                <div class="col-12 m-0 p-0 mt-5 pt-5">
                                    <div class="fs-1 fw-semibold"><span class="fw-normal fs-7">Rp</span> <?php echo number_format($benih['harga']).' / '.$benih['satuan']; ?></div>
                                    <div class="col-12 row m-0 p-0">
                                        <a href="<?php echo base_url(); ?>keranjang/add?type=benih&id=<?php echo $benih['id']; ?>" class="btn btn-success col-12 d-block mt-4">
                                            Simpan Ke Keranjang
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->