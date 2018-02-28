const http = require('http');
const os = require('os');
var handler = function (request, response) {
   response.writeHead(200);
   response.end("Sóc " + os.hostname() + "!\n");
};
var www = http.createServer(handler);
www.listen(8080);
