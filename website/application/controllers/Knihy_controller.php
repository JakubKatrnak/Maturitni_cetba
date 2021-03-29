<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Knihy_controller extends Application
{

	function __construct()
	{
		parent::__construct();
	}

	public function kniha($id)
	{
        $view = 'kniha';
		if (!file_exists('application/views/'.$view.'.php')) {
			show_404();
		}

		$data['book'] = $this->firebase()->get('/oauh_knihy/'.$id);

		$data['title'] = $data['book']['nazev_knihy'];

		$this->load->view('header', $data);
		$this->load->view($view);
	}
}
