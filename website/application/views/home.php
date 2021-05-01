<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('denik'); ?>">
                <h1 class="text-center">Deník</h1>
            </a>
            <div class="h6"><?php
                            if (!empty($deniky)) { ?>
                    <h4 class="text-justify text-center d-block">Počet knih v deníku:
                        <?php
                                $pocet = -1;
                                foreach ($deniky as $denik) {
                                    $pocet++;
                                } ?>
                        <?php echo $pocet; ?></h4>
                    <div class="card-columns">
                        <!-- start card-columns -->

                        <?php foreach ($deniky as $val => $denik) {
                                    if (!empty($denik)) { ?>
                                <a href="<?php echo base_url('denik/' . $this->session->userdata('uid') . "/" . $val); ?>">
                                    <!--img class="card-img-top img-fluida" src="<?php //echo $denik['prebal'] 
                                                                                    ?>" alt="<?php // echo $denik[0]['nazev_knihy']; 
                                                                                                    ?> - přebal"-->
                                    <div class="card">
                                        <div class="card-header">
                                        <?php echo $denik['book'];?>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text"><?php echo substr($denik['notes'], 0, 20)."...";?></p>
                                        </div>
                                    </div>
                                </a>
                        <?php }
                                } ?>
                    </div> <!-- end card-columns -->
                <?php } else { ?>
                    <h4 class="text-justify text-center d-block">Nenašli jsme žádné knihy ve vašem deníku</h4></b>
                    <h5 class="text-justify text-center d-block">Můžete je přidat jedním kliknutím<h5>
                        <?php }
                        ?>
            </div>
            <a href="<?php echo base_url('denik/pridat'); ?>">
                <div class="btn btn-primary float-right btn-block">Přidat zápisek</div>
            </a>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('knihy'); ?>">
                <h1 class="text-center">Knihy</h1>
            </a>
            <div class="card-columns">
                <!-- start card-columns -->

                <?php foreach ($knihy as $kniha) {
                    if (!empty($kniha)) { ?>
                        <a href="<?php echo base_url('kniha/' . $kniha['id_knihy']); ?>">
                            <div class="card m-1">
                                <img class="card-img-top img-fluida" src="<?php echo $kniha['prebal']; ?>" alt="<?php echo $kniha['nazev_knihy']; ?> - přebal">
                                <div class="card-block">
                                    <h6 class="card-title"><?php echo $kniha['nazev_knihy']; ?></h4>
                                        <p class="card-text"></p>
                                </div>
                            </div>
                        </a>
                <?php }
                } ?>
            </div> <!-- end card-columns -->
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('doporucena-cetba'); ?>">
                <h1 class="text-center">Doporučená četba</h1>
            </a>
        </div>
    </div>
</div>