<?php
include('db.php');

if (isset($_POST['submit'])) {
    $username = $_POST['user'];
    $password = $_POST['pass'];

    // Check if the username is an integer
    if (is_numeric($username)) {
        // Authenticate with rollno and psswd
        $sql = "SELECT * FROM userperms WHERE rollno = ? AND psswd = ?";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("is", $username, $password);
    } else {
        // Authenticate with name and psswd first
        $sql = "SELECT * FROM userperms WHERE name = ? AND psswd = ?";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ss", $username, $password);
    }

    $stmt->execute();
    $result = $stmt->get_result();
    $count = $result->num_rows;

    if ($count == 1) {
        $user = $result->fetch_assoc();
        if (is_numeric($username) || $user['perm'] == 2) {
            header("Location: welcome_core.php");
        } else {
            echo '<script>
                    window.location.href = "index.php";
                    alert("Login failed. Invalid permissions!!");
                  </script>';
        }
    } else {
        echo '<script>
                window.location.href = "index.php";
                alert("Login failed. Invalid username or password!!");
              </script>';
    }

    $stmt->close();
}
?>

