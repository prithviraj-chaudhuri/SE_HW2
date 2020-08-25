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
        var id_list = $('#questionnaire-form').data('id-list');
        id_list = id_list.split(',')
        responses = []
        for (var i=0; i<id_list.length; i++) {
            if ($("input[name='question-"+id_list[i]+"']:checked").length == 0) {
                alert("Please answer all the questions");
                return;
            }
            res = {}
            res['question_id'] = parseInt(id_list[i]);
            res['response'] = parseInt($("input[name='question-"+id_list[i]+"']:checked").val());
            res['token'] = token;
            responses.push(res);
        }

        $.ajax({
            url: window.location.protocol + "//" + window.location.host + "/questionnaireapi/questionresponse/",
            data: {"responses":JSON.stringify(responses)},
            type: "POST",
            beforeSend: function( xhr ) {
                $('#submit').attr('disabled',true);
                $('#reset').attr('disabled',true);
                $('#questionnaire-form .alert').addClass('show');
                $('#questionnaire-form .alert .spinner-border').show();
                $('#questionnaire-form .alert .alert-text').html('Saving answers...');
            },
            success: function (result) {
                window.location.href = window.location.protocol + "//" + window.location.host + "/code/"+token; 
                console.log("Log result  ",result);
            },
            error: function (res) {
                $('#submit').attr('disabled',false);
                $('#reset').attr('disabled',false);
                $('#questionnaire-form .alert').addClass('show');
                $('#questionnaire-form .alert .spinner-border').hide();
                $('#questionnaire-form .alert .alert-text').html('Saving answers...');
                console.log("Error starting  ",res);
            }
        });


    });

    $('.start-stop').on('click', function (event) {
        event.preventDefault();
        var locations = window.location.href.split('/');
        var token = locations[locations.length-1];
        var action = $(this).data( "state");
        var id = $(this).data("id");

        var id_list = $('#parent-block').data('id-list').toString();
        id_list = id_list.split(',');

        $.ajax({
            url: window.location.protocol + "//" + window.location.host + "/record/",
            data: {"action":action, "token": token, "language":id},
            type: "POST",
            beforeSend: function( xhr ) {
                $('#start-stop-'+id).attr('disabled',true)
                $('#alert-'+id).addClass('show');
                $('#alert-'+id+' .alert-text').html("Please wait...");
                $('#alert-'+id+' .spinner-border').show();
            },
            success: function (result) {
                $('#start-stop-'+id).attr('disabled',false)
                if (result == true || result['status'] == 0) {
                    if (action == "start") {
                        for (var i=0;i<id_list.length; i++) {
                            if (id_list[i] != id && $('#start-stop-'+id_list[i]).data('state') != 'done')
                                $('#start-stop-'+id_list[i]).attr('disabled',true)
                        }
                        $('#script-box-'+id).show();
                        $('#alert-'+id+' .alert-text').html("The debug session has started");
                        $('#alert-'+id).addClass('show');
                        $('#alert-'+id+' .spinner-border').hide();
                        $('#start-stop-'+id).html('Stop');
                        $('#start-stop-'+id).data( "state","stop");
                    } else {
                        for (var i=0;i<id_list.length; i++) {
                            if (id_list[i] != id && $('#start-stop-'+id_list[i]).data('state') != 'done')
                                $('#start-stop-'+id_list[i]).attr('disabled',false)
                        }
                        $('#script-box-'+id).hide();
                        $('#alert-'+id+' .alert-text').html("The debug session has stopped. Total debug time : "+result["duration"]+" seconds");
                        $('#alert-'+id).addClass('show');
                        $('#alert-'+id+' .spinner-border').hide();
                        $('#start-stop-'+id).data( "state","done");
                        $('#start-stop-'+id).attr('disabled',true);
                        checkDone();
                    }
                } else {
                    $('#start-stop-'+id).html('Start');
                    $('#start-stop-'+id).attr('disabled', false);
                    $('#alert-'+id+' .spinner-border').hide();
                    $('#alert-'+id).addClass('show');
                    $('#alert-'+id+' .alert-text').html("Some error occured");
                }
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

    checkDone()

    function checkDone() {
        var id_list = $('#parent-block').data('id-list').toString();
        if (id_list != "undefined") {
            id_list = id_list.split(',');
            var done = false;
            for (var i=0;i<id_list.length; i++) {
                if ($('#start-stop-'+id_list[i]).data( "state") == "done") {
                    done = true;
                } else {
                    done = false;
                    break;
                }
            }
            if (done)
                $('#done-modal').modal('show');
        }
    }
});