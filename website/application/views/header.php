<!DOCTYPE html>
<html>
<head>
	<title><?php echo $title;?></title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> <!-- jquery online -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> <!-- popper js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> <!-- bootstrap js -->
    <script type="text/javascript" src="<?php echo base_url('assets/js/js.js') ?>"></script> <!-- custom js -->
	<script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://use.fontawesome.com/releases/v5.1.0/css/all.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <!-- načte font awesome před obsahem stránky => není vidět že se načítají pomalu -->
    <link rel="stylesheet" href="<?php echo base_url('assets/css/css.css'); ?>">
    <link rel="icon" href="<?php echo base_url('img/favicon.ico')?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<script type="text/javascript"> $(function () { $('[data-toggle="tooltip"]').tooltip()}) </script> <!-- načte bs4 tooltip -->
<div class="container-fluid bg-primary"> <!-- Start fluid container for nav-->                
        <div class="sticky-top"> <!-- Start NAV -->
            <div class="d-flex justify-content-lg-center justify-content-md-center justify-content-sm-between w-100">
                <nav id="main-navbar" class="navbar bg-primary navbar-expand-lg w-100">
                    <button class="navbar-toggler navbar-toggler-left pl-0" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="navbar-toggler-icon text-white mb-2"><i class="fas fa-bars fa-2x"></i></span>
                    </button>
                    <div class="navbar-collapse collapse" id="navbar-collapse">
                        <a class="navbar-brand text-white" href="<?php echo base_url('');?>">Domů</a>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link text-white" href="<?php echo base_url('');?>"></a>
                            </li>
                        </ul>
                    </div>
                    <ul class="navbar-nav navbar-right d-none d-md-none d-lg-inline"> <!-- pro velké zařízení -->
                        <?php if($this->session->userdata('logged_in') === TRUE): ?>
                        <li class="pr-2"><a class="log-a" href="<?php echo base_url('profile/'.$this->session->userdata('uid'));?>" data-toggle="tooltip" data-placement="left" title="<?php echo $this->session->userdata('uid')?>"><?php echo $this->session->userdata('email');?></a></li>
                        <li class="pr-2 float-right"><a class="log-a" href="<?php echo site_url('logout');?>">Odhlásit se <i class="fas fa-sign-out-alt"></i></a></li>
                        <?php else: ?>
                        <li class="pr-2"><a class="log-a" href="<?php echo site_url('login');?>">Přihlášení <i class="fas fa-sign-in-alt"></i></a></li>
                        <li class="pr-2"><a class="log-a" href="<?php echo site_url('registrace');?>">Registrace <i class="fas fa-edit"></i></i></a></li>
                        <?php endif ?>
                    </ul>
                    <ul class="navbar-nav navbar-right d-lg-none d-md-inline d-inline"> <!-- pro malé zařízení -->
                        <?php if($this->session->userdata('logged_in') === TRUE): ?>
                        <li class="pr-2 text-white" data-toggle="tooltip" data-placement="left" title="<?php echo $this->session->userdata('uid')?>"><?php echo $this->session->userdata('email');?></li>
                        <li class="pr-2 log text-white float-right"><a class="log-a" href="<?php echo site_url('logout');?>">Odhlásit se <i class="fas fa-sign-out-alt"></i></a></li>
                        <?php else: ?>
                        <li class="pr-2 log text-white"><a class="log-a" href="<?php echo site_url('login');?>">Přihlášení <i class="fas fa-sign-in-alt"></i></a></li>
                        <li class="pr-2 bold log"><a class="log-a" href="<?php echo site_url('registrace');?>">Registrace <i class="fas fa-edit"></i></i></a></li>
                        <?php endif ?>
                    </ul>
                </nav>
            </div>
        </div> <!-- End NAV -->
    </div> <!-- end fluid container -->
</div> <!-- end fluid container --><!-- End NAV -->

