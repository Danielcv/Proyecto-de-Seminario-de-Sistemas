var mysql=require("mysql");
var db=function()
{
	this.conectar=function()
	{
		var connect=mysql.createConnection({
			host:"localhost",
			user:"root",
			password:"",
			database:"tribiadoronlinedb"
		});
		return connect;
	}
	this.getUsuarios=function(callback)
	{
		var conex=this.conectar();
		conex.connect(function(err){
			if(err)
				throw err;
		});
		conex.query("select * from auth_user",[],function(err,rows,fields){
			if(err)
				throw err;
			callback(rows);
		});
		conex.end();
	}
	return this;
}
module.exports=db;