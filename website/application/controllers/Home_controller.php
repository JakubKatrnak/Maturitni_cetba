<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Home_controller extends Application
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('logged_in')){
			redirect(base_url('login'));
		} 
	}

	public function home()
	{
		$view = "home";
		if (!file_exists('application/views/'.$view.'.php')) {
			show_404();
		}

		$limit = 9;
		$data['knihy'] = $this->database()
			->getReference('oauh_knihy')
			->orderByKey()
			->limitToFirst($limit)
			->getValue();
		/*$data['deniky'] = $this->database()
		->getReference('users/'.$this->session->userdata('uid').'/deniky')
		->orderByKey()
		->getValue();*/


		$data['title'] = "Home";

		$this->load->view('header', $data);
		$this->load->view($view);
	}
}
