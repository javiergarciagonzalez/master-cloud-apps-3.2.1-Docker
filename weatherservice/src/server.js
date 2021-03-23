const grpc = require('grpc');
const WeatherService = require('./interface');
const weatherServiceImpl = require('./weatherService');

const server = new grpc.Server();

server.addService(WeatherService.service, weatherServiceImpl);

const weatherServiceName = process.env.WEATHER_HOST || 'localhost';
const weatherServicePort = process.env.WEATHER_PORT || '9090';
server.bind(`${weatherServiceName}:${weatherServicePort}`, grpc.ServerCredentials.createInsecure());

console.log(`gRPC server running at http://${weatherServiceName}:${weatherServicePort}`);

server.start();