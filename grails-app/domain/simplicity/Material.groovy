package simplicity

class Material{
	static belongsTo = [course: Class]
	String name
	String description
	Date uploadDate;
    static constraints = {
		name(blank: false)
		description(maxSize: 4096, blank:false)
    }
}
