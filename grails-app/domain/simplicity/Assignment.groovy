package simplicity

import java.util.Date;

class Assignment {
	static belongsTo = [course: Class]
	String name;
	String description;
	Date dateDue
	Integer grade
	Float pointsPossible
	Float pointsEarned
	public Assignment(String name, String description, int grade, Date dateDue) {
		this.name = name;
		this.description = description;
		this.grade = calcGrade(pointsPossible, pointsEarned);
		this.dateDue = dateDue;
		this.pointsPossible = pointsPossible;
		this.pointsEarned = pointsEarned;
	}
	static mapping = {

	}
	static constraints = {
		belongsTo(blank: false)
		name(blank: false)
		description(maxSize: 4096)
		dateDue(blank: false)
		grade(nullable: true)
		pointsPossible(blank: false)
		pointsEarned(nullable: true)
    }
	private float calcGrade(float possible, float earned)
	{
		this.grade = earned/possible	
	}
}

