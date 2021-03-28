<?php $books; ?>
<div class="container">
    <div class="row">
        <div class="col-4">
            <h1 class="text-center">Deník</h1>
            <p></p>
        </div>
        <div class="col-4">
            <h1 class="text-center">Knihy</h1>
            <div class="card-columns">
                <!-- start card-columns -->
                <?php foreach ($books as $book) {
                    if (!empty($book)) { ?>
                        <a href="<?php echo base_url('kniha/'.$book['id_knihy']);?>">
                            <div class="card m-1">
                                <img class="card-img-top img-fluid" src="<?php echo $book['prebal']; ?>" alt="<?php echo $book['nazev_knihy']; ?> - přebal">
                                <div class="card-block">
                                    <h4 class="card-title"><?php echo $book['nazev_knihy']; ?></h4>
                                    <p class="card-text"></p>
                                </div>
                            </div>
                        </a>
                <?php }
                } ?>
            </div> <!-- end card-columns -->
        </div>
        <div class="col-4">
            <h1 class="text-center">Doporučená četba</h1>
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
            <?php foreach ($books as $book) {
                if (!empty($book)) { ?>
                    <tr>
                        <td><?php echo $book['id_knihy']; ?></td>
                        <td><?php echo $book['nazev_knihy']; ?></td>
                        <td><?php echo $book['autor']; ?></td>
                        <td><?php echo $book['id_obdobi']; ?></td>
                        <td><?php echo $book['isbn']; ?></td>
                    </tr>
                    <tr>
                <?php }
            } ?>
        </tbody>
    </table>
</div>