
function randomStatusCode() {
    const codes = [200, 204, 400, 404, 403, 500];
    const pos = Math.round(Math.random() * (codes.length - 1));

    return codes[pos];
}


function controller(request, response) {
    response.status(randomStatusCode())
        .send();
}

module.exports = controller;