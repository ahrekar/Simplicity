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
 <script src="http://ajax.gogleapis.com/ajax/libs/jquery/1.110.jquery.min.js"></script> 

<script>
$(document).ready(function(){
	var expanded = [false, false, false];
	
	$(".tabs .tab-links a").on("click", function(e){
		var currentAttrValue = $(this).attr("href");
		$(".tabs " + currentAttrValue).show().siblings().hide(); 
		$(this).parent("li").addClass("active").siblings().removeClass("active"); 
		e.preventDefault();
		});
	
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
	<div class="top">
		<h1>Simplicity</h1>
	</div>
	<div class="tabs">
		<ul class="tab-links">
			<li><a href="#Communication">Communication</a></li>
			<li><a href="#Grades">Grades</a></li>
			<li><a href="#Materials">Materials</a></li>
			<li><a href="#Assignments">Assignments</a></li>
			<li class="active"><a href="#Overview">Overview</a></li>

		</ul>
		<g:if test="${classes}">
			<div class="card-div tab-content">
			<div id="Overview" class="active tab">
				<g:each var="course" in="${classes}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${course.name}</h3>
					</div>
					<table class="table table-hover">
						<tr>
							<th>Assignments</th>
							<th class="cell-right">Due Date</th>
						</tr>
						<g:if test="${course.assignments}">
							<g:each var="assignment" in="${course.assignments}">
								<td>${assignment.name}</td>
								<td class="cell-right">${assignment.dateDue}</td>
							</g:each>
						</g:if>
						<tr >
							<th>Grades</th>
							<th class="cell-right">Grade</th>
						</tr>
						<tr>
							<th>Materials</th>
							<th class="cell-right">Upload Date</th>
						</tr>
					</table>
					<div class="panel-footer" id="go2">Show More...</div>
				</div>
				</g:each>
			</div>
			<div id="Materials" class="tab">
				<div class="panel panel-default">
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
				<table class="table table-hover">
					<tr>
						<th>Assignment</th>
						<th>Grade</th>
					</tr>
        		<g:each in="${classes}" var="classa">
        			<tr>
            			<td>${classa.name}</td>
        			</tr>
        		</g:each>
				</table>
				<div class="panel-footer" id="go1">Show More...</div>
				</div>
			</div>

				<div class="panel panel-default tab" id="Assignments">
					<div class="panel-heading">
						<h3 class="panel-title">Accounting</h3>
					</div>
					<div class="panel-body">Course Content</div>
				</div>
				
			</div>
		</g:if>
	</div>
</body>


</html>
