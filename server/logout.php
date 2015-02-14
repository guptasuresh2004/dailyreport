<?php
session_start();
session_destroy();   // function that Destroys Session 
header("Location: http://localhost/dailyreport/login.html");
exit;
?>