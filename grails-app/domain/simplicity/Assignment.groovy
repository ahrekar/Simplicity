package simplicity

import java.util.Date;

class Assignment {
	static belongsTo = [course : Class]
	String name;
	String description;
	Date dateDue
	Float grade
	Float pointsPossible
	Float pointsEarned
	public Assignment(String name, String description, Integer grade, Date dateDue, Float pointsPossible, Float pointsEarned) {
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
	private Float calcGrade(float possible, float earned)
	{
		Float grade = earned/possible
		return grade
	}
}

