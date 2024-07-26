<?php
$servername = "mysql"; // Service name of the MySQL container in Docker
$username = "testuser";
$password = "test";
$dbname = "testdb";

// Create connection
$connect = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
}
?>
