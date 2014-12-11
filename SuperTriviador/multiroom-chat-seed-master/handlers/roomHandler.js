function RoomHandler(io) {
	"user strict";
	
	var that = this;

	this.addUserToRoom = function(client, callback) {
		client.join("'"+client.room+"'");
		that.notifyNewUser(client, function(){});
		callback('user-added', true);
	};

	this.removeUserFromRoom = function(client, callback) {
		client.leave("'"+client.room+"'");
		callback('client-removed', true);
	};

	this.broadcastRoom = function(room, msg, callback) {
		io.sockets.in("'"+room+"'").emit('message', msg);
		callback('notified', true);
	};

	this.notifyNewUser = function(client, callback) {
		client.broadcast.to("'"+client.room+"'").emit('nuser', client.nickname);
		callback('notified', true);
	};

	this.notifyUserDisconnected = function(client, callback) {
		client.broadcast.to("'"+client.room+"'").emit('udisconnected', client.nickname);
		callback('notified', true);
	};

	this.sendRoomUserList = function(client, callback) {
		var userlist = [];
		var clients = io.sockets.clients("'"+client.room+"'");
		
		for(var i=0; i<clients.length; i++){
			if(clients[i].nickname != client.nickname){
				userlist.push(clients[i].nickname);
			}
		}

		callback('userlist', userlist);
	};

	this.sendPrivate = function(msg, callback) {
		var sock_id = io.sockets.sockets[msg.dest];
        io.sockets.sockets[sock_id].emit("private", msg);
	}
};

module.exports = RoomHandler;
