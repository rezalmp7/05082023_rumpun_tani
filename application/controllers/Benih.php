<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Benih extends CI_Controller {

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
		$get = $this->input->get();

		if($get != null) {
			if($get['search'] != null || $get['search'] != '') {
				$data['benihs'] = $this->M_admin->select_query("SELECT * FROM benih WHERE produsen LIKE '%".$get['search']."%'")->result_array();
			} else {
				$data['benihs'] = $this->M_admin->select_all('benih')->result_array();
			}
		} else {
			$data['benihs'] = $this->M_admin->select_all('benih')->result_array();
		}

        $this->load->view('layout/header');
		$this->load->view('benih', $data);
        $this->load->view('layout/footer');
	}
	public function show($id) {
		$data['benih'] = $this->M_admin->select_where("benih", array('id' => $id))->row_array();

		$this->load->view('layout/header');
		$this->load->view('benih_detail', $data);
		$this->load->view('layout/footer');
	}
}
