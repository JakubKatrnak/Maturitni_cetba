$(document).ready(function () { 
    // funkce pro zobrazení skrytého hesla na stránce registrace
    $("#show-password a").on('click', function (event) {
        event.preventDefault();
        if ($('#show-password input').attr("type") == "text") {
            $('#show-password input').attr('type', 'password');
            $('#show-password i').addClass("fa-eye-slash");
            $('#show-password i').removeClass("fa-eye");
        } else if ($('#show-password input').attr("type") == "password") {
            $('#show-password input').attr('type', 'text');
            $('#show-password i').removeClass("fa-eye-slash");
            $('#show-password i').addClass("fa-eye");
        }
    });

    /*
        Carousel
    */
    $('#carousel-example').on('slide.bs.carousel', function (e) {
        /*
            CC 2.0 License Iatek LLC 2018 - Attribution required
        */
        var $e = $(e.relatedTarget);
        var idx = $e.index();
        var itemsPerSlide = 5;
        var totalItems = $('.carousel-item').length;

        if (idx >= totalItems - (itemsPerSlide - 1)) {
            var it = itemsPerSlide - (totalItems - idx);
            for (var i = 0; i < it; i++) {
                // append slides to end
                if (e.direction == "left") {
                    $('.carousel-item').eq(i).appendTo('.carousel-inner');
                }
                else {
                    $('.carousel-item').eq(0).appendTo('.carousel-inner');
                }
            }
        }
    });
});

function kniha_db() {
    document.getElementById("vyber_knihy_db").style.display = "flex";
    document.getElementById("vyber_knihy_vlastni").style.display = "none";
    document.getElementById("autor").setAttribute("readonly", "true");
    document.getElementById("obdobi").setAttribute("readonly", "true");
    document.getElementById("isbn").setAttribute("readonly", "true");
    document.getElementById("pocet_stran").setAttribute("readonly", "true");
    document.getElementById("zanr").setAttribute("readonly", "true");

    document.getElementById("prebal").style.visibility = "visible";
    document.getElementById("prebal-header").style.display = "block";

    var select = document.getElementById("selected_book");
    window.current_book = select.options[select.selectedIndex].dataset.id_kniha;

    document.getElementById("autor").value = knihy[current_book]["autor"];
    document.getElementById("obdobi").value = knihy[current_book]["id_obdobi"];
    document.getElementById("isbn").value = knihy[current_book]["isbn"];
    document.getElementById("pocet_stran").value = knihy[current_book]["pocet_stran"];
    document.getElementById("zanr").value = knihy[current_book]["zanr"];
    document.getElementById("prebal").src = knihy[current_book]["prebal"];
}

function kniha_vlastni() {
    document.getElementById("vyber_knihy_db").style.display = "none";
    document.getElementById("vyber_knihy_vlastni").style.display = "flex";
    document.getElementById("autor").removeAttribute("readonly",0);
    document.getElementById("autor").value = "";
    document.getElementById("obdobi").removeAttribute("readonly",0);
    document.getElementById("obdobi").value = "";
    document.getElementById("isbn").removeAttribute("readonly",0);
    document.getElementById("isbn").value = "";
    document.getElementById("pocet_stran").removeAttribute("readonly",0);
    document.getElementById("pocet_stran").value = "";
    document.getElementById("zanr").removeAttribute("readonly",0);
    document.getElementById("zanr").value = "";

    document.getElementById("prebal-header").style.display = "none";
    document.getElementById("prebal").style.visibility = "hidden";
}