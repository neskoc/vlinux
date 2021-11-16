/**
 * General routes.
 */
"use strict";

const express = require("express");
const router = express.Router();

const func = require("../src/functions.js");
const items = require("../data/items.json");

// Add a route for the path /
router.get(["/", "/index"], (req, res) => {
    let data = {
        title: "Välkommen | vlinux kmom04",
        path: req.path
    };
    req.session.name = 'docker';

    res.render("index", data);
});

router.get("/all", async (req, res) => {
    res.json(items);
});

router.get("/names", async (req, res) => {
    res.json(await func.getNames(items));
});

module.exports = router;
