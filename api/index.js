const express = require('express');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const swagger = require('swagger-stats');
const axios = require('axios');
const controller = require('./controller');


const app = express();
app.use(morgan('dev'));
app.use(helmet());
app.use(cors());
app.use(helmet());
app.use(swagger.getMiddleware());


function randomRequestMethod() {
    const methods = ['get', 'post', 'put', 'delete'];
    const pos = Math.round(Math.random() * (methods.length - 1));

    return methods[pos];
}

function randomRequestEndpoint() {
    const endpoints = ['v1/test', 'v1/users', 'v1/products', 'v1/orders'];
    const pos = Math.round(Math.random() * (endpoints.length - 1));

    return endpoints[pos];
}


app.all('/v1/tests', controller);
app.all('/v1/users', controller);
app.all('/v1/products', controller);
app.all('/v1/orders', controller);


let totalRequest = 0;

setInterval(() => {
    const method = randomRequestMethod();
    const endpoint = randomRequestEndpoint();

    console.log(++totalRequest);

    axios[method](`http://127.0.0.1:3001/${endpoint}`)
        .then(_ => _)
        .catch(err => err);

}, 500);

// app.use(swagger.get)


app.listen(3001, () => console.log('Server listening on port 3001'));