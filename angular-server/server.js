
var http = require("http");
var express = require('express');
var app = express();
var mysql = require('mysql');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'todolist'
});


connection.connect(function (err) {
    if (err) throw err
    console.log('You are now connected...')
})


app.use(bodyParser.json());       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));

var cors = require('cors')
app.use(cors());



app.get('/PersonsList', function (req, res) {
    console.log(req);
    connection.query('SELECT * FROM persons', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/ToDoList', function (req, res) {
    console.log(req);
    connection.query('SELECT * FROM todo', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});


app.post('/AddToDo', function (req, res) {

    console.log(req);
    var post = {
        desc: req.body.desc,
        startDate: req.body.startDate,
        idPerson: req.body.idPerson
    };

    connection.query('INSERT INTO todo SET ?', post, function (error, results, fields) {
 //   connection.query(' INSERT INTO `todo`( `desc`, `startDate`, `idPerson`) VALUES (`desc`,2019-04-01,1)', post, function (error, results, fields) { 
   if (error) {
            console.log(error.message);
        } else {
            console.log('success');
        }
    });
    res.redirect("ToDoList");
});

var server = app.listen(3000, "127.0.0.1", function () {

    var host = server.address().address
    var port = server.address().port

    console.log("Example app listening at http://%s:%s", host, port)

});