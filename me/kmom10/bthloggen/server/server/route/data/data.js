/**
 * Route for color.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const func = require("../../src/functions.js");
const items = require("../../../data/log.json");

router.get("/", async (req, res) => {
    res.json(await func.getLogs(items, req.query));
});

module.exports = router;
