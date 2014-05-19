<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'class.css')}"
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
 <r:require module="jquery"/>
     <g:javascript library="jquery" />

<script>
$(document).ready(function(){
	var expanded = [false, false, false];
	
	$(".tabs .tab-links a").on("click", function(e){
		var currentAttrValue = $(this).attr("href");
		$(".tabs " + currentAttrValue).show().siblings().hide(); 
		$(this).parent("li").addClass("active").siblings().removeClass("active"); 
		e.preventDefault();
		});
	$("#close").click(function() {
		$("#overlay").slideToggle("fast")
		});
	$(".clickme").click(function() {
		$("#overlay").slideToggle("fast")
		});
});
	function showDescription(){
		  $("#overlay").slideToggle("fast");
			alert("File successfully uploaded!")
		  }
</script>
<r:layoutResources/>
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
			<div id="content">
			</div>
			<g:uploadForm name="myUpload">
   				 <input type="file" name="myFile" />
			</g:uploadForm>
		</div>
		
		<g:if test="${course}">
			<div class="card-div tab-content">

			<div id="Overview" class="active tab">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${course.name} (<g:formatNumber number="${course.calcGrade()}" format="#0.0%"/>) </h3>
					</div>
					<table class="table table-hover">
						<tr>
							<th>Assignments</th>
							<th colspan="2" class="cell-right">Due Date</th>
						</tr>
						<g:set var="notGradedAssignments" value="${course.getNotGraded(3)}"/>
						<g:if test="${notGradedAssignments}">
							<g:each var="assignment" in="${notGradedAssignments}">
							<tr>
								<td><g:remoteLink action="setCurrAssignment" params="${[id:assignment.id]}" update="content">
								<span  class="clickme">${assignment.name}</span></g:remoteLink></td>
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
						<g:set var="gradedAssignments" value="${course.getGraded(3)}"/>
						<g:if test="${gradedAssignments}">
							<g:each var="assignment" in="${gradedAssignments}">
							<tr>
								<td><g:remoteLink action="setCurrGradedAssignment" params="${[id:assignment.id]}" update="content">
								<span class="clickme">${assignment.name}</span></g:remoteLink></td>
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
						<g:set var="materials" value="${course.getMaterials(3)}"/>
						<g:if test="${materials}">
							<g:each var="material" in="${materials}">
							<tr>
								<td><g:remoteLink action="setCurrMaterial" params="${[id:material.id]}" update="content">
								<span  class="clickme">${material.name}</span></g:remoteLink></td>
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
			</div> <%-- End Overview Tab --%>

			<div id="Materials" class="tab">
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
						<g:set var="materials" value="${course.getMaterials()}"/>

						<g:if test="${materials}">
							<g:each var="material" in="${materials}">
							<tr>
								<td><g:remoteLink action="setCurrAssignment" params="${[name:material.name, description:material.description]}" update="content">
								<span  class="clickme">${material.name}</span></g:remoteLink></td>	
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
			</div> <%-- End Materials tab --%>

			<div id="Assignments" class="tab">
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
								<td><g:remoteLink action="setCurrAssignment" params="${[name:assignment.name, description:assignment.description]}" update="content">
								<span  class="clickme">${assignment.name}</span></g:remoteLink></td>								
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
			</div> <%-- End assignments tab --%>

			<div id="Grades" class="tab">
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
								<td><g:remoteLink action="setCurrGradedAssignment" params="${[name:assignment.name, description:assignment.description]}" update="content">
								<span  class="clickme">${assignment.name}</span></g:remoteLink></td>
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
			</div> <%-- End Grades tab --%>
				
			</div>
		</g:if>
	</div>

</body>


</html>
