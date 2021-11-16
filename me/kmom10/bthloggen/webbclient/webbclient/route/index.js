/**
 * General routes.
 */
"use strict";

const express = require("express");
const router = express.Router();
const config = require("../config/config.json");
const func = require("../src/functions");

// Add a route for the path /
router.get(["/", "/index"], (req, res) => {
    const params = {
        ip: '',
        url: '',
        month: '',
        day: '',
        time: '',
    }
    let data = {
        title: "Välkommen | vlinux kmom10",
        path: req.path,
        base_url: config.server_base_url,
        params: params,
        log: null,
    };
    req.session.name = 'docker';

    res.render("index", data);
});

router.post(["/", "/index"], async (req, res) => {
    const params = {
        ip: req.body.ip,
        url: req.body.url,
        month: req.body.month,
        day: req.body.day,
        time: req.body.time,
    }
    console.log(params);
    let filterdLogs = await func.getFilterdLogs(config.server_base_url, params);
    // console.log(filterdLogs);
    const data = {
        title: "Välkommen | vlinux kmom10",
        path: req.path,
        base_url: config.server_base_url,
        params: params,
        log: filterdLogs,
    };
    req.session.name = 'docker';

    res.render("index", data);
});

module.exports = router;
