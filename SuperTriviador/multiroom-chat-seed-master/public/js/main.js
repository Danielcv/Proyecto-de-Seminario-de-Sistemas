$(document).ready(function(){
	var socket = null;
    //var socket = io.connect('http://192.168.0.11:4242');

    $('#connect').click(function(){
    	if($('#name').val() != '' && $('#name').val() != 'Your Name') {
    		$('#name').css('border', '');
	    	socket = io.connect('http://127.0.0.1:3003');
		    socket.on('connect', function(){
		    	console.log('Socket connected!');
		        socket.emit('data', { room: $('#room').val(), name: $('#name').val()});
		        $('#connect').prop('disabled', true);
		        $('#room').prop('disabled', true);
		        $('#name').prop('disabled', true);
		        $('#status').html('Connected!');
		        $( "#status" ).removeClass( "disconnected" ).addClass( "connected" );
		    });
    	}
    	else
    		$('#name').css('border', '1px solid red');

	    socket.on('userlist', function(userlist){
	    	$('#users').html('');
	    	for(var i=0; i<userlist.length; i++){
	    		$('#users').append('<li id="'+userlist[i]+'">'+userlist[i]+'</li>');
	    	}
	    });

	    socket.on('nuser', function(username){
	    	console.log('new user...'+username);
	    	$('#users').append('<li id="'+username+'">'+username+'</li>');
	    });

	    socket.on('udisconnected', function(username){
	    	console.log('user disconnected: ' + username);
	    	$('#'+username).remove();
	    });

	    socket.on('message', function(message){
	    	$('#msgs').append('<p>'+message+'</p>');
	    });

	    socket.on('disconnect', function(){
	    	$('#connect').prop('disabled', false);
	        $('#room').prop('disabled', false);
	        $('#name').prop('disabled', false);
	    	$('#status').html('Not Connected!');
	        $( "#status" ).removeClass( "connected" ).addClass( "disconnected" );
	    })
    });
    
	
    $('#send').click(function(){
    	if(socket != null && $('#message').val() != null && $('#message').val() != ''){
	    	var message = {
	    		name: $('#name').val(),
	    		room: $('#room').val(),
	    		text: $('#message').val()
	    	};
    		socket.emit('message', message);
    		$('#message').val('');
    	}
    });

    $('#message').keypress(function(e) {
	    if(e.which == 13) {
	        if(socket != null && $('#message').val() != null && $('#message').val() != ''){
		    	var message = {
		    		name: $('#name').val(),
		    		room: $('#room').val(),
		    		text: $('#message').val()
		    	};
	    		socket.emit('message', message);
	    		$('#message').val('');
    		}
    	}
	});
});