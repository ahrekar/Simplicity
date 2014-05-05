$( document ).ready(function() {
console.log( "ready!" );
alert("working");
});
$( "#go1" ).click(function() {
	$( "#block1" )
	.animate({
	width: "90%"
}, {
queue: false,
duration: 3000
})
.animate({ fontSize: "24px" }, 1500 )
.animate({ borderRightWidth: "15px" }, 1500 );
});