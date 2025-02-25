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

	public function index()
	{
		$view = "deniky/index";
		if (!file_exists('application/views/' . $view . '.php')) {
			show_404();
		}

		$data['title'] = "Moje zápisky";
		$data['deniky'] = $this->database()
			->getReference('deniky/' . $this->session->userdata('uid'))
			->orderByKey()
			->getValue();

		$this->load->view('header', $data);
		$this->load->view($view);
	}

	public function view($key)
	{
		$view = "deniky/view";
		if (!file_exists('application/views/' . $view . '.php')) {
			show_404();
		}
		$data['title'] = 'Deník';
		$data['key'] = $key;
		$data['denik'] = $this->database()
			->getReference('deniky/' . $this->session->userdata('uid') . '/' . $key . '/')
			->getValue();

		$this->load->view('header', $data);
		$this->load->view($view);
	}

	public function new($kniha_id)
	{
		$view = "deniky/add";
		if (!file_exists('application/views/' . $view . '.php')) {
			show_404();
		}

		if ($kniha_id == NULL) {
			$data['selected_book'] = 1;
		} else {
			$data['selected_book'] = $kniha_id;
		}

		$data['knihy'] = $this->database()
			->getReference('oauh_knihy')
			->orderByKey()
			->getValue();

		$data['title'] = "Přidat deník";

		$this->load->view('header', $data);
		$this->load->view($view);
	}

	public function add()
	{
		$input = 	[
			"notes" => $this->input->post('vlastni_zapis'),
			"book" => $this->input->post('kniha'),
			"author" => $this->input->post('autor'),
			"obdobi" => $this->input->post('obdobi'),
			"isbn" => $this->input->post('isbn'),
			"pocet_stran" => $this->input->post('pocet_stran'),
			"genre" => $this->input->post('zanr')
		];
		$reference = $this->database()->getReference('deniky/' . $this->session->userdata('uid'))->push($input);
		$key = $reference->getKey();

		redirect(base_url('denik/zobrazit/' . $key));
	}

	public function edit($key)
	{
		$update_data = [
			"notes" => $this->input->post('vlastni_zapis'),
			"book" => $this->input->post('kniha'),
			"author" => $this->input->post('autor'),
			"obdobi" => $this->input->post('obdobi'),
			"isbn" => $this->input->post('isbn'),
			"pocet_stran" => $this->input->post('pocet_stran'),
			"genre" => $this->input->post('zanr')
		];

		$updates = [
			'deniky/' . $this->session->userdata('uid') . '/' . $key => $update_data
		];

		$this->database()
			->getReference()
			->update($updates);

		redirect(base_url('denik/zobrazit/' . $key));
	}

	public function delete($key)
	{
		$this->database()
			->getReference('deniky/'.$this->session->userdata('uid').'/'.$key)
			->remove();

		$this->session->set_flashdata('odstraneno','Zápisek byl odstraněn');

		redirect(base_url('denik'));
	}
}
