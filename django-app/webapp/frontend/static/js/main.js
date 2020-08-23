$(document).ready(function () {

    $('#token-form').submit(function (event) {
        event.preventDefault();
        token = $('#token').val().toString().trim()
        $.ajax({
            url: "token/",
            data: {"action":"use", "token": token},
            type: "POST",
            beforeSend: function( xhr ) {
                $('#submit').attr('disabled', true);
                $('#token-form .alert').addClass('show');
                $('#token-form .alert .alert-text').html("Sending");
                $('#token-form .alert .spinner-border').show();
            },
            success: function (result) {
                $('#submit').html("Submit");
                $('#submit').attr('disabled', false);
                if (result == true) {
                    $('#token-form .alert .spinner-border').hide();
                    $('#token-form .alert .alert-text').html("");
                    $('#token-form .alert').removeClass('show');
                    window.location.href = window.location.protocol + "//" + window.location.host + "/questionnaire/"+token;
                } else {
                    $('#token-form .alert .spinner-border').hide();
                    $('#token-form .alert').addClass('show');
                    $('#token-form .alert .alert-text').html("The token is either used or invalid");
                }
            },
            error: function (res) {
                $('#submit').attr('disabled', false);
                $('#submit').html("Submit");
                $('#token-form .alert .spinner-border').hide();
                $('#token-form .alert .alert-text').html("Some error occured");
                $('#token-form .alert').addClass('show');
                console.log("Error using token ",res);
            }
        });
    });

    $('#questionnaire-form').submit(function (event) {
        event.preventDefault();
        var locations = window.location.href.split('/');
        var token = locations[locations.length-1];
        window.location.href = window.location.protocol + "//" + window.location.host + "/code/"+token;
    });
});