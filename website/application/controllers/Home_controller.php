<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Home_controller extends Application
{

	function __construct()
	{
		parent::__construct();
	}

	public function home()
	{
		$view = "home";
		if (!file_exists('application/views/'.$view.'.php')) {
			show_404();
		}

		$limit = 9;
		$data['knihy'] = array_slice($this->firebase()->get('/oauh_knihy'), 0, $limit+1);
		$data['deniky'] = $this->firebase()->get('/deniky');


		$data['title'] = "Home";

		$this->load->view('header', $data);
		$this->load->view($view);
	}
}
