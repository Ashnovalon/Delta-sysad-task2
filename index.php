<?php

$connect = mysqli_connect(
    'mysql', # service name
    'testuser', # username
    'test', # password
    'testdb' # db table
);

$table_name = "user_details";

$query = "SELECT * FROM $table_name";

$response = mysqli_query($connect, $query);

echo "<strong>$table_name: </strong>";
while($i = mysqli_fetch_assoc($response))
{
    echo "<p>".$i['user']."</p>";
    echo "<p>".$i['group']."</p>";
    echo "<hr>";
}
