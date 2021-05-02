<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col-12 text-center h1">
            <?php if ($denik !== NULL) {
                if (strlen($denik['book']) > 0) {
                    echo $denik['book'];
                }else{
                    echo "Nepojmenovaný deník";
                }
            } else {
                echo "Deník nebyl nalezen v databázi";
            } ?>
        </div>
    </div>
    <?php if ($denik !== NULL) { ?>
        <form method="POST" action="<?php echo base_url('denik/edit/' . $key) ?>">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="input-group mb-3" id="vyber_knihy_vlastni">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Název knihy</span>
                        </div>
                        <input type="text" class="form-control" id="nazev" name="kniha" placeholder="Název knihy" value="<?php echo $denik['book'] ?>">
                    </div>
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Autor</span>
                            </div>
                            <input class="form-control" id="autor" placeholder="Autor" name="autor" value="<?php echo $denik['author'] ?>">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Období</span>
                            </div>
                            <input class="form-control" id="obdobi" placeholder="Období" name="obdobi" value="<?php echo $denik['obdobi'] ?>">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">ISBN</span>
                            </div>
                            <input class="form-control" id="isbn" placeholder="ISBN" name="isbn" value="<?php echo $denik['isbn'] ?>">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Počet stran</span>
                            </div>
                            <input class="form-control" id="pocet_stran" placeholder="Počet stran" name="pocet_stran" value="<?php echo $denik['pocet_stran'] ?>">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Žánr</span>
                            </div>
                            <input class="form-control" id="zanr" placeholder="Žánr" name="zanr" value="<?php echo $denik['genre'] ?>">
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><b>Vlastní zápis</b></span>
                        </div>
                        <textarea rows="10" class="form-control" id="vlastni_zapis" aria-label="Vlastní zápis" name="vlastni_zapis"><?php echo $denik['notes'] ?></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary float-right btn-block align-self-end">Upravit deník</button>
                </div>
            </div>
        </form>
    <?php } else { ?>
        <div class="row mt-5">
            <div class="col-4 mx-auto text-center text-primary">
                <a href="<?php echo base_url('denik/pridat/') ?>">
                    <div class="btn btn-primary float-right btn-block">Přidat nový deník</div>
                </a>
            </div>
        </div>
    <?php } ?>
</div>