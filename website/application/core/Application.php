<?php
defined('BASEPATH') or exit('No direct script access allowed');

use Firebase\Firebase;

const URL = 'https://maturitnicetba-2924e-default-rtdb.firebaseio.com';
const TOKEN = 'FD27Jn3Ww0FAwuzJQsisooDK0l2CpNu2KM4A7Tk4';

class Application extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
    }
    
    function firebase(){
        $fb = Firebase::initialize(URL, TOKEN);
        return $fb;
    }

}
