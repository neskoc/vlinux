/**
 * General routes.
 */
"use strict";

const express = require("express");
const router = express.Router();

// Add a route for the path /
router.get(["/", "/index"], (req, res) => {
    let data = {
        title: "Välkommen | vlinux kmom10",
        path: req.path
    };
    req.session.name = 'docker';

    res.render("index", data);
});

module.exports = router;
