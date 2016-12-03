socket.on('signal' , callback(message))
  Receiver function: listens on message with specified 'signal', and pass msg to
  the callback


socket.emit

// sending to sender-client only
socket.emit('message', "this is a test");

// sending to all clients, include sender
io.emit('message', "this is a test");

// sending to all clients except sender
socket.broadcast.emit('message', "this is a test");

// sending to all clients in 'game' room(channel) except sender
socket.broadcast.to('game').emit('message', 'nice game');

// sending to all clients in 'game' room(channel), include sender
io.in('game').emit('message', 'cool game');

// sending to sender client, only if they are in 'game' room(channel)
socket.to('game').emit('message', 'enjoy the game');

// sending to all clients in namespace 'myNamespace', include sender
io.of('myNamespace').emit('message', 'gg');

// sending to individual socketid
socket.broadcast.to(socketid).emit('message', 'for your eyes only');


// The 3rd parameter (callback)
//callback signiture = function(data){ action depending on the data sent back from server }
socket.emit('event', 'message', callback);
// On the server side...
socket.on('event', function(data, callback){
  callback(acknowledgement)// send acknowledgement back to the sender automatically, no need to define the callback
}); //inside the callback emit the data back to clients
