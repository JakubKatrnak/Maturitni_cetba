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
            <div class="h6">Období: <?php switch($book['id_obdobi']){
                                case 1:
                                    echo "Světová a česká literatura do konce 18. století";
                                    break;
                                case 2:
                                    echo "Světová a česká literatura 19. století";
                                    break;
                                case 3:
                                    echo "Světová literatura 20. a 21. století";
                                    break;
                                case 4:
                                    echo "Česká literatura 20. a 21. století";
                                    break;
                                default:
                                    echo $kniha['id_obdobi'];
                                    break;
                             } ?></div>
            <div class="h6">Počet stran: <?php echo $book['pocet_stran']; ?></div>
            <div class="h6">Rok vydání: <?php echo $book['rok_vydani']; ?></div>
            <div class="h6">Žánr: <?php echo $book['zanr']; ?></div>
            <div class="h6">ISBN: <?php echo $book['isbn']; ?></div>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
        <a href="<?php echo base_url('denik/pridat/'.$book['id_knihy']); ?>">
                <div class="btn btn-primary float-right align-bottom-right">Přidat do deníku</div>
            </a>
        </div>
    </div>
</div>