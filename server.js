
require('coffee-script');

var express = require('express');
var app     = express();

require('./boot')(express, app);

app.get('/', function(req, res){
  var body = 'Hello World';
  res.setHeader('Content-Type', 'text/plain');
  res.setHeader('Content-Length', body.length);
  res.end(body);
});

app.listen(app.settings.port, function(){
  console.log("CodeBlast 2013 > Demo App is up. Yay!");
});
