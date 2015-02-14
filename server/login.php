<?php
	// Login class that gets username and password from db and returns json if true or false.
	header('content-type:application/json; charset=utf-8');
	include('class/mysql_crud.php');
	$db = new Database();
	$db->connect();

	/* Get the post values */
	$username = $db->escapeString($_POST['username']);
	$password = $db->escapeString($_POST['password']);

	$db->select('users', 'id, username', '', 'username = "'.$username.'" AND password = "'.$password.'"' );
	$res = $db->numRows();
	$info = $db->getResult();
	if($res){
		session_start();
		$_SESSION['is_logged_in'] = 1;
		$_SESSION['id'] = $info[0]['id'];
		echo json_encode($info);
	}else{
		echo json_encode(array("error"=>true));
	}

?>