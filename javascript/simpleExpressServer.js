const path = require("path");
const url = require("url");
const express = require("express");
const fs = require("fs");
const bodyParser = require("body-parser");

const _port = 8080;

const _indexPath = "/client/index.html";
const _clientPath = "/client";

app = express();

app.get("/", function(req, res) {
  res.sendFile(path.join(__dirname + _indexPath));
});

app.use("/visualization", express.static(__dirname + _clientPath));

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))

app.listen(_port, function() {
  console.log("... port %d in %s mode", app.port, app.settings.env);
});
