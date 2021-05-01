<div class="container mt-4">
    <div class="row">
        <div class="col-12 text-center h1">
            Seznam knih
        </div>
    </div>
    <div class="row">
        <table class="table table-hover table-responsive-sm">
            <thead>
                <tr>
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
                            <td><a href="<?php echo base_url('kniha/'.$kniha['id_knihy'])?>"><?php echo $kniha['nazev_knihy']; ?></a></td>
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
</div>