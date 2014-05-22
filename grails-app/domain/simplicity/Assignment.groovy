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
	public Float calcGrade()
	{
		Float g = this.pointsEarned/this.pointsPossible
		return g
	}
	private String getDate()
	{
		DateFormat date = new SimpleDateFormat("MM/dd/yyyy")
		String reportDate = date.format(this.dateDue)
		return reportDate
	}
	
}

