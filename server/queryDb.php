<?php
/* Database name  : citrixdeadlyreport */
include('class/mysql_crud.php');

/* Set session first */
session_start();
$user_id = $_SESSION['id'];

/* Connect to db */
$db = new Database();
$db->connect();

$table_name = "task_details";
$user_table_name = "users";
$return = array();
$res = array();
$allReports = array();


/* Send the username from session to be displayed on the header */
if(isset($_GET['action']) AND $_GET['action'] == "getUsername"){
	$username = array('username'=>$_SESSION['name']);
	echo json_encode($username);
	exit;
}


if(isset($_GET['action']) AND $_GET['action'] == "getTodayInfo"){
	/* Get information if user has entered in the db for today and if so how many records */
	/* SELECT COUNT(1) AS `entries` FROM `task_details` WHERE `users_id` = '1' AND `date` >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY*/

	if(isset($_GET['id'])){
		$where = 'id = '.$_GET['id'].' AND users_id = '.$user_id.' ';
	}else{
		$where = "users_id = '".$user_id."'";
	}

	$db->select($table_name,'id, ATtask_id, project_name, description, time_spent, project_status', '', ''.$where.' AND date >= CURDATE() AND date < CURDATE() + INTERVAL 1 DAY');


	if(isset($_GET['ReportForToday']) && $_GET['ReportForToday']){

		if(isset($_GET['dateSearch']) && $_GET['dateSearch']){
			
			$db->select($user_table_name,
				'users.id, 
				task_details.id,
				users.name,
				task_details.date,
				task_details.ATtask_id,
				task_details.project_name,
				task_details.description,
				task_details.time_spent,
				task_details.project_status', 
				'LEFT JOIN task_details ON 
				users.id=task_details.users_id AND DATE(DATE) = "'.$_GET['dateSearch'].'"', '', '');
		}
		
	}

		/*
		$res = $db->getSql();
		print_r($res);
		*/

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


	/* Get Statistics of the Users for a particular date */
	if(isset($_GET['action']) AND $_GET['action'] == "getStatisticsToDispaly"){
		if(isset($_GET['dateSearch']) && $_GET['dateSearch']){
			
			$db->sql(
				"SELECT role_name, sum(Hours) as Total_Hours, count(*) AS count FROM (
					SELECT users.id as userid, users.name AS username, role.role_name AS role_name, users.role_id AS role_id, task_details.ATtask_id as ATTASK, IF(task_details.ATtask_id IS NULL,0,8) AS Hours
					FROM users
					LEFT JOIN role
					ON users.role_id = role.role_id
					LEFT JOIN task_details
					ON
					users.id = task_details.users_id AND
					DATE(DATE) = '".$_GET['dateSearch']."' GROUP BY userid ) as T
			GROUP BY role_id"
			);

				/*
				print_r($db->getSql());
				exit();
				*/

				$count = $db->numRows();
				if($count){
					$res = $db->getResult();
				}else{
					$res = array();
				}
				echo json_encode($res);
				exit();	

			}
		}

		/* Get information to be displayed in the graph */
		if(isset($_GET['action']) AND $_GET['action'] == "getStatisticsforGraph"){
			if(isset($_GET['dateSearch']) && $_GET['dateSearch']){
				
				$db->sql(
					'SELECT IF(task_details.time_spent IS NULL, 0, SUM(task_details.time_spent)) as time_spent, users.id, users.name, task_details.date FROM users LEFT JOIN task_details ON 
					users.id=task_details.users_id AND DATE(DATE) = "'.$_GET['dateSearch'].'" GROUP BY users.id'
					);

				/*
				print_r($db->getSql());
				exit();
				*/

				$count = $db->numRows();
				if($count){
					$res = $db->getResult();
				}else{
					$res = array();
				}
				echo json_encode($res);
				exit();	

			}
		}


		/* Get a particular users data */
		if(isset($_GET['action']) AND $_GET['action'] == "getUserData"){
			/* Get information if user has entered in the db for today and if so how many records */
			
			$where = "users_id = '".$user_id."'";

			/* Get the count of records till date entered by user for pagination */

			$db->sql("SELECT count(totalcount) as total 
				FROM (
					SELECT count(*) as totalcount 
					FROM task_details 
					WHERE task_details.users_id = '".$user_id."' GROUP BY DATE(task_details.date)
					) as results"
			);
			
		//$pagination = $db->numRows();
			$pagination = $db->getResult();
			
			$return["pagination"] = $pagination;
		/*
		echo "<pre>";
		print_r($pagination);
		echo "</pre>";
		*/

		/* Get pageNumber */
		
		if(isset($_GET['itemsPerPage']) && isset($_GET['currentPage'])){
			$itemsPerPage = $_GET['itemsPerPage'];
			$currentPage = $_GET['currentPage'];
			$offset = ($currentPage - 1) * $itemsPerPage;
		}


		//$db->select($table_name,'id, ATtask_id, date(date) as date, project_name, description, time_spent, project_status', '', ''.$where.'', 'DATE(date) DESC LIMIT '.$offset.', '.$itemsPerPage.'');

		$db->sql("SELECT date(date) as mydate, 
		GROUP_CONCAT(project_name SEPARATOR ' !|! ') as project_names,
		GROUP_CONCAT(description SEPARATOR ' !|! ') as project_description,
		GROUP_CONCAT(ATtask_id SEPARATOR ' !|! ') as project_attask_id,
		GROUP_CONCAT(time_spent SEPARATOR ' !|! ') as time_spent,
		SUM(time_spent) as total_timespent,
		GROUP_CONCAT(project_status SEPARATOR ' !|! ') as project_status
		FROM task_details WHERE " . $where . " GROUP BY date(date) DESC LIMIT ".$offset.", ".$itemsPerPage."");

		/*
		SELECT date(date) as mydate, 
		GROUP_CONCAT(project_name SEPARATOR ' | ') as project_names,
		GROUP_CONCAT(description SEPARATOR ' | ') as project_description,
		GROUP_CONCAT(ATtask_id SEPARATOR ' | ') as project_attask_id,
		GROUP_CONCAT(time_spent SEPARATOR ' | ') as time_spent,
		SUM(time_spent) as total_timespent,
		GROUP_CONCAT(project_status SEPARATOR ' | ') as project_status
		FROM `task_details` WHERE users_id = '7' GROUP BY date(date) LIMIT 0,10
		*/

		// $res = $db->getSql();
		// echo $res;
		// echo "<br />";
		
		/* Count the results that you get from select statment */
		/* If zero, then user has not entered anything in db */
		
		$count = $db->numRows();
		if($count){

			$userrecords = $db->getResult();
			
			foreach($userrecords as $key => $innerarray){
				
				foreach($innerarray as $innerkey => $innervalue){
					if(strpos($innerarray[$innerkey], "!|!") !== false){
						$innervalue = explode("!|!", $innervalue);
						$userrecords[$key][$innerkey] = $innervalue;
					}				
				}

			}

			$return["userrecords"] = $userrecords;

		}else{

			$return = array();

		}

		echo json_encode($return);
		exit();
		
	}


	/* All reports page */
	if(isset($_GET['action']) AND $_GET['action'] == "getUserReports"){
		/* default values */
		$userIdForGraph = $user_id;
		if(isset($_GET['user'])){
			$userIdForGraph = $_GET['user'];
		}

		if(isset($_GET['startDate'])){
			$startDate = $_GET['startDate'];
		}

		if(isset($_GET['endDate'])){
			$endDate = $_GET['endDate'];
		}

		$db->sql("

			SELECT A._date, B.*
			FROM alldates A
			LEFT OUTER JOIN task_details B 
			ON A._date = date( B.date ) 
			AND B.users_id = '".$userIdForGraph."'
			WHERE
			(A._date
				BETWEEN  date('".$startDate."')
				AND  date('".$endDate."'))
		GROUP BY (A._date)
		ORDER BY A._date ASC

		");


		
		$countReportsData = $db->numRows();
		if($countReportsData){
			$allReports = $db->getResult();
		}else{
			$allReports = array();
		}

		/* return json data */
		echo json_encode($allReports);
	}

	if(isset($_GET['action']) AND $_GET['action'] == "getActiveUsers"){

		$db->select("users",'id,name','', 'users.is_active = 1', 'users.id ASC');
		$users = $db->getResult();
		echo json_encode($users);
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