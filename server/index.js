const express = require('express');
const cors = require('cors');

const app = express();


app.enable("trust proxy");

app.use(cors());
app.use(express.json());

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mypassword',
  database : 'AIBthon'
});

connection.connect();

app.get('/', (req, res) => {
    res.json({
        message: "default page for API²"
    })
    return res;
});

app.get('/deals', (req, res, next) => {
    connection.query('SELECT * FROM deals', function (error, results, fields) {
        if (error) {
            res.json({
                status: 404,
                items : 0,
                errors: error
            })
        } else {
            res.json({
                status: 200,
                items: results.length,
                data : results
            })
        }
      });
    return res;
});
app.post('/deal', (req, res, next) => {
    req = req.body;
    console.log('received');
    let query = "INSERT INTO deals(item, price,location,description) VALUES ('" + req.item +
        "'," + req.price + ",'" + req.location + "','" + req.description + "');";
        console.log(query);
        connection.query(query, function (error, result, fields){
            console.log(error, result);
            if (error) {
                console.log("error");
                res.json({
                    status: 404,
                    error: true,
                    errors: error
                })
            } else {
                console.log("succedded");
                res.json({
                    status: 200,
                    success: true
                })
            }
        });
  });

app.post('/buy', (req, res, next) => {
    res.json({
        hello: 'heyheyeeyeheyehey'
    })
  // buy somthing
});

app.listen(5000, () => {
  console.log('Listening on http://localhost:5000');
});
