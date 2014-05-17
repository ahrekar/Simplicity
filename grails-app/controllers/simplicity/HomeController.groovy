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
        render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p>"
	}
}
