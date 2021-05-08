<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class Home_controller extends Application
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('logged_in')) {
			redirect(base_url('login'));
		}
	}

	public function home()
	{
		$view = "home";
		if (!file_exists('application/views/' . $view . '.php')) {
			show_404();
		}

		$limitKnihy = 9;
		$data['knihy'] = $this->database()
			->getReference('oauh_knihy')
			->orderByKey()
			->limitToFirst($limitKnihy)
			->getValue();
		$data['deniky'] = $this->database()
			->getReference('deniky/' . $this->session->userdata('uid'))
			->orderByKey()			
			->getValue();

		
		// Deníky s joinem na Knihy
		/*$knihy_all = $this->database() 
			->getReference('oauh_knihy')
			->orderByKey()
			->getValue();

			foreach($data['deniky'] as $denik => $val){
				foreach($knihy_all as $kniha){
					if(array_search($kniha['id_knihy'], $data['deniky'][$denik])){
						$data['deniky'][$denik]['kniha'] = $kniha;
					}
				}
			}
			*/

		$data['title'] = "Domů";

		$this->load->view('header', $data);
		$this->load->view($view);
	}
}
