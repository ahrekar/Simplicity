package simplicity

class HomeController {
    def index() {
		def classes = []
		classes = Class.findAll()
		System.out.println(classes[0].name)
		[classes = classes]
		
		}
	
}
