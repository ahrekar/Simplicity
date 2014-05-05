<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}"
	type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script src="scripts/jquery-2.1.0.min.js"></script>
	<script src="${resource(dir: 'js', file: 'index.js')}"></script>
 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(document).ready(function(){
	$( "#go1" ).click(function() {
		$( "#block1" )
		.animate({ width: "100%",height:"90%" }, { queue: false, duration: 3000 })
		$( "#block1" )
		.animate({ height: "90%" }, { queue: false, duration: 3000 })
		});
});
</script>
</head>

<body id="body">
	<header>
		<h1>Simplicity</h1>
		<div id="navbar">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Overview</a></li>
				<li><a href="#">Assignments</a></li>
				<li><a href="#">Materials</a></li>
				<li><a href="#">Grades</a></li>
				<li><a href="#">Communication</a></li>
			</ul>
		</div>
	</header>

	<div class="card-div">
		<div class="panel panel-default" id="block1">
			<div class="panel-heading">
				<h3 class="panel-title">UI Design</h3>
			</div>
			<table class="table table-hover">
				<tr>
					<th>Assignment</th>
					<th>Grade</th>
				</tr>
				<tr>
					<td>Assigntment 1</td>
					<td>98%</td>
				</tr>
			</table>
			<div class="panel-footer" id="go1">Show More...</div>
		</div>

		<div class="panel panel-default" id="block1">
			<div class="panel-heading">
				<h3 class="panel-title">UI Design</h3>
			</div>
			<table class="table table-hover">
				<tr>
					<th>Assignment</th>
					<th>Grade</th>
				</tr>
				<tr>
					<td>Assigntment 1</td>
					<td>98%</td>
				</tr>
			</table>
			<div class="panel-footer" id="go1">Show More...</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Accounting</h3>
			</div>
			<div class="panel-body">Course Content</div>
		</div>
		
	</div>
</body>


</html>