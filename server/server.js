const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

const clients = {};
const publicKeys = {};

wss.on('connection', function connection(ws) {

    ws.on('message', function incoming(message) {

        const data = JSON.parse(message);

        // Register user
        if (data.type === "register") {
            clients[data.username] = ws;
            publicKeys[data.username] = data.publicKey;
            console.log(data.username + " connected");
        }

        // Public key request
        else if (data.type === "get_public_key") {
            const requester = ws;
            const key = publicKeys[data.username];

            if (key) {
                const response = {
                    type: "public_key_response",
                    username: data.username,
                    publicKey: key
                };

                requester.send(JSON.stringify(response));
            }
        }

        // Encrypted message forwarding
        else if (data.type === "message") {
            const recipient = clients[data.to];

            if (recipient) {
                console.log("Forwarding encrypted message from",
                            data.from, "to", data.to);
                recipient.send(JSON.stringify(data));
            }
        }
    });

    ws.on('close', function () {
        for (let user in clients) {
            if (clients[user] === ws) {
                console.log(user + " disconnected");
                delete clients[user];
                delete publicKeys[user];
                break;
            }
        }
    });
});

console.log("Server running on ws://localhost:8080");