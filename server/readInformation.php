<?php
	/* Database name  : citrixdeadlyreport */
	include('class/mysql_crud.php');

	/* Set session first */
	session_start();
	$user_id = $_SESSION['id'];

	/* Connect to db */
	$db = new Database();
	$db->connect();

	
	if(isset($_GET['action']) AND $_GET['action'] == "getTodayInfo"){
		/* Get information if user has entered in the db for today and if so how many records */
		/* SELECT COUNT(1) AS `entries` FROM `task_details` WHERE `users_id` = '1' AND `date` >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY*/
		$db->select('task_details','ATtask_id, project_name, description, time_spent, project_status', '', 'users_id = "'.$user_id.'" AND date >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY');
		$res = $db->getResult();
		echo json_encode($res);
		exit();
	}


	if(isset($_GET['action']) AND $_GET['action'] == "postTodayInfo"){
		$ATtask_id = $db->escapeString($_POST['ATtask_id']);
		$project_name = $db->escapeString($_POST['project_name']);
		$description = $db->escapeString($_POST['description']);
		$time_spent = $db->escapeString($_POST['time_spent']);
		$project_status = $db->escapeString($_POST['project_status']);

		$db->insert('task_details',array('users_id'=>$user_id, 'ATtask_id'=>$ATtask_id, 'project_name'=>$project_name, 'description'=>$description, 'time_spent'=>$time_spent, 'project_status'=>$project_status)); // Table name, column names and values, WHERE conditions
		$res = $db->getResult();
		print_r($res);
	}

?>