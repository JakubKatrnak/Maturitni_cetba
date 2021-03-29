<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/Application.php';

class User_controller extends Application
{

    function __construct()
    {
        parent::__construct();
    }

    public function login()
    {
        $view = 'login';
        if (!file_exists('application/views/' . $view . '.php')) {
            show_404();
        }

        $data['title'] = ucfirst($view);

        if (!$this->session->userdata('logged_in')) {
            $this->load->view('header', $data);
            $this->load->view($view);
        } else {
            redirect('home');
        }
    }

    public function authenticate()
    {
        if (!$this->session->userdata('logged_in')) {
            $user_email = $this->input->post('email', TRUE);
            $user_password = $this->input->post('password', TRUE);
            $users = $this->firebase()->get('/users');

            $keyRaw = array_search($user_email, array_column($users, 'email')); // raw key (from php) is different than key used in firebase
            $key = $keyRaw + 1;

            if (is_int($key)) { // if key exists
                $user_row = $this->firebase()->get('/users/' . $key);
                $uid = $user_row['uid'];
                $password_hash = $user_row['password'];

                if (password_verify($user_password, $password_hash)) { // kontrola hesla
                    $user = $this->firebase()->get('/users/' . $uid);
                    $this->session->set_userdata($user);

                    $user_id = $user['uid'];
                    $user_email = $user['email'];
                    $user_group = $user['group'];
                    $sesdata = array( // nastavení session dat
                        'user_id' => $user_id,
                        'user_email' => $user_email,
                        'user_group' => $user_group,
                        'logged_in' => TRUE,
                    );

                    $this->session->set_userdata($sesdata);
                    redirect('home');
                } else {
                    echo $this->session->set_flashdata('msg-login', 'Zadané heslo se neshoduje');
                    redirect('login');
                }
            } else {
                echo $this->session->set_flashdata('msg-login', 'Účet s tímto emailem neexistuje');
                redirect('login');
            }
        } else {
            redirect('home');
        }
    }

    public function register()
    {
        $view = 'register';
        if (!file_exists('application/views/' . $view . '.php')) {
            show_404();
        }

        $data['title'] = 'Registrace';

        if (!$this->session->userdata('logged-in')) {
            $this->load->view('header', $data);
            $this->load->view($view);
        } else {
            redirect(base_url('home'));
        }
    }

    public function validate() // validace registrace
    {
        $user_email = $this->input->post('email', TRUE);
        $users = $this->firebase()->get('/users');
        $max_uid = max(array_column($users, 'uid'));

        $key = array_search($user_email, array_column($users, 'email'));
        if ($key != NULL) {
            $check_data = $users[$key];
        } else {
            $check_data = 0;
        }

        if (empty($check_data)) { // validace emailu jestli je již použitý
            // zaregistruje uživatele
            $uid = $max_uid + 1;

            $user_password_hash = password_hash($this->input->post('password', TRUE), PASSWORD_DEFAULT);

            $register_data = array();
            $register_data['id'] = $uid;
            $register_data['password'] = $user_password_hash;
            $register_data['email'] = $user_email;
            $register_data['group'] = 'user';

            $this->firebase()->set('/users/' . $uid, $register_data);

            $this->session->set_flashdata('success', 'Registrace proběhla úspěšně');
            redirect('login');
        } else {
            echo $this->session->set_flashdata('msg-register', 'Účet s touto emailovou adresou již existuje');
            redirect('registrace');
        }
    }

    public function logout()
    {
        $this->session->unset_userdata('user');
        $this->session->sess_destroy();
        redirect('login');
    }
}
