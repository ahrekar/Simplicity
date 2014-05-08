package simplicity

class HomeController {

    def index() {
		def classes =[]

		classes = Class.findAll()

		[classes = classes]
	}
}
