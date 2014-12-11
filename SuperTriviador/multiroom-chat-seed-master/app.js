
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes/router')
  , http = require('http')
  , path = require('path')
  , helmet = require('helmet');
var app = express();

// all environments
app.set('port', process.env.PORT || 3003);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.locals.pretty = true;
app.use(express.favicon());
//app.use(express.logger('dev'));
app.use(express.bodyParser());
helmet.defaults(app);
app.use(express.methodOverride());
app.use(require('stylus').middleware(__dirname + '/public'));
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

var server = http.createServer(app);
var io = require('socket.io').listen(server);
io.set('log level', 1);

routes(app, io);

server.listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
