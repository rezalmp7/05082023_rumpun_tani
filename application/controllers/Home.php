<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct() {
		parent::__construct();

		$this->load->model("M_admin");
	}
	public function index()
	{
		$benih5 = $this->M_admin->select_select_limit_orderBy("*", "benih", 5, 'created_at DESC')->result_array();
		$obat5 = $this->M_admin->select_select_limit_orderBy("*", "obat", 5, 'created_at DESC')->result_array();
		// $pupuk5 = $this->M_admin->select_all_limit("pupuk", 5)->result_array();

		$data = array(
			'benihs' => $benih5,
			'obats' => $obat5 
		);

        $this->load->view('layout/header');
		$this->load->view('home', $data);
        $this->load->view('layout/footer');
	}
}
