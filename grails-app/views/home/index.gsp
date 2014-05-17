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
	$("#close").click(function() {
		$("#overlay").slideToggle("fast")
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
function showDescription(name, description){
	  $("#overlay").slideToggle("fast");
	  $("#top").text(name);
	  $("#bottom").text(description);
	  }
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
		<div id="overlay">
			<button class="btn btn-default" id="close">Close X</button>
			<h2 id="top"></h2>
			<p id="bottom"></p>
		</div>
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
							<th colspan="2" class="cell-right">Due Date</th>
						</tr>
						<g:set var="notGradedAssignments" value="${course.getNotGraded(1)}"/>
						<g:if test="${notGradedAssignments}">
							<g:each var="assignment" in="${notGradedAssignments}">
							<tr>
								<td><a onclick="showDescription('${assignment.name}', '${assignment.description}')" href="#">${assignment.name}</a></td>
								<td colspan="2" class="cell-right">${assignment.getDate()}</td>
							</tr>
							</g:each>
						</g:if>
						<g:else>
							<tr>
								<td>--</td>
								<td colspan="2" class="cell-right">--</td>
							</tr>
						</g:else>
						<tr >
							<th>Grades</th>
							<th class="cell-center">Grade</th>
							<th class="cell-right">Due Date</th>
						</tr>
						<g:set var="gradedAssignments" value="${course.getGraded(1)}"/>
						<g:if test="${gradedAssignments}">
							<g:each var="assignment" in="${gradedAssignments}">
							<tr>
								<td><a onclick="showDescription('${assignment.name}', '${assignment.description}')" href="#">${assignment.name}</a></td>
								<td class="cell-center">${assignment.calcGrade()}</td>
								<td class="cell-right">${assignment.getDate()}</td>
							</tr>
							</g:each>
						</g:if>
						<g:else>
							<tr>
								<td>--</td>
								<td>--</td>
								<td class="cell-right">--</td>
							</tr>
						</g:else>
						<tr>
							<th>Materials</th>
							<th colspan="2" class="cell-right">Upload Date</th>
						</tr>
						<g:set var="materials" value="${course.getMaterials(1)}"/>
						<g:if test="${materials}">
							<g:each var="material" in="${materials}">
							<tr>
								<td><a onclick="showDescription('${material.name}', '${material.description}')" href="#">${material.name}</a></td>
								<td colspan="2" class="cell-right">${material.getDate()}</td>
							</tr>
							</g:each>
						</g:if>
						<g:else>
							<tr>
								<td>--</td>
								<td colspan="2" class="cell-right">--</td>
							</tr>
						</g:else>
					</table>
					<div class="panel-footer" id="go2">Show More...</div>
				</div>
				</g:each>
			</div> <%-- End Overview Tab --%>

			<div id="Materials" class="tab">
				<g:each var="course" in="${classes}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${course.name}</h3>
					</div>

					<table class="table table-hover">
						<tr>
							<th>Material</th>
							<th class="cell-right">Upload Date</th>
						</tr>
						<g:set var="numDisplay" value="${4}"/>
						<g:set var="materials" value="${course.getMaterials(numDisplay)}"/>

						<g:if test="${materials}">
							<g:each var="material" in="${materials}">
							<tr>
								<td><a onclick="showDescription('${material.name}', '${material.description}')" href="#">${material.name}</a></td>
								<td class="cell-right">${material.getDate()}</td>
							</tr>
							
							<% numDisplay-- %>
							</g:each>
						</g:if>
						<g:while test="${numDisplay > 0}">
							<tr>
								<td> -- </td>
								<td class="cell-right"> -- </td>
							</tr>
							<% numDisplay-- %>
						</g:while>
					</table>
					<div class="panel-footer" id="go1">Show More...</div>
				</div>
				</g:each>
			</div> <%-- End Materials tab --%>

			<div id="Assignments" class="tab">
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
						<g:set var="numDisplay" value="${4}"/>
						<g:set var="notGradedAssignments" value="${course.getNotGraded(numDisplay)}"/>
						<g:if test="${notGradedAssignments}">
							<g:each var="assignment" in="${notGradedAssignments}">
							<tr>
								<td><a onclick="showDescription('${assignment.name}', '${assignment.description}')" href="#">${assignment.name}</a></td>
								<td class="cell-right">${assignment.getDate()}</td>
							</tr>
							<% numDisplay-- %>
							</g:each>
						</g:if>
						<g:while test="${numDisplay > 0}">
							<tr>
								<td> -- </td>
								<td class="cell-right"> -- </td>
							</tr>
							<% numDisplay-- %>
						</g:while>
					</table>
					<div class="panel-footer" id="go2">Show More...</div>
				</div>
				</g:each>
			</div> <%-- End assignments tab --%>

			<div id="Grades" class="tab">
				<g:each var="course" in="${classes}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${course.name}</h3>
					</div>
					<table class="table table-hover">
						<tr>
							<th>Grades</th>
							<th class="cell-center">Grade</th>
							<th class="cell-right">Date</th>
						</tr>
						<g:set var="numDisplay" value="${4}"/>
						<g:set var="gradedAssignments" value="${course.getGraded(numDisplay)}"/>
						<g:if test="${gradedAssignments}">
							<g:each var="assignment" in="${gradedAssignments}">
							<tr>
								<td><a onclick="showDescription('${assignment.name}', '${assignment.description}')" href="#">${assignment.name}</a></td>
								<td class="cell-center">${assignment.calcGrade()}</td>
								<td class="cell-right">${assignment.getDate()}</td>
							</tr>

							<% numDisplay-- %>
							</g:each>
						</g:if>
						<g:while test="${numDisplay > 0}">
							<tr>
								<td> --</td>
								<td class="cell-center">--</td>
								<td class="cell-right">--</td>
							</tr>
							<% numDisplay-- %>
						</g:while>
					</table>
					<div class="panel-footer" id="go2">Show More...</div>
				</div>
				</g:each>
			</div> <%-- End Grades tab --%>
				
			</div>
		</g:if>
	</div>

</body>


</html>
