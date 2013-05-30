
require('coffee-script');

var express = require('express');
var app     = express();

require('./boot')(express, app);
require('./routes')(app);

app.listen(app.settings.port, function(){
  console.log("CodeBlast 2013 > Demo App is up. Yay!");
});
