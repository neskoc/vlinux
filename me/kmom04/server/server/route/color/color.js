/**
 * Route for color.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const func = require("../../src/functions.js");
const items = require("../../data/items.json");

router.get("/:color", async (req, res) => {
    res.json(await func.getPlants(items, req.params.color));
});

module.exports = router;
