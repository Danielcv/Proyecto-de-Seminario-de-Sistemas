var express = require('express');
var router = express.Router();

// importando modelos
var usuario_model = require('../models/usuario_model');
var partida_model = require('../models/partida_model');
var tema_model = require('../models/tema_model');
var temasenpartida_model = require('../models/temasenpartida_model');

/* GET home page. */
router.get('/', function(req, res) {
    if(typeof(req.session.nick) !== 'undefined'){
        // HOME cuando ya se ha iniciado sesión
        res.render('home', {
            title: 'TribiadorOnline.bo',
            session_nick: req.session.nick,
            session_first_name: req.session.nombre,
            session_identificadorr: req.session.identificador
        });
    }
    else{
        // INDEX cuando no se tiene iniciada la sesión
        res.render('index', {
            title: 'TriviadorOnline.bo - Iniciar Sesion'
        });
    }
});

router.get('/login', function(req, res){
    res.redirect('/');
});
//router.post('/login', function(req, res){
//    req.session.nick = req.body.nick;
//    req.session.myid = '1';
//    res.redirect('/');
//});
router.post('/login', function(req, res){
    var email = req.body.email;
    // console.log("Email a buscar: " + email);
    usuario_model.getUserByEmail(email, function(result){
        // console.log(result);
        if(typeof(result[0]) !== 'undefined'){
            // console.log("Sí hay usuario.");
            // console.log(result);
            req.session.nick = result[0].username;
            req.session.identificador = result[0].id;
            req.session.nombre = result[0].first_name;
            res.redirect('/');
        }
        else{
            res.redirect('/');
        }
    });
});

router.get('/logout', function(req, res){
    delete(req.session.nick);
    delete(req.session.id);
    res.redirect('/');
});

// GAME
router.get('/create_game', function(req, res){
    if(typeof(req.session.nick) !== 'undefined'){
        var mi_var = [];
        tema_model.getAll(function(rows){
            for(var i = 0; i < rows.length; i++){
                mi_var.push(rows[i]);
            }
            res.render('create_game', {
                title: 'Crear Juego',
                session_nick: req.session.nick,
                temas: mi_var
            });
        });
    }
    else{
        res.redirect('/');
    }
});
// Del formulario a guardar
router.post('/create_game', function(req, res){
    if(typeof(req.session.nick) !== 'undefined'){
        var dataIn = req.body;
        console.log(dataIn);
        if(typeof(req.session.identificador) !== 'undefined'){
            var session_id = req.session.identificador;
            // console.log("ID de sesión: " + session_id + " --> " + req.session.nick);
            partida_model.insert(dataIn, session_id, function(result){
                // console.log(result);
                console.log("Id de partida insertado: " + result.insertId);
                
                // Crear relacion * a * de Partida y Temas
                for(var i = 0; i < dataIn.temas.length; i++){
                    sub_dataIn = {
                        IdTema: dataIn.temas[i],
                        IdPartida: result.insertId
                    };
                    temasenpartida_model.insert(sub_dataIn, function(sub_result){
                        console.log(sub_result);
                    });
                }
                res.redirect('/partida/' + result.insertId);
            });
        }
        else{
            res.redirect('/');
        }
    }
    else{
        res.redirect('/');
    }
});
var GetTemas = function(IdPartida){
    var nombreTemas = [];
    partida_model.getById(IdPartida, function(partida, error){
        if(error !== true){
            console.log("De la BD: " + partida.id);
            temasenpartida_model.getIdTemaByIdPartida(partida.id, function(rows){
                for(var i = 0; i < rows.length; i++){
                    tema_model.getById(rows[i].IdTema, function(tema){
                        nombreTemas.push(tema.nombre);
                    });
                }
            });
        }
    });
    console.log(nombreTemas);
    return nombreTemas;
};
// IN GAMING
//router.get('/partida/:id', function(req, res){
//    if(typeof(req.session.nick) !== 'undefined'){
//        partida_model.getById(req.params.id, function(row, error){
//            if(error === false){
//                var mis_temas = GetTemas(req.params.id);
//                console.log("Mis Temas");
//                console.log(mis_temas);
//            }
//            else{
//                res.redirect('/');
//            }
//        });
//    }
//    else{
//        res.redirect('/');
//    }
//});
router.get('/partida/:id', function(req, res){
    var NombresTemas = ['List of: temas'];
    if(typeof(req.session.nick) !== 'undefined'){
        partida_model.getOne(req.params.id, function(row){
            if(typeof(row[0]) === 'undefined'){
                // Redireccionar a un error.
                res.redirect('/');
            }
            else{
                var NombresTemas = [];
                temasenpartida_model.getByIdPartida(req.params.id, function(rows){
                    console.log("Solicitando todos los ID de TemasEnPartida desde IdPartida.");
                    for(var i = 0; i < rows.length; i++){
                        tema_model.getNombreById(rows[i].IdTema, function(nombreTema, err){
                            if(err === false){
                                NombresTemas.push(nombreTema);
                                // console.log(NombresTemas);
                            }
                        });
                    }
                });
                console.log("Temas rescatados...");
                console.log(NombresTemas);
                if(typeof req.session.nick !== 'undefined'){
                    res.render('in_game', {
                        title: 'Trivia - Partida',
                        game_name: row[0].Nombre,
                        game_type: row[0].Tipo,
                        game_numberquestions: row[0].NumeroPreguntas,
                        game_timeanswer: row[0].TiempoRespuesta,
                        session_nick: req.session.nick,
                        game_temas: NombresTemas
                    });
                }
                else{
                    res.render('index', {
                        title: 'Trivia - Inicia Sesión'
                    });
                }
            }
        });
    }
    else{
        res.redirect('/');
    }
});

router.get('/start_game', function(req, res){
    if(typeof(req.session.nick) !== 'undefined'){
        res.render('on_game', {
            title: 'Crear Juego',
            session_nick: req.session.nick
        });
    }
    else{
        res.redirect('/');
    }
});

//usuario_model.getAll(function(rows){
//    console.log(rows);
//});

module.exports = router;
