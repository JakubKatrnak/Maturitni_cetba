<div class="container mt-4">
    <div class="row">
        <div class="col-12 text-center h1">
            Seznam knih
        </div>
    </div>
    <div class="row">
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
</div>