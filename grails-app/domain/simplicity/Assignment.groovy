package simplicity

import java.util.Date;

class Assignment {
	static belongsTo = [course: Class]
	String name;
	String description;
	Date dateDue
	int grade
	//float pointsPossible
	//float pointsEarned
	public Assignment(String name, String description, int grade, Date dateDue) {
		this.name = name;
		this.description = description;
		this.grade = grade;
		this.dateDue = dateDue;
	}
	static mapping = {

	}
	static constraints = {
		belongsTo(blank: false)
		name(blank: false)
		description(maxSize: 4096)
		dateDue(blank: false)
		grade(blank: true)
		//pointsPossible()
		//pointsEarned()
    }
}
