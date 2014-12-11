var express = require('express');
var session = require('express-session');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var users = require('./routes/users');

var io = require('socket.io');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// Inicializando el módulo sesiones.
app.use(session({
    secret: 'Mi secreto',
    resave: false,
    saveUninitialized: true
}));

app.use('/', routes);
app.use('/users', users);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

var PORT = 3000;
var server = app.listen(PORT, function(){
    console.log("Iniciado en puerto " + PORT);
});

var sockets = io(server);
var usernames = [];
var salas = [];

sockets.on("connection", function(socket){
    socket.on('enviar_mensaje', function(param){
        console.log("Llego mensaje de: " + param.nick + " dice: " + param.mensaje);
        sockets.sockets.emit('enviar_mensaje', param);
    });
    
    // ON-GAMING
    socket.on('preparar_inicio', function(){
        sockets.sockets.emit("preparar_inicio");
    });
    var tmp = 0;
    socket.on('iniciar_juego', function(param){
        var incremento = 100 / param.limite;
        var str_pregunta = param.id_pregunta + ". En que año se estreno la primera pelicula Harry Potter?";
        var str_respuesta1 = "2001";
        var str_respuesta2 = "2000";
        var str_respuesta3 = "2005";
        var str_respuesta4 = "2011";
        setInterval(function(){
            if(tmp <= param.limite){
                console.log("Soy el temporalizador: " + tmp);
                sockets.sockets.emit("iniciar_juego", tmp, incremento, str_pregunta, str_respuesta1, str_respuesta2, str_respuesta3, str_respuesta4);
                tmp++;
            }
            else{
                sockets.sockets.emit("final_pregunta");
                clearInterval(this);
                tmp = 0;
            }
        }, 1000);
    });
});

module.exports = app;
