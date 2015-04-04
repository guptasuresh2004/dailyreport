<?php
session_start();
session_destroy();   // function that Destroys Session 
header("Location: http://localhost/dailyreport/login.html");
//header("Location: http://localhost:8080/citrix-dr/login.html");
exit;
?>