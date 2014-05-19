package simplicity
import grails.converters.JSON

class HomeController {
	String currAssignment
    def index() {

		def classes =[]

		classes = Class.findAll()

		[classes : classes]
	}
	def findInfo(String assignmentName, Class className) {
		def classes =[]
		classes = Class.findAll()
		
	}
	def setCurrAssignment() 
	{ 
		def id = params.id.toInteger()
		def assignment = Assignment.get(id)
		[assignment:assignment]
		def name = assignment.name
		def description = assignment.description
        render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p><br><g:uploadForm name='myUpload'><input type='file' name='myFile' /><br><input class='btn btn-primary' onClick='showDescription()' type='submit' value='Upload' /></g:uploadForm>"
	}
	def setCurrGradedAssignment()
	{
		def id = params.id.toInteger()
		def assignment = Assignment.get(id)
		[assignment:assignment]
		def name = assignment.name
		def description = assignment.description
		def grade = assignment.calcGrade()
		render "<h2>${name}(${grade})</h2>" + '<br>' + "<p>${description}</p>"
	}
	def setCurrMaterial() 
	{ 
		def id = params.id.toInteger()
		def material = Material.get(id)
		[material:material]
		def name = material.name
		def description = material.description
        render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p>"
	}
}
