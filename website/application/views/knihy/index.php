<script type="text/javascript">
    function show_book_table() {
        var visibility = document.getElementById("book_table").style.visibility;
        if (visibility == "hidden") {
            document.getElementById("book_table").style.visibility = "visible";
            document.getElementById("button_show_table").innerHTML = "Skrýt tabulku";
        } else {
            document.getElementById("book_table").style.visibility = "hidden";
            document.getElementById("button_show_table").innerHTML = "Zobrazit tabulku";
        }
    }
</script>
<div class="container mt-4 mb-5">
    <div class="row">
        <div class="col-12 text-center">
            <div class="h1">Seznam knih</div>
            <a href="#" id="button_show_table" onclick="show_book_table();">
                <p>Zobrazit tabulku</p>
            </a>
        </div>
    </div>
</div>
<!-- Top content -->
<div class="top-content">
    <div class="container-fluid">
        <div id="carousel-example" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner row w-100 mx-auto" role="listbox">
                <?php $y = 1; ?>
                <?php foreach ($knihy as $kniha) { ?>
                    <?php if (!empty($kniha)) { ?>
                        <div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 <?php if ($y == 1) {
                                                                                        echo 'active';
                                                                                    } ?>">
                            <a href="<?php echo base_url('kniha/' . $kniha['id_knihy']) ?>">
                                <img src="<?php echo $kniha['prebal'] ?>" class="mx-auto d-block" alt="<?php echo $kniha['nazev_knihy'] ?>" height="415" width="250">
                            </a>
                        </div>
                    <?php $y++;
                    } ?>
                <?php } ?>
            </div>
            <a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<div class="container mt-5" id="book_table" style="visibility: hidden;">
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
                            <td><a href="<?php echo base_url('kniha/' . $kniha['id_knihy']) ?>"><?php echo $kniha['nazev_knihy']; ?></a></td>
                            <td><?php echo $kniha['autor']; ?></td>
                            <td><?php switch($kniha['id_obdobi']){
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
                             } ?></td>
                            <td><?php echo $kniha['isbn']; ?></td>
                        </tr>
                        <tr>
                    <?php }
                } ?>
            </tbody>
        </table>
    </div>
</div>