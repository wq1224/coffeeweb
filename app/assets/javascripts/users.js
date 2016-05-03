function apply(){
	alert("aaaa");
	$.post("apply",$('#apply_form').serialize(),function(result){
	    console.log(result);
	});
}