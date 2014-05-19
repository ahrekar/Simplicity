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
        render "<h2>${name}</h2>" + '<br>' + "<p>${description}</p>"
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
