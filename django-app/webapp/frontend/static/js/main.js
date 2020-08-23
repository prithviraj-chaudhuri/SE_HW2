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

    $('.start-stop').on('click', function (event) {
        event.preventDefault();
        var locations = window.location.href.split('/');
        var token = locations[locations.length-1];
        action = $(this).data( "state");
        id = $(this).data("id");
        $.ajax({
            url: window.location.protocol + "//" + window.location.host + "/record/",
            data: {"action":action, "token": token, "language":"g"},
            type: "POST",
            beforeSend: function( xhr ) {
                $('#start-stop-'+id).attr('disabled',true)
                $('#alert-'+id).addClass('show');
                $('#alert-'+id+' .alert-text').html("Please wait...");
                $('#alert-'+id+' .spinner-border').show();
            },
            success: function (result) {
                $('#start-stop-'+id).attr('disabled',true)
                if (result['status'] == 0) {
                    $('#alert-'+id+' .spinner-border').hide();
                    if (action == "start") {
                        $('#alert-'+id+' .alert-text').html("The debug session has started");
                        $('#start-stop-'+id).html('Stop');
                        $('#start-stop-'+id).data( "state","stop");
                    } else {
                        $('#alert-'+id+' .alert-text').html("The debug session has stopped");
                        $('#start-stop-'+id).html('Start');
                        $('#start-stop-'+id).data( "state","start");
                        $('#start-stop-'+id).attr('disabled', true);
                    }
                } else {
                    $('#start-stop-'+id).html('Start');
                    $('#start-stop-'+id).attr('disabled', false);
                    $('#alert-'+id+' .spinner-border').hide();
                    $('#alert-'+id).addClass('show');
                    $('#alert-'+id+' .alert-text').html("Some error occured");
                }
                console.log("Error starting  ",result);
            },
            error: function (res) {
                $('#start-stop-'+id).html('Start');
                $('#start-stop-'+id).attr('disabled', false);
                $('#alert-'+id+' .spinner-border').hide();
                $('#alert-'+id+' .alert-text').html("Some error occured");
                $('#alert-'+id).addClass('show');
                console.log("Error starting  ",res);
            }
        });
    });
});