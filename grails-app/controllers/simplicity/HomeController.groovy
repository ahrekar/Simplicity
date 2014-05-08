package simplicity

class HomeController {
    def index() {
		def classes =[]

		classes = Class.findAll()

		print(classes[0].name)
		[classes : classes]
	}
}
