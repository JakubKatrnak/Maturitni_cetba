<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('denik'); ?>">
                <h1 class="text-center">Deník</h1>
            </a>
            <div class="h6">Počet knih v deníku: <?php 
                $pocet = -1;
                foreach($deniky as $denik){
                    $pocet++;
                }
                echo $pocet;
            ?></div>
            <a href="<?php echo base_url('denik/pridat'); ?>">
                <div class="btn btn-primary float-right btn-block">Přidat zápisek</div>
            </a>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 jumbotron mt-5 border-white">
            <a href="<?php echo base_url('knihy');?>">
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
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Název</th>
                <th scope="col">Autor</th>
                <th scope="col">Období</th>
                <th scope="col">ISBN</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($knihy as $kniha) {
                if (!empty($kniha)) { ?>
                    <tr>
                        <td><?php echo $kniha['id_knihy']; ?></td>
                        <td><?php echo $kniha['nazev_knihy']; ?></td>
                        <td><?php echo $kniha['autor']; ?></td>
                        <td><?php echo $kniha['id_obdobi']; ?></td>
                        <td><?php echo $kniha['isbn']; ?></td>
                    </tr>
                    <tr>
                <?php }
            } ?>
        </tbody>
    </table>
</div>