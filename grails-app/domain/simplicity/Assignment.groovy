package simplicity

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

class Assignment {
	static belongsTo = [course: Class]
	String name;
	String description;
	Date dateDue;
	Float pointsPossible;
	Float pointsEarned;

public Assignment(String name, String description, Date dateDue, Float pointsPossible, Float pointsEarned) {
		this.name = name;
		this.description = description;
		this.dateDue = dateDue;
		this.pointsPossible = pointsPossible;
		this.pointsEarned = pointsEarned;
	}
	static mapping = {

	}
	static constraints = {
		name(blank: false)
		description(maxSize: 4096)
		dateDue(blank: false)
		pointsPossible(blank: false)
		pointsEarned(nullable: true)
    }
	private String calcGrade()
	{
		Float g = this.pointsEarned/this.pointsPossible*100
		String grade = String.format("%1\$.1f%%",g) 
		return grade
	}
	private String getDate()
	{
		DateFormat date = new SimpleDateFormat("MM/dd/yyyy")
		String reportDate = date.format(this.dateDue)
		return reportDate
	}
}

