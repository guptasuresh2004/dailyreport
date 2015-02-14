<?php
	/* Database name  : DailyReport */
	include('class/mysql_crud.php');

	/* Set session first */
	session_start();
	$user_id = $_SESSION['id'];

	/* Connect to db */
	$db = new Database();
	$db->connect();

	$table_name = "task_details";

	if(isset($_GET['action']) AND $_GET['action'] == "getTodayInfo"){
		/* Get information if user has entered in the db for today and if so how many records */
		/* SELECT COUNT(1) AS `entries` FROM `task_details` WHERE `users_id` = '1' AND `date` >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY*/

		if(isset($_GET['id'])){
			$where = 'id = '.$_GET['id'].' AND users_id = '.$user_id.' ';
		}else{
			$where = "users_id = '".$user_id."'";
		}

		$db->select($table_name,'id, ATtask_id, project_name, description, time_spent, project_status', '', ''.$where.' AND date >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY');
		/* Count the results that you get from select statment */
		/* If zero, then user has not entered anything in db */
		$count = $db->numRows();
		if($count){
			$res = $db->getResult();
		}else{
			$res = array();
		}
		echo json_encode($res);
		exit();
	}


	if(isset($_GET['action']) AND $_GET['action'] == "postTodayInfo"){

		$ATtask_id = $db->escapeString($_POST['ATtask_id']);
		$project_name = $db->escapeString($_POST['project_name']);
		$description = $db->escapeString($_POST['description']);
		$time_spent = $db->escapeString($_POST['time_spent']);
		$project_status = $db->escapeString($_POST['project_status']);

		if(isset($_POST[id]) && $_POST['id'] != ""){
			$id = $db->escapeString($_POST['id']);
			$db->update($table_name,array('ATtask_id'=>$ATtask_id, 'project_name'=>$project_name, 'description'=>$description, 'time_spent'=>$time_spent, 'project_status'=>$project_status),'id="'.$id.'" AND users_id="'.$user_id.'"'); // Table name, column names and values, WHERE conditions
		}else{
			$db->insert($table_name,array('users_id'=>$user_id, 'ATtask_id'=>$ATtask_id, 'project_name'=>$project_name, 'description'=>$description, 'time_spent'=>$time_spent, 'project_status'=>$project_status)); // Table name, column names and values, WHERE conditions	
		}
		$res = $db->getResult();

	}


	/* Delete the post based on the selection */
	if(isset($_GET['action']) AND $_GET['action'] == "deletePost"){

		$ATTASKID = $db->escapeString($_POST['id']);
		$db->delete($table_name,'id="'.$ATTASKID.'" AND users_id="'.$user_id.'"');  // Table name, WHERE conditions
		$res = $db->getResult();
	}

?>