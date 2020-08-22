$(document).ready(function () {
    $('.form-entry').submit(function (event) {

        event.preventDefault();
        //Check token here
        token = $('#token').val().toString().trim()

        $.ajax({
            url: "token/",
            data: {"action":"use", "token": token},
            type: "POST",
            beforeSend: function( xhr ) {
                $('#submit').attr('disabled', true);
                $('.form-entry .alert').addClass('show');
                $('.form-entry .alert .alert-text').html("Sending");
                $('.form-entry .alert .spinner-border').show();
            },
            success: function (result) {
                $('#submit').html("Submit");
                $('#submit').attr('disabled', false);
                if (result == true) {
                    $('.form-entry .alert .spinner-border').hide();
                    $('.form-entry .alert .alert-text').html("");
                    $('.form-entry .alert').removeClass('show');
                    window.location.href += "questionnaire/"+token;
                } else {
                    $('.form-entry .alert .spinner-border').hide();
                    $('.form-entry .alert').addClass('show');
                    $('.form-entry .alert .alert-text').html("The token is either used or invalid");
                }
            },
            error: function (res) {
                $('#submit').attr('disabled', false);
                $('#submit').html("Submit");
                $('.form-entry .alert .spinner-border').hide();
                $('.form-entry .alert .alert-text').html("Some error occured");
                $('.form-entry .alert').addClass('show');
                console.log("Error using token ",res);
            }
        });

    });
});