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
		def name = params.name.toString()
		def description = params.description.toString()
        render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p><br><g:uploadForm name='myUpload'><input type='file' name='myFile' /><br><input class='btn btn-primary' onClick='showDescription()' type='submit' value='Upload' /></g:uploadForm>"
	}
	def setCurrGradedAssignment()
	{
		def name = params.name.toString()
		def description = params.description.toString()
		def grade = params.grade.toString()
		
		render "<h2>${name}(${grade})</h2>" + '<br>' + "<p>${description}</p>"
	}
	def setCurrMaterial()
	{
		def name = params.name.toString()
		def description = params.description.toString()
		render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p>"
	}
}
