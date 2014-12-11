var RoomHandler = require('../handlers/roomHandler');

module.exports = function(app, io) {

	var roomHandler = new RoomHandler(io);

	//Cross-origin request error parser
	/*
	app.all('/*', function(req, res, next) {
		res.header("Access-Control-Allow-Origin", "*");
		res.header("Access-Control-Allow-Headers", "X-Requested-With");
		res.header("Access-Control-Allow-Methods", "GET, POST","PUT");
		next();
	});

	app.get('/', function(req, res) {
		res.render('index', {title: 'MultiRoom Chat Service with NodeJS & Socket.io'});
	});
	*/
	app.get('*', function(req, res) { res.render('404', { title: 'Page Not Found'}); });

	io.on('connection', function (client) {
		console.log('New connection...'+client.id);

		client.on('disconnect', function() {
			console.log('User disconnected...');
			roomHandler.removeUserFromRoom(client, function(code, res){
				if(res){
					roomHandler.notifyUserDisconnected(client, function(){});
				}
			});
		});

		client.on('data', function(data) {
			client.nickname = data.name;
			client.room = data.room;
			roomHandler.addUserToRoom(client, function(code, res){
				if(res){
					roomHandler.sendRoomUserList(client, function(code, res){
						if(res){
							client.emit('userlist', res);
						}
					})
				}
			});
		});

		client.on('message', function(message) {
			message.text = message.name+ ': '+message.text;
			roomHandler.broadcastRoom(message.room, message.text, function(code, res){});
		});

		client.on('private', function(message) {
			roomHandler.sendPrivate(message, function(code, res){});
		});
	});
};