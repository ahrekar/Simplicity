package simplicity

class Class {

	static hasMany = [assignments : Assignment, materials : Material]
	String name

	public Class(String name) {
		this.name = name;
	}

	static mapping = {
		assignments sort: 'dateDue', order: 'asc'
		materials sort: 'uploadDate', order: 'desc'
	}

	def getNotGraded(){
		int num = Assignment.countByCourseAndPointsEarnedIsNull(this)
		return getNotGraded(num)
	}

	/** Num represents the number of items the user 
	 	wants returned. **/
	def getNotGraded(int num){
		def notGraded = Assignment.findAllByCourseAndPointsEarnedIsNull(this,[sort:"dateDue",order:"asc"])
		/* If the number of assignments is less than the index
		   requested, just return the number of assignments. */
		int indxNum = (notGraded.size() < num) ? notGraded.size() - 1 : num - 1
		if (notGraded)
			return notGraded[0..indxNum]
		else
			return notGraded
	}

	def getGraded(){
		int num = Assignment.countByCourseAndPointsEarnedIsNotNull(this)
		return getGraded(num)
	}

	def getGraded(int num){
		def graded = Assignment.findAllByCourseAndPointsEarnedIsNotNull(this,[sort:"dateDue", order:"desc"])
		int indxNum = (graded.size() < num) ? graded.size() - 1 : num - 1
		if (graded)
			return graded[0..indxNum]
		else
			return graded
	}

/*
	def getMaterials(){
		int num = materials.size()
		return getMaterials(num)
	}
	*/

	/** Num represents the number of items the user 
	 	wants returned. **/
	def getMaterials(int num){
		/* If the number of assignments is less than the index
		   requested, just return the number of Materials. */
		def mat = Material.findAllByCourse(this,[sort:"uploadDate", order:"desc"])
		int indxNum = (mat.size() < num) ? mat.size() - 1 : num - 1
		if (mat)
			return mat[0..indxNum]
		else
			return mat
	}

    static constraints = {
    }

	@Override
	public String toString(){
		return this.name
	}
}
