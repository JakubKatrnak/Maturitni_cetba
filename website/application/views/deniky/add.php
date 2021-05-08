<script type="text/javascript">
    <?php echo "var knihy = " . json_encode($knihy) . ";\n"; ?> // get data from php
    <?php echo "window.current_book = ".$selected_book.";\n";?>
    
    function dopln_info_knihy() {
        var select = document.getElementById("selected_book");
        window.current_book = select.options[select.selectedIndex].dataset.id_kniha;

        document.getElementById("autor").value = knihy[current_book]["autor"];
        document.getElementById("obdobi").value = knihy[current_book]["id_obdobi"];
        document.getElementById("isbn").value = knihy[current_book]["isbn"];
        document.getElementById("pocet_stran").value = knihy[current_book]["pocet_stran"];
        document.getElementById("zanr").value = knihy[current_book]["zanr"];
        document.getElementById("prebal").src = knihy[current_book]["prebal"];
    }
</script>
<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col-12 text-center h1">
            Přidat nový zápisek
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
            <button onclick="kniha_db()" class="btn btn-primary float-right btn-block">Vybrat knihu z databáze</button>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
            <button onclick="kniha_vlastni()" class="btn btn-primary float-right btn-block">Přidat svoji knihu</button>
        </div>
    </div>
    <form method="POST" action="<?php echo base_url('denik/pridat_db') ?>">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                <div class="input-group mb-3" id="vyber_knihy_vlastni" style="display: none;">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Název knihy</span>
                    </div>
                    <input class="form-control" id="nazev" placeholder="Název knihy">
                </div>
                <div class="input-group mb-3" id="vyber_knihy_db">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Kniha</span>
                    </div>
                    <select id="selected_book" class="form-control custom-select" name="kniha" onchange="dopln_info_knihy()">
                        <?php echo $selected_book;
                        foreach ($knihy as $kniha) {
                            if (!empty($kniha)) { ?>
                                <option <?php if ($kniha['id_knihy'] == $selected_book) {
                                            echo "selected ";
                                        } ?> value="<?php echo $kniha['nazev_knihy']; ?>" data-id_kniha="<?php echo $kniha['id_knihy']; ?>"><?php echo $kniha['nazev_knihy']; ?></option>
                        <?php }
                        } ?>
                    </select>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Autor</span>
                        </div>
                        <input class="form-control" id="autor" placeholder="Autor" name="autor" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Období</span>
                        </div>
                        <input class="form-control" id="obdobi" placeholder="Období" name="obdobi" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">ISBN</span>
                        </div>
                        <input class="form-control" id="isbn" placeholder="ISBN" name="isbn" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Počet stran</span>
                        </div>
                        <input class="form-control" id="pocet_stran" placeholder="Počet stran" name="pocet_stran" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Žánr</span>
                        </div>
                        <input class="form-control" id="zanr" placeholder="Žánr" name="zanr" readonly>
                    </div>
                </div>
                <div class="h4 text-center" id="prebal-header">Přebal knihy</div>
                <img id="prebal" class="img img-fluid rounded mx-auto d-block" src="<?php //echo $kniha['prebal']; ?>">
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-6 mt-3">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><b>Vlastní zápis</b></span>
                    </div>
                    <textarea rows="10" class="form-control" id="vlastni_zapis" aria-label="Vlastní zápis" name="vlastni_zapis"></textarea>
                </div>
                <button type="submit" class="btn btn-primary float-right btn-block align-self-end">Přidat zápisek</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    // create new instance of enhanced textarea provided by nicEditor
    // need to get this working on mobile
    /*bkLib.onDomLoaded(function() {
        new nicEditor({fullPanel : true}).panelInstance('vlastni_zapis');
    });*/

    // updating info about book every time select is changed    
    <?php echo "window.current_book = ".$selected_book.";\n";?>

    function load(){
        document.getElementById("autor").value = knihy[current_book]["autor"];
        document.getElementById("obdobi").value = knihy[current_book]["id_obdobi"];
        document.getElementById("isbn").value = knihy[current_book]["isbn"];
        document.getElementById("pocet_stran").value = knihy[current_book]["pocet_stran"];
        document.getElementById("zanr").value = knihy[current_book]["zanr"];
        document.getElementById("prebal").src = knihy[current_book]["prebal"];
    }

    load();

</script>