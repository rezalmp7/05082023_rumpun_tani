<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Keranjang extends CI_Controller {

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

        if($this->session->userdata('status') != 'login_user') {
            redirect(base_url('login'));
        }
	}
	public function index()
	{
        $keranjang_db = $this->M_admin->select_where('keranjang', array('id_user' => $this->session->userdata('id')))->result_array();

        $keranjang_save = [];

        foreach ($keranjang_db as $key => $value) {
            if($value['type'] == 'benih') {
                $produk_db = $this->M_admin->select_where('benih', array('id' => $value['id_produk']))->row_array();
                $produk = array(
                    'id' => $produk_db['id'],
                    'nama' => $produk_db['nama'],
                    'harga' => $produk_db['harga']
                );
            } else {
                $produk_db = $this->M_admin->select_where('obat', array('id' => $value['id_produk']))->row_array();
                $produk = array(
                    'id' => $produk_db['id'],
                    'nama' => $produk_db['nama'],
                    'harga' => $produk_db['harga']
                );
            }

            $keranjang_save[] = array(
                'id' => $value['id'],
                'produk' => $produk,
                'qty' => $value['qty'], 
            );
        }

        $data['keranjang'] = $keranjang_save;

		$this->load->view('layout/header');
		$this->load->view('keranjang', $data);
		$this->load->view('layout/footer');
	}
    public function add() {
        $get = $this->input->get();
        
        $count_record_on_produk = $this->db->from('keranjang')->where('id_produk', $get['id'])->where('id_user', $this->session->userdata("id"))->get()->num_rows();
        $data_produk = $this->db->from('keranjang')->where('id_produk', $get['id'])->where('id_user', $this->session->userdata("id"))->get()->row();

        if($count_record_on_produk > 0) {
            $data = array(
                'qty' => $data_produk->qty+1
            );
            $this->M_admin->update_data('keranjang', $data, array('id' => $data_produk->id));
        } else {
            $data = array(
                'type' => $get['type'],
                'id_produk' => $get['id'],
                'id_user' => $this->session->userdata("id"),
                'qty' => 1
            );
            $this->M_admin->insert_data('keranjang', $data);
        }

        redirect(base_url('keranjang'));
    }
    public function updateQty() {
        $get = $this->input->get();

        $this->M_admin->update_data('keranjang', array('qty' => $get['qty']), array('id' => $get["id"]));

        $keranjang = $this->M_admin->select_where('keranjang', array('id' => $get["id"]))->row_array();
    }
}
