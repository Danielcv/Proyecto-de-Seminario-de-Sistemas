var mysql = require('../db/mysql');
var query = mysql({
    host: "localhost",
    user: "root",
    password: "",
    database: "tribiadoronlinedb"
});
var nombreTabla = "TemasEnPartida";
TemasEnPartida = {};

TemasEnPartida.insert = function(dataIn, callback){
    var data = {
        IdTema: dataIn.IdTema,
        IdPartida: dataIn.IdPartida
    };
    query.save(nombreTabla, data, function(result){
        callback(result);
    });
};

TemasEnPartida.getByIdPartida = function(dataIn, callback){
    query.get(nombreTabla).where({
        IdPartida: dataIn
    }).execute(function(row){
        callback(row);
    });
};

TemasEnPartida.getIdTemaByIdPartida = function(idpartida, callback){
    query.get(nombreTabla).where({
        IdPartida: idpartida
    }).execute(function(rows){
        callback(rows);
    });
};

module.exports = TemasEnPartida;
