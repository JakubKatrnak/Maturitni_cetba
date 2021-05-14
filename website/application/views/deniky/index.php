<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('denik'); ?>">
                <h1 class="text-center">Moje zápisky</h1>
            </a>
            <?php if (!empty($deniky)) { ?>
                <?php
                $pocet = 0;
                foreach ($deniky as $denik) {
                    $pocet++;
                } ?>
            <h4 class="text-justify text-center d-block">Počet knih v deníku: <?php echo $pocet; ?></h4>
            <div class="h3 bg-warning text-center">
                <?php echo $this->session->flashdata('odstraneno'); ?>
            </div>
            <?php foreach ($deniky as $val => $denik) {
                        if (!empty($denik)) { ?>
                    <div class="modal fade" id="odstranitZapisek<?php echo $val; ?>" tabindex="-1" role="dialog" aria-labelledby="odstranitZapisek<?php echo $val; ?>Label" aria-hidden="true">
                        <!-- start modal -->
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-primary text-white">
                                    <h5 class="modal-title" id="odstranitZapisek<?php echo $val; ?>">Odstranit zápisek</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="h4">Jste si jistí, že chcete odstranit zápisek?</div>
                                    <div class="h4">Název: <b> <?php if (strlen($denik['book']) > 0) {
                                                                    echo $denik['book'];
                                                                } else {
                                                                    echo "Nepojmenovaný deník";
                                                                }; ?></b></div>
                                    <div class="h5">Tuto změnu nezle vrátit</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Zrušit</button>
                                    <a href="<?php echo base_url('denik/odstranit/' . $val); ?>"><button type="button" class="btn btn-danger">Odstranit</button></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end modal -->
                    <div class="card card-block justify-content-center mb-2 border-primary">
                        <div class="card-header bg-primary text-white">
                            <div class="row align-items-center">
                                <div class="col-11">
                                    <a href="<?php echo base_url('denik/zobrazit/' . $val); ?>" class="text-white">
                                        <?php if (strlen($denik['book']) > 0) {
                                            echo $denik['book'];
                                        } else {
                                            echo "Nepojmenovaný deník";
                                        }; ?>
                                    </a>
                                </div>
                                <div class="col-1">
                                    <div class="float-right">
                                        <a href="" data-toggle="modal" data-target="#odstranitZapisek<?php echo $val; ?>" class="card-text text-uppercase font-weight-bold" data-toggle="tooltip" data-placement="top" title=""><button class="btn btn-danger btn-sm">Odstranit</button></a>
                                    </div>
                                </div>
                            </div>
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
            <?php }
                    } ?>
        <?php } else { ?>
            <h4 class="text-justify text-center d-block">Nenašli jsme žádné knihy ve vašem deníku</h4></b>
            <h5 class="text-justify text-center d-block">Můžete je přidat jedním kliknutím<h5>
                <?php }
                ?>
        <a href="<?php echo base_url('denik/pridat'); ?>">
            <div class="btn btn-primary float-right btn-block">Přidat zápisek</div>
        </a>
        </div>
    </div>
</div>
</div>