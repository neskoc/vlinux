<?php

$request = $_SERVER["REQUEST_URI"];

switch ($request) {
    case "":
    case "/":
        include(__DIR__ . "/routes/index.php");
        break;
    default:
        include(__DIR__ . "/routes/404.php");
        break;
}
