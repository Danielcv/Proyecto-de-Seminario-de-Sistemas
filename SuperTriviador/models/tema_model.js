var mysql = require('../db/mysql');
var query = mysql({
    host: "localhost",
    user: "root",
    password: "",
    database: "tribiadoronlinedb"
});
var nombreTabla = "principal_tema";

Tema = {};

Tema.getAll = function(callback){
    query.get(nombreTabla).execute(function(rows){
        // Devuelve todos los datos de la tabla
        callback(rows);
    });
};

Tema.getNombreById = function(dataIn, callback){
    query.get(nombreTabla).where({
        id: dataIn
    }).execute(function(rows){
        // Devuelve todos los datos de la tabla
        if(typeof(rows[0]) !== 'undefined'){
            console.log("ADD:::::::::::" + rows[0].nombre);
            callback(rows[0].nombre, false);
        }
        else{
            console.log("ATENCION!!!!!!!!!!!!!!!!");
            callback(rows, true);
        }
    });
};

Tema.getById = function(idtema, callback){
    query.get(nombreTabla).where({
        id: idtema
    }).execute(function(row){
        
        callback(row[0]);
    });
};

module.exports = Tema;