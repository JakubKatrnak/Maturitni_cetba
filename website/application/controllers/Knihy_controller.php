<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Knihy_controller extends Application
{

	function __construct()
	{
		parent::__construct();
	}

	public function index(){
		$view = 'knihy/index';
		if (!file_exists('application/views/'.$view.'.php')) {
			show_404();
		}

		$data['knihy'] = $this->database()
		->getReference('oauh_knihy')
		->orderByKey()
		->getValue();

		$data['title'] = 'Seznam knih';

		$this->load->view('header', $data);
		$this->load->view($view);
	}

	public function kniha($id)
	{
        $view = 'knihy/kniha';
		if (!file_exists('application/views/'.$view.'.php')) {
			show_404();
		}

		$data['book'] = $this->database()
		->getReference('oauh_knihy/'.$id)
		->getValue();

		$data['title'] = $data['book']['nazev_knihy'];

		$this->load->view('header', $data);
		$this->load->view($view);
	}
}
