var mysql = require('../db/mysql');
var query = mysql({
    host: "localhost",
    user: "root",
    password: "",
    database: "tribiadoronlinedb"
});

Partida = {};

// Select * from Partida
Partida.getAll = function(callback){
    query.get("Partida").execute(function(rows){
        // Devuelve todos los datos de la tabla
        callback(rows);
    });
};

// Select * from Partida where Id = idpartida
Partida.getOne = function(idpartida, callback){
    query.get("Partida").where({ id: idpartida }).execute(function(rows){
        // Devuelve todos los datos de la tabla
        callback(rows);
    });
};

Partida.getById = function(idpartida, callback){
    query.get("Partida").where({
        id: idpartida
    }).execute(function(row){
        if(typeof(row[0]) !== 'undefined'){
            callback(row[0], false);
        }
        else{
            callback(row, true);
        }
    });
};

// Insert into Partida
Partida.insert = function(dataIn, session_id, callback){
    var data = {
        IdUsuario: session_id,
        Nombre: dataIn.name,
        Tipo: dataIn.type,
        Clave: dataIn.password,
        NumeroPreguntas: dataIn.numberquestions,
        TiempoRespuesta: dataIn.timeanswer,
        FechaReg: currentDate()
    };
    // console.log(dataIn);
    query.save("Partida", data, function(result){
        callback(result);
    });
};

function currentDate(){
    var currDate = new Date();
    var year = currDate.getFullYear();
    var month = currDate.getMonth() + 1;
    var day = currDate.getDate();
    var hour = currDate.getHours();
    var min = currDate.getMinutes();
    var seg = currDate.getSeconds();
    
    if(month <= 9){
        month = '0' + month;
    }
    if(day <= 9){
        day = '0' + day;
    }
    if(hour <= 9){
        hour = '0' + hour;
    }
    if(min <= 9){
        min = '0' + min;
    }
    if(seg <= 9){
        seg = '0' + seg;
    }
    var formatDate = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + seg;
    return formatDate;
}

module.exports = Partida;