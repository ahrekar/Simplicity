package simplicity

import org.springframework.web.servlet.ModelAndView
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	static scaffold = true
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Class.list(params), model:[classInstanceCount: Class.count()]
    }

	def overview(Class classInstance) {
		
		[course:classInstance, tab:params.tab]
		
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
		def grade = assignment.calcGrade()*100
		def gradeString = String.format("%1\$3.1f",grade)
		render "<h2>${name} (${gradeString}%)</h2>" + '<br>' + "<p>${description}</p>"
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

    def show(Class classInstance) {
        respond classInstance
    }

    def create() {
        respond new Class(params)
    }

    @Transactional
    def save(Class classInstance) {
        if (classInstance == null) {
            notFound()
            return
        }

        if (classInstance.hasErrors()) {
            respond classInstance.errors, view:'create'
            return
        }

        classInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classInstance.label', default: 'Class'), classInstance.id])
                redirect classInstance
            }
            '*' { respond classInstance, [status: CREATED] }
        }
    }

    def edit(Class classInstance) {
        respond classInstance
    }

    @Transactional
    def update(Class classInstance) {
        if (classInstance == null) {
            notFound()
            return
        }

        if (classInstance.hasErrors()) {
            respond classInstance.errors, view:'edit'
            return
        }

        classInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Class.label', default: 'Class'), classInstance.id])
                redirect classInstance
            }
            '*'{ respond classInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Class classInstance) {

        if (classInstance == null) {
            notFound()
            return
        }

        classInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Class.label', default: 'Class'), classInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classInstance.label', default: 'Class'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
