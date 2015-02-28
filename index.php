<?php
  //Check if user is logged in or not
  session_start();
  if(!isset($_SESSION['is_logged_in'])){
    header('Location: http://localhost/dailyreport/login.html');
    exit;
  }else{
?>
<!DOCTYPE html>
<html lang="en" ng-app="citrixDeadlyReport">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Report</title>

    <!-- Boostrap Style -->
  	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/datetimepicker.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="container-fluid" ng-controller="headerCtrl">
  		<div ng-include src="'templates/navbar-tpl.html'"></div>	
  	</div>
    
  	<div class="container">
  		<ng-view></ng-view>
  	</div>

  	<div ng-include src="'templates/footer-tpl.html'"></div>

    <!-- D3 Js Library -->
    <script type="text/javascript" src="assets/js/lib/d3.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="assets/js/lib/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="assets/js/lib/bootstrap.min.js"></script>

    <script type="text/javascript" src="assets/js/lib/moment.min.js"></script>
    <script type="text/javascript" src="assets/js/lib/angular.min.js"></script>
    <script type="text/javascript" src="assets/js/lib/angular-route.js"></script>
    <script type="text/javascript" src="assets/js/lib/angular-filter.min.js"></script>
    <script type="text/javascript" src="assets/js/lib/datetimepicker.js"></script>

    <!-- Angular Custom Code -->
    <script type="text/javascript" src="assets/js/app.js"></script>
    <!-- Controllers -->
    <script type="text/javascript" src="assets/js/controllers/AddTaskCtrl.js"></script>
    <script type="text/javascript" src="assets/js/controllers/MyTaskCtrl.js"></script>
    <script type="text/javascript" src="assets/js/controllers/DailyReportCtrl.js"></script>
    <!-- Directives -->
    <script type="text/javascript" src="assets/js/directives/ngCommonDirectives.js"></script>
    <script type="text/javascript" src="assets/js/directives/getStatistics.js"></script>
    <script type="text/javascript" src="assets/js/directives/d3Graph.js"></script>
    <!-- Services -->
    <script type="text/javascript" src="assets/js/services/ngServices.js"></script>
    <script type="text/javascript" src="assets/js/services/d3GraphService.js"></script>
    <!-- Filters -->
    <script type="text/javascript" src="assets/js/filters/ngCommonFilters.js"></script>

  </body>
</html>
<?php
}
?>