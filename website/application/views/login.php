<div class="container pt-lg-5">
  <div class="col-sm-12 col-md-12 col-lg-4 col-12 offset-lg-4 bg-login-form rounded-corners pt-5 pb-5 pr-5 pl-5">
    <form class="form-signin" action="<?php echo site_url('login/authenticate');?>" method="post">
      <h1 class="form-signin-heading text-center pb-2">Přihlášení</h2>
      <div class="p text-center bg-warning mb-1 rounded"><?php echo $this->session->flashdata('msg-login');?></div>
      <div class="p text-center bg-success mb-1 rounded"><?php echo $this->session->flashdata('success');?></div>
       <div class="pb-2">
         <label for="username" class="sr-only">E-mail</label>
         <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>
       </div>
       <div class="pb-2">
         <label for="password" class="sr-only">Heslo</label>
         <input type="password" name="password" class="form-control" placeholder="Heslo" required>
       </div>
      <button class="btn btn-primary btn-lg btn-block" type="submit">Přihlásit se</button>
    </form>
  </div>
</div> <!-- /container -->