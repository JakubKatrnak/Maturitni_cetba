<?php
defined('BASEPATH') or exit('No direct script access allowed');
require dirname(dirname(dirname(__FILE__))).'/vendor/autoload.php';

use Kreait\Firebase\Factory;

class Application extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
    }
    
    function database(){
        $factory = (new Factory())
        ->withServiceAccount(dirname(dirname(__FILE__)).'/config/maturitnicetba-2924e-firebase-adminsdk-xrlpt-34669a13cd.json')
        ->withDatabaseUri('https://maturitnicetba-2924e-default-rtdb.firebaseio.com');
        $database = $factory->createDatabase();
        return $database;
    }

    function auth(){
        $factory = (new Factory())
        ->withServiceAccount(dirname(dirname(__FILE__)).'/config/maturitnicetba-2924e-firebase-adminsdk-xrlpt-34669a13cd.json')
        ->withDatabaseUri('https://maturitnicetba-2924e-default-rtdb.firebaseio.com');
        $auth = $factory->createAuth();
        return $auth;
    }

}
