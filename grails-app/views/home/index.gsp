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
	var expanded = [false, false, false];
	$( "#go1" ).click(function() {
			buttFunc(1);
	});
	$( "#go2" ).click(function() {
		buttFunc(2);
	});
	  function buttFunc(index)
		{
			if(expanded[index] == false)
			{
			$( "#block" + index )
				.animate({ width: "100%" }, { queue: false, duration: 1000 })
				expanded[index] = true;
			$( "#go" + index ).text("Show Less..")
			}
		else
			{
			$( "#block" + index )
				.animate({ width: "49%" }, { queue: false, duration: 1000 })
				expanded[index] = false;	
			$( "#go" + index ).text("Show More..")
			}
		}
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
		<div class="panel panel-default" id="block2">
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
				<tr>
					<td>Assigntment 2</td>
					<td>98%</td>
				</tr>
				<tr>
					<td>Assigntment 3</td>
					<td>98%</td>
				</tr>
				<tr>
					<th>Assignment</th>
					<th>Due Date</th>
				</tr>
				<tr>
					<td>Assigntment 4</td>
					<td>Tomorrow</td>
				</tr>
				<tr>
					<td>Assigntment 5</td>
					<td>May 12</td>
				</tr>
				<tr>
					<td>Assigntment 6</td>
					<td>May 16</td>
				</tr>
				<tr>
					<th>Materials</th>
					<th>Upload Date</th>
				</tr>
				<tr>
					<td>Syllabus</td>
					<td>2/10</td>
				</tr>
				<tr>
					<td>Design Principles Ch. 1</td>
					<td>3/23</td>
				</tr>
				<tr>
					<td>Java Swing Example</td>
					<td>3/25</td>
				</tr>
			</table>
			<div class="panel-footer" id="go2">Show More...</div>
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
        	<g:each in="${list}" var="assignment">
        		<tr>
            		<td>${assignment.name}</td>
        		</tr>
        	</g:each>
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