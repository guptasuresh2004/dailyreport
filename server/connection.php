<?php

$servername = "localhost";
$username = "root";
$password = "";

//Create Connection
$conn = new mysqli($servername, $username, $password);

//check connection
if($conn->connect_error){
	die("Connection Failed " . $conn->connect_error);
}else{
	echo "Connected to server successfully";
}

?>