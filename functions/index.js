const functions = require("firebase-functions");
const fetch = require('node-fetch');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.makeUppercase = functions.firestore.document('/messages/{documentId}')
    .onCreate((snap, context) => {
        const original = snap.data().original;
        console.log('Uppercasing', context.params.documentId, original);
        const uppercase = original.toUpperCase();
        return snap.ref.set({ uppercase }, { merge: true });
    });


const END_POINT = 'http://localhost:5001/emulatorui/eur-3/getWeatherTrigger';

exports.updateWeatherTrigger = functions
    .firestore
    .document('walks/{id}')
    .onCreate(async (snap) => {
        const { location } = snap.data();
        const body = JSON.stringify({ location });
        const response = await fetch(END_POINT, { method: 'POST', body });
        const weather = await response.json();
        return snap.ref.update({ weather });
    });

exports.getWeatherTrigger = functions
    .https
    .onRequest((request, response) => {
        const { location } = request.body;
        const WEATHER_MAP = {
            'Washington, DC ': 23.4,
            'Paris, France': 21.9,
            'London, UK': 19.4
        };
        const temperature = WEATHER_MAP[location];
        response.json({
            temperature,
            metric: 'celsius'
        });
    }