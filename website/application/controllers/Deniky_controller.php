<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Deniky_controller extends Application
{

    function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('logged_in')) {
			redirect(base_url('login'));
		}
	}

    public function index(){

    }

    public function view($key){

    }

    public function add_view($kniha_id){
        $view = "deniky/add";
		if (!file_exists('application/views/' . $view . '.php')) {
			show_404();
		}

        $data['selected_book'] = $kniha_id;
        $data['knihy'] = $this->database()
			->getReference('oauh_knihy')
			->orderByKey()
			->getValue();

        $data['title'] = "Přidat deník";

		$this->load->view('header', $data);
		$this->load->view($view);
    }

    public function add(){

		$post_data = 	["note" => $this->input->post('vlastni_zapis'), 
						"book" => $this->input->post('kniha'),
						"autor" => $this->input->post('autor'),
						"obdobi" => $this->input->post('obdobi'),
						"isbn" => $this->input->post('isbn'),
						"pocet_stran" => $this->input->post('pocet_stran'),
						"zanr" => $this->input->post('zanr'),];
		$this->database()->getReference('deniky/'.$this->session->userdata('uid'))->push($post_data);

		redirect(base_url('home'));

    }

}
