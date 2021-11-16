/**
 * A collection of useful functions.
 *
 * @author Nenad Cuturic
 */
/* jshint node: true */
/* jshint esversion: 8 */
"use strict";

const fetch = require("node-fetch");

// const { table } = require("node:console");

function isEmpty(obj) {
    for (var i in obj) return false;
    return true;
}

async function fetchFilteredLogs(url) {
    return await fetch(url)
        .then(response => response.json())
        .then(resJson => {
            const data = resJson.logs;
            // console.log(data);
            return data;
        })
        .catch(error => console.log(error));
}

/**
 * Filter and return logs for presentation.
 *
 * @param {base_url} string      Server base url with API.
 * @param {params} object    Object containing filter parameters
 * @returns {logs} object   Filtered logs in json format
*/

async function getFilterdLogs(base_url, params) {
    let url = base_url;
    let first = true;

    if (!isEmpty(params)) {
        url += "?";
    }

    if (params.ip) {
        if (!first) {
            url += "&";
        } else {
            first = false;
        }
        url += `ip=${params.ip}`;
    }
    if (params.url) {
        if (!first) {
            url += "&";
        } else {
            first = false;
        }
        url += `url=${params.url}`;
    }
    if (params.month) {
        if (!first) {
            url += "&";
        } else {
            first = false;
        }
        url += `month=${params.month}`;
    }
    if (params.day) {
        if (!first) {
            url += "&";
        } else {
            first = false;
        }
        url += `day=${params.day}`;
    }
    if (params.time) {
        if (!first) {
            url += "&";
        }
        url += `time=${params.time}`;
    }
    console.log(url);
    const logs = await fetchFilteredLogs(url);

    return logs;
}

module.exports = {
    getFilterdLogs
}
