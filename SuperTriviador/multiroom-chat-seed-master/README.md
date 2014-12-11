# MultiRoom Chat Seed

Sistema básico de Chat trabajando contra NodeJS + Express. Contiene dos partes esenciales: librerías cliente y servidor completo. En este README se especifica la parte Cliente, la cual debería de adaptarse para cada integración.

##Librerías Necesarias e Inicio

Las librerías Javascript necesarias para ejecutar el plugin de chat de Brokerstars son las siguientes:
	
	Socket.io (necesria para crear conexiones websocket con el servidor)
	JQuery (necesaria para interactuar con el DOM)

###Conexión

Para iniciar la conexión al chat deseado se deberá de ejecutar el siguiente código:

	var socket = io.connect('IP del servidor node.js');

Una vez ejecutado esto, se manejará mediante eventos ocurridos en el cliente.

##Eventos de Cliente

###Conexión Realizada

Mediante este evento se confirma la conexión al servidor. En este caso, es necesario enviar los siguientes datos: ID de sala y Nombre de Usuario.

	socket.on('connect', function () {
		//Función a ejecutar cuando se conecta con el servidor node. En el caso del chat, sería enviar nombre de usuario e ID de sala.
	});

###Listado de Usuarios Conectados

Mediante este evento se obtiene el listado de usuarios conectados de la sala conectada. Esto ocurre cuando el cliente envía los datos necesarios una vez conectado con el servidor (Sala y nombre de usuario). Esta función recibe un array con nombres de usuarios.

	socket.on('userlist', function(userlist){
		//Función a ejecutar cuando llega la lista de usuarios por primera vez. En el caso del chat, sería hacer un append a la lista de usuarios.
	});

###Nuevo usuario Conectado

Mediante este evento se notifica que un usuario nuevo se ha conectado a la sala.

	socket.on('nuser', function(username){
		//Función a ejecutar cuando un nuevo usuario se conecta al servidor.
	});

###Nuevo Mensaje de Sala

Mediante este evento se obtienen los mensajes enviados dentro de una sala. En el evento llega el mensaje en el siguiente formato: Usuario: mensaje.

	socket.on('message', function(message){
		//Función a ejecutar cuando llega un mensaje del servidor. En el caso del chat sería hacer un append del mensaje al div del chat.
	});

###Nuevo Mensaje Privado

Mediante este evento se obtienen los mensajes privados que se envían al usuario conectado. Se recibe un objeto JSON con los siguientes datos: destinatarios, texto y nombre de usuario.

	socket.on(‘private’, function(message) {
		//Función a ejecutar cuando llega un mensaje privado del servidor. En el caso del chat sería hacer un append del mensaje al div del chat.
	});

###Usuario Desconectado

Mediante este evento se notifica que un usuario se ha desconectado de la sala. A esta función llega el nombre de usuario que se ha desconectado.

	socket.on('udisconnected', function(username){
		//Función a ejecutar cuando un usuario de desconecta de la partida. En el 	caso del chat sería hacer un remove de la lista de usuarios.
	});

###Desconexión

Mediante este evento se controla lo que ocurre cuando el usuario se desconecta del servidor de chat.

	socket.on('disconnect', function(){
		//Función a ejecutar cuando el usuario se desconecta del servidor. En el caso del chat, deshabilitar la ventana del chat.
	});

##Envío de datos desde el Cliente

###Enviar Mensaje Sala

Mediante la siguientes líneas se especifica lo necesario para enviar de manera correcta un mensaje de sala. Se debe de enviar un objeto JSON con los siguientes parámetros:

	name: nombre de usuario.
	room: id de sala.
	text: mensaje a enviar.

Sentencia para enviar mensaje a sala

	socket.emit('message', { name:username, room: room, text: text});

###Enviar Mensaje Privado

Mediante la siguientes líneas se especifica lo necesario para enviar de manera correcta un mensaje de sala. Se debe de enviar un objeto JSON con los siguientes parámetros:

	name: nombre de usuario.
	room: id de sala.
	text: mensaje a enviar.

Sentencia para enviar mensaje privado

	socket.emit(‘private’, { name:username, room: room, text: text});

## Contacto

Para más información de Express y Jade, http://expressjs.com/ y http://jade-lang.com/ .

## Licencia
MIT