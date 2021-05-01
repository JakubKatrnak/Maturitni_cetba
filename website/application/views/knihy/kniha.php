<div class="container mt-4">
    <div class="row mb-3">
        <div class="col-12 text-center h1">
            <?php echo $book['nazev_knihy']; ?>
        </div>
        <div class="col-12 lead text-center"><?php echo $book['autor']; ?></div>
    </div>
    <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
            <div class="h4 text-center">Popis knihy</div>
            <div class="p text-justify"><?php echo $book['popis'] ?></div>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
            <div class="h4 text-center">Přebal knihy</div>
            <img class="img img-fluid rounded mx-auto d-block" src="<?php echo $book['prebal']; ?>">
        </div>
    </div>
    <div class="row">
        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
            <div class="h4">Dodatečné informace</div>
            <hr class="rounded">
            <div class="h6">Období: <?php echo $book['id_obdobi']; ?></div>
            <div class="h6">Počet stran: <?php echo $book['pocet_stran']; ?></div>
            <div class="h6">Rok vydání: <?php echo $book['rok_vydani']; ?></div>
            <div class="h6">Žánr: <?php echo $book['zanr']; ?></div>
            <div class="h6">ISBN: <?php echo $book['isbn']; ?></div>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
        <a href="<?php echo base_url('denik/pridat'); ?>">
                <div class="btn btn-primary float-right align-bottom-right">Přidat do deníku</div>
            </a>
        </div>
    </div>
</div>