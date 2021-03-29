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