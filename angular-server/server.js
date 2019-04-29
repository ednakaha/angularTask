var mysql = require('mysql');
var express = require('express'),
app = express(),
port = process.env.PORT || 3000;

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'todolist'
});

connection.connect(function(err) {
    if (err) throw err;
});




app.get('/ToDoList', function(req, res) {
    connection.query("select * from todo", function(err, res) {

        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
          console.log('tasks : ', res);  
    
         result(null, res);
        }
    });
})       

   
   
 


app.listen(port);