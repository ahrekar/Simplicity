<%@ page import="simplicity.Class" %>



<div class="fieldcontain ${hasErrors(bean: classInstance, field: 'assignments', 'error')} ">
	<label for="assignments">
		<g:message code="class.assignments.label" default="Assignments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classInstance?.assignments?}" var="a">
    <li><g:link controller="assignment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="assignment" action="create" params="['class.id': classInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'assignment.label', default: 'Assignment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: classInstance, field: 'materials', 'error')} ">
	<label for="materials">
		<g:message code="class.materials.label" default="Materials" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classInstance?.materials?}" var="m">
    <li><g:link controller="material" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="material" action="create" params="['class.id': classInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'material.label', default: 'Material')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: classInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="class.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${classInstance?.name}"/>

</div>

