<div class="container pt-lg-5">
    <div class="col-sm-12 col-md-12 col-lg-4 col-12 offset-lg-4 bg-login-form rounded-corners pt-5 pb-5 pr-5 pl-5">
        <form autocomplete="off" class="form-signin" action="<?php echo base_url('registrace/validate'); ?>" method="post">
            <h1 class="form-signin-heading text-center pb-1">Registrace</h1>
            <div class="p text-center bg-danger mb-1 rounded"><?php echo $this->session->flashdata('msg-register'); ?></div>
            <div class="pb-2">
                <label for="email" class="sr-only">E-mail</label>
                <input type="email" name="email" class="form-control" placeholder="Váš email" required>
            </div>
            <div class="pb-2">
                <label for="password" class="sr-only">Heslo</label>
                <div class="input-group" id="show-password">
                    <input type="password" name="password" class="form-control" placeholder="Heslo" id="password" required>
                    <div class="input-group-addon">
                        <div class="input-group-text"><a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a></div>
                    </div>
                </div>
            </div>

            <div class="alert alert-info text-center rounded d-block mb-2 text-sm font-weight-light">Prosím zkontrolujte vaše vložené údaje před registrací <i class="fas fa-exclamation-triangle"></i></div>
            <button onclick="" class="btn btn-lg btn-block btn-primary" type="submit" id="submit">Zaregistrovat se</button> <!-- ošetřit aby se nemohl registrovat pokud se hesla neshodují -->
        </form>
    </div>
</div> <!-- /container -->