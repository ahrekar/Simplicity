package simplicity

class Class {
	static hasMany = [assignments : Assignment, materials : Material]
	String name
	public Class(String name) {
		this.name = name;
	}
	
    static constraints = {
    }

	@Override
	public String toString(){
		return this.name
	}
}
