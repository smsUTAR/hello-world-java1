// before run ngrok on node, run the following commands:-
//set NGROK_AUTHTOKEN=2kovYxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//node index.js

const http = require('http');
const ngrok = require('@ngrok/ngrok');

// Create webserver
http.createServer((req, res) => {
	res.writeHead(200, { 'Content-Type': 'text/html' });
	res.end('Congrats you have created an ngrok web server');
}).listen(8085, () => console.log('Node.js web server at 8085 is running...'));

// Get your endpoint online
ngrok.connect({ addr: 8080, authtoken_from_env: true })
	.then(listener => console.log(`Ingress established at: ${listener.url()}`));