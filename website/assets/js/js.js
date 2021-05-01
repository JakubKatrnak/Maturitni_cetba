$(document).ready(function() { // funkce pro zobrazení skrytého hesla na stránce registrace
    $("#show-password a").on('click', function(event) {
        event.preventDefault();
        if($('#show-password input').attr("type") == "text"){
            $('#show-password input').attr('type', 'password');
            $('#show-password i').addClass( "fa-eye-slash" );
            $('#show-password i').removeClass( "fa-eye" );
        }else if($('#show-password input').attr("type") == "password"){
            $('#show-password input').attr('type', 'text');
            $('#show-password i').removeClass( "fa-eye-slash" );
            $('#show-password i').addClass( "fa-eye" );
        }
    });
});

function kniha_db(){
    document.getElementById("vyber_knihy_db").style.display = "flex";
    document.getElementById("vyber_knihy_vlastni").style.display = "none";
    document.getElementById("autor").disabled = true;
    document.getElementById("obdobi").disabled = true;
    document.getElementById("isbn").disabled = true;
    document.getElementById("pocet_stran").disabled = true;
    document.getElementById("zanr").disabled = true;

    document.getElementById("prebal").style.visibility = "visible";
    document.getElementById("prebal-header").style.display = "block";

}

function kniha_vlastni(){
    document.getElementById("vyber_knihy_db").style.display = "none";
    document.getElementById("vyber_knihy_vlastni").style.display = "flex";
    document.getElementById("autor").disabled = false;
    document.getElementById("autor").value = "";
    document.getElementById("obdobi").disabled = false;
    document.getElementById("obdobi").value = "";
    document.getElementById("isbn").disabled = false;
    document.getElementById("isbn").value = "";
    document.getElementById("pocet_stran").disabled = false;
    document.getElementById("pocet_stran").value = "";
    document.getElementById("zanr").disabled = false;
    document.getElementById("zanr").value = "";

    document.getElementById("prebal-header").style.display = "none";
    document.getElementById("prebal").style.visibility = "hidden";
}