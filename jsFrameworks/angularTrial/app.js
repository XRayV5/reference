var express = require('express');
var app = express();
var http = require('http').Server(app);
var port = process.env.PORT || 3222;

app.get('/', function(req, res) {
  //send back the main page
 res.sendFile(__dirname + '/public/index.html');

});

app.use(express.static('public'));

http.listen(port, function() {
    console.log('listening on *: ' + port);
});
