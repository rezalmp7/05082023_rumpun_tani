        <!-- CONTENT -->
        <div class="col-12 m-0 p-0 content">
            <div class="col-12 p-0 m-0">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                        <!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                            aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
                            aria-label="Slide 5"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"
                            aria-label="Slide 6"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6"
                            aria-label="Slide 7"></button> -->
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="col-12 m-0 p-0 background-corousel" style="height: 1000px; background-image: url(<?php echo base_url(); ?>assets/images/dinas/COVER.png);" />
                        </div>
                        <!-- <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-2.jpg);" />
                        </div>
                        <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-3.jpg);" />
                        </div>
                        <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-4.jpg);" />
                        </div>
                        <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-5.jpg);" />
                        </div>
                        <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-6.jpg);" />
                        </div>
                        <div class="carousel-item">
                            <img class="col-12 m-0 p-0 background-corousel vh-100" style="background-image: url(<?php echo base_url(); ?>assets/images/dinas/carousel-7.jpg);" />
                        </div> -->
                    </div>
                    <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button> -->
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
        </div>
        <!-- END CONTENT -->
		<script>
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
