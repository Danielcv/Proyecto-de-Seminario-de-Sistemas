$(function(){
    var socket = io();
    
    // Evento desde in_game.jade
    $('#sendmessage').keydown(function(event){
        if(event.keyCode === 13){
            socket.emit('enviar_mensaje', {
                nick: $('#chat-title').text(),
                mensaje: $('#sendmessage').val()
            });
            $('#sendmessage').val("");
        }
    });
    // Consecuencia
    socket.on("enviar_mensaje", function(param){
        $('#chat-box').append("<div class='item'><img src='img/avata3.png' alt='user image' class='online' /><p class='message'><a href='#' class='name'><small class='text-muted pull-right'><i class='fa fa-clock-o'></i>5:30</small>" + param.nick + "</a>" + param.mensaje + "</p></div>");
        $("#chat-box").animate({ scrollTop: $('#chat-box')[0].scrollHeight }, 0);
    });
    
    // ON-GAMING
    $('#btn_start_game').click(function(event){
        // alert("ehey");
        socket.emit('preparar_inicio');
        socket.emit('iniciar_juego');
    });
    $('#btn-start').click(function(event){
        alert("¿Preparados?");
        socket.emit('preparar_inicio');
        socket.emit('iniciar_juego', {
            limite: 10,
            id_pregunta: 1
        });
    });
    $('#id-btn-siguiente').click(function(event){
        alert("¿Preparados?");
    });
    // Consecuencia
    socket.on('preparar_inicio', function(){
        $('#sec_info_game').text("");
        $('#sec_info_game').html("<h4 id='AreaEfecto'>Aqui</h4><div class='progress xs progress-striped active'><div class='progress-bar progress-bar-danger' id='barra' style = 'width: 0%;'</div></div>");
    });
    socket.on('iniciar_juego', function(param, incremento, pregunta, resp1, resp2, resp3, resp4){
        $("#AreaEfecto").text(param);
        $("#barra").css('width', (param * incremento) + '%');
        $('#question').text(pregunta);
        $('#answerA').text(resp1);
        $('#answerB').text(resp2);
        $('#answerC').text(resp3);
        $('#answerD').text(resp4);
    });
    socket.on('final_pregunta', function(){
        $("#AreaEfecto").text("Tiempo finalizado.");
        $('#question').text("Terminado");
        $('#answerA').attr('disabled', 'disabled');
        $('#answerB').attr('disabled', 'disabled');
        $('#answerC').attr('disabled', 'disabled');
        $('#answerD').attr('disabled', 'disabled');
        $('#id-btn-siguiente').attr('disabled', false);
    });
});
