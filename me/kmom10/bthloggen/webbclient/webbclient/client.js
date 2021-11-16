/**
 * A sample Express server with static resources.
 */
"use strict";

const config = require("./config/config.json");
const port    = process.env.DBWEBB_PORT || config.client_port;
console.log(config);
// const path    = require("path");

const express = require("express");
const session = require('express-session');
const app     = express();

const routeIndex = require("./route/index.js");
const middleware = require("./middleware/index.js");
const path = require("path");

app.set("view engine", "ejs");
app.use(express.urlencoded({extended: false}));


var ID = function () {
    // Math.random should be unique because of its seeding algorithm.
    // Convert it to base 36 (numbers + letters), and grab the first 9 characters
    // after the decimal.
    return '_' + Math.random().toString(36).substr(2, 9);
};

// console.log(ID(), '_' + Math.random().toString(36).substr(2, 9));
app.use(session({ 
  
    // It holds the secret key for session 
    secret: ID(), 
  
    // Forces the session to be saved 
    // back to the session store 
    resave: true, 
  
    // Forces a session that is "uninitialized" 
    // to be saved to the store 
    saveUninitialized: true
}));

app.use(middleware.logIncomingToConsole);

app.use(express.static(path.join(__dirname, "public")));
app.use("/", routeIndex);

app.use(middleware.StandardError);
app.use(middleware.CustomError);

app.listen(port, logStartUpDetailsToConsole);

/**
 * Log app details to console when starting up.
 *
 * @return {void}
 */
function logStartUpDetailsToConsole() {
    let routes = [];

    // Find what routes are supported
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Server is listening on port ${port}.`);
    // console.info("Available routes are:");
    // console.info(routes);
}
