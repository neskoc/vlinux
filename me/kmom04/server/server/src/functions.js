/**
 * A collection of useful functions.
 *
 * @author Nenad Cuturic
 */
/* jshint node: true */
/* jshint esversion: 8 */
"use strict";

// const { table } = require("node:console");

module.exports = {
    "getNames": getNames,
    "getPlants": getPlants
};

async function getNames(items) {
    let names = [];
    items.items.forEach(item => names.push(item.name));
    let data = {
        "names": names
    };
    return data;
}


/**
 * get all available shelves.
 *
 * @param {connection} db     Database connection.
 * @returns {query result}    Result from the query
 */

async function getPlants(items, color) {
    console.log(color);
    let plants = [];
    items.items.forEach(item => {
        if(item.color.includes(color)) {
            plants.push(item);
        }
    });
    let data = {
        "plants": plants
    };

    return data;
}
