package simplicity

import java.util.Date;

class Assignment {
	String name;
	String description;
	Date dateDue
	int grade
	public Assignment(String name, String description, int grade, Date dateDue) {
		this.name = name;
		this.description = description;
		this.grade = grade;
		this.dateDue = dateDue;
	}
	static constraints = {
    }
}
