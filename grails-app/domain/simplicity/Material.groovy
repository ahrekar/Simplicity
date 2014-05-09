package simplicity

import java.text.DateFormat
import java.text.SimpleDateFormat

class Material{
	static belongsTo = [course: Class]
	String name
	String description
	Date uploadDate;
    static constraints = {
		name(blank: false)
		description(maxSize: 4096, blank:false)
    }
	private String getDate()
	{
		DateFormat date = new SimpleDateFormat("MM/dd/yyyy")
		String reportDate = date.format(this.uploadDate)
		return reportDate
	}
}
