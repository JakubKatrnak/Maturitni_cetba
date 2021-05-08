<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('denik'); ?>">
                <h1 class="text-center">Moje zápisky</h1>
            </a>
            <div class="h6">
                <?php if (!empty($deniky)) { ?>
                    <?php
                    $pocet = 0;
                    foreach ($deniky as $denik) {
                        $pocet++;
                    } ?>
                    <h4 class="text-justify text-center d-block">Počet knih v deníku: <?php echo $pocet; ?></h4>
                    <?php foreach ($deniky as $val => $denik) {
                        if (!empty($denik)) { ?>
                            <a href="<?php echo base_url('denik/zobrazit/' . $val); ?>">
                                <div class="card mb-2 border-primary">
                                    <div class="card-header bg-primary text-white">
                                        <?php if (strlen($denik['book']) > 0) {
                                            echo $denik['book'];
                                        } else {
                                            echo "Nepojmenovaný deník";
                                        }; ?>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            <?php
                                            if (strlen($denik['notes']) < 30) {
                                                echo $denik['notes'];
                                            } else {
                                                echo substr($denik['notes'], 0, 30) . "...";
                                            }
                                            ?>
                                        </p>
                                    </div>
                                </div>
                            </a>
                    <?php }
                    } ?>
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
    </div>
</div>