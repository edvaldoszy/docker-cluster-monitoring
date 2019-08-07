const promClient = require('prom-client');
const app = require('./app');


promClient.collectDefaultMetrics();

app.get('/metrics', (request, response) => {
    response.send(promClient.register.metrics());
});

app.listen(3001, () => console.log('Server listening'));
