/**
 * A collection of useful functions.
 *
 * @author Nenad Cuturic
 */
/* jshint node: true */
/* jshint esversion: 8 */
"use strict";

// const { table } = require("node:console");

function isEmpty(obj) {
    for (var i in obj) return false;
    return true;
}

function checkTime(logTimeStr, timeStr) {
    const logTimeParts = logTimeStr.split(":");
    const timeParts = timeStr.split(":");

    let logTime = new Date();
    let time = new Date();

    if (timeParts.length === 3) {
        logTime.setSeconds(logTimeParts[2]);
        time.setSeconds(timeParts[2]);
    } else if (timeParts.length < 3) {
        if (timeParts.length === 2) {
            logTime.setMinutes(logTimeParts[1]);
            time.setMinutes(timeParts[1]);
        } else {
            logTime.setMinutes(0);
            time.setMinutes(0);
        }
        logTime.setHours(logTimeParts[0]);
        time.setHours(timeParts[0]);

        logTime.setSeconds(0);
        time.setSeconds(0);
    }

    return logTime.getTime() === time.getTime();
}

/**
 * Filter and return logs depending on query parameters.
 *
 * @param {items} json      Content of json file containing logs.
 * @param {query} object    Object containing query parameters sent with get request
 * @returns {data} object   Filtered logs in json format
*/

async function getLogs(logs, query) {
    let data;

    console.log(query);

    if (!isEmpty(query)) {
        const ip = query.ip;
        const url = query.url;
        const month = query.month;
        const day = query.day;
        const time = query.time;
    
        let resLogs = [];
        let toReturn;

        logs.forEach(log => {
            toReturn = true;
 
            if (ip && !log.ip.includes(ip)) {
                toReturn = false;
            }
            if (toReturn && url && !log.url.includes(url)) {
                toReturn = false;
            }
            if (toReturn && day && !log.day.includes(day)) {
                toReturn = false;
            }
            if (toReturn && month && !log.month.includes(month)) {
                toReturn = false;
            }
            if(toReturn && time && !checkTime(log.time, time)) {
                toReturn = false;
            }
            if (toReturn) {
                resLogs.push(log);
            }
        });
        data = {
            "logs": resLogs
        };
    } else {
        data = {
            "logs": logs
        };
    }

    return data;
}

module.exports = {
    getLogs
}
