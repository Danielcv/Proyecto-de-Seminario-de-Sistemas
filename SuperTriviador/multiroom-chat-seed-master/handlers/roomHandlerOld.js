function RoomHandler() {
	"user strict";

	var rooms = [];
	var connectedClients = {};
	var that = this;

	this.addUserToRoom = function(client, data, callback) {
		if(rooms["'"+data.room+"'"] != undefined && rooms["'"+data.room+"'"] != null) {
			connectedClients[client.id] = {room: data.room, name: data.name};
			rooms["'"+data.room+"'"].push(client);
			that.notifyNewUser(data.room, client.id, data.name, function(){});
			callback('user-added', true);
		}
		else {
			rooms["'"+data.room+"'"] = [];
			rooms["'"+data.room+"'"].push(client);
			connectedClients[client.id] = {room: data.room, name: data.name};
			that.notifyNewUser(data.room, client.id, data.name, function(){});
			callback('room-created-and-user-added', true);
		}
	};

	this.removeUserFromRoom = function(client, callback) {
		var room = connectedClients[client.id].room;
		if(rooms["'"+room+"'"] != undefined && rooms["'"+room+"'"] != null) {
			var index = rooms["'"+room+"'"].indexOf(client);
			if(index > -1) {
				rooms["'"+room+"'"].splice(index, 1);
				callback('client-removed', true);
			}
			else {
				console.log('Client not found... could not be removed');
				callback('client-not-removed', false);
			}
		}
		else {
			console.log('Room not found... client could not be removed');
			callback('client-not-removed', false);
		}
	};

	this.broadcastRoom = function(room, msg, callback) {
		if(rooms["'"+room+"'"] != undefined && rooms["'"+room+"'"] != null) {
			for(var i=0; i<rooms["'"+room+"'"].length; i++){
				rooms["'"+room+"'"][i].emit('message', msg);
			}
			callback('broadcasted', true);
		}
		else {
			callback('error', false);
		}
	};

	this.notifyNewUser = function(room, userid, username, callback) {
		if(rooms["'"+room+"'"] != undefined && rooms["'"+room+"'"] != null) {
			for(var i=0; i<rooms["'"+room+"'"].length; i++){
				if(rooms["'"+room+"'"][i].id != userid){
					rooms["'"+room+"'"][i].emit('nuser', username);
				}
			}
			callback('notified', true);
		}
		else {
			callback('error', false);
		}
	};

	this.notifyUserDisconnected = function(clientid, callback) {
		var room = connectedClients[clientid].room;
		var name = connectedClients[clientid].name;
		if(rooms["'"+room+"'"] != undefined && rooms["'"+room+"'"] != null) {
			for(var i=0; i<rooms["'"+room+"'"].length; i++){
				rooms["'"+room+"'"][i].emit('udisconnected', name);
			}
			callback('notified', true);
		}
		else {
			callback('error', false);
		}
	};

	this.sendRoomUserList = function(room, username, callback) {
		var userlist = [];
		if(rooms["'"+room+"'"] != undefined && rooms["'"+room+"'"] != null) {
			for(var i=0; i<rooms["'"+room+"'"].length; i++){
				if(rooms["'"+room+"'"][i].id != username){
					var name = connectedClients[rooms["'"+room+"'"][i].id].name;
					userlist.push(name);
				}
			}
			callback('userlist', userlist);
		}
		else {
			callback('error', null);
		}
	};
};

module.exports = RoomHandler;
