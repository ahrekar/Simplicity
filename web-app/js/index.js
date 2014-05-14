$(document).ready(function(){
	var expanded = [false, false, false];
	
	$(".tabs .tab-links a").on("click", function(e){
		var currentAttrValue = $(this).attr("href");
		$(".tabs " + currentAttrValue).show().siblings().hide(); 
		$(this).parent("li").addClass("active").siblings().removeClass("active"); 
		e.preventDefault();
		});
	
	$( "#go1" ).click(function() {
			buttFunc(1);
	});
	$( "#go2" ).click(function() {
		buttFunc(2);
	});
	$("#close").click(function() {
		$("#overlay").slideToggle("fast")
		});
	  function buttFunc(index)
		{
			if(expanded[index] == false)
			{
			$( "#block" + index )
				.animate({ width: "100%" }, { queue: false, duration: 1000 })
				expanded[index] = true;
			$( "#go" + index ).text("Show Less..")
			}
		else
			{
			$( "#block" + index )
				.animate({ width: "49%" }, { queue: false, duration: 1000 })
				expanded[index] = false;	
			$( "#go" + index ).text("Show More..")
			}
		}
});
function showDescription(name, description){
	  $("#overlay").slideToggle("fast");
	  $("#top").text(name);
	  $("#bottom").text(description);
	  }