var mysql = require('../db/mysql');
var query = mysql({
    host: "localhost",
    user: "root",
    password: "",
    database: "tribiadoronlinedb"
});
var nombreTabla = "auth_user";
Usuario = {};

// Select Usuario by email
Usuario.getUserByEmail = function(dataIn, callback){
    console.log("Previo a la consulta: " + dataIn);
    query.get(nombreTabla).where({
        email: dataIn
    }).execute(function(rows){
        console.log(rows);
        callback(rows);
    });
};

// Select * from Usuario
Usuario.getAll = function(callback){
    query.get(nombreTabla).execute(function(rows){
        // Devuelve todos los datos de la tabla
        callback(rows);
    });
};

// Insert into Usuario
//Usuario.insert = function(dataIn, callback){
//    var data = {
//        Nick: dataIn.username,
//        Clave: dataIn.password,
//        FechaReg: currentDate()
//    };
//    query.save(nombreTabla, data, function(result){
//        callback(result);
//    });
//};

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

module.exports = Usuario;