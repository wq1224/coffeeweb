$(document).ready(function() {
	$("input[id^=checkbox_").each(function(){
		$(this).change(function(e){
			tab_s = this.id.replace("checkbox","tab_title")
			tab = $("#"+tab_s)
			if(this.checked) {
				tab.click();
			}
		})
	})
});
function apply(){
	var data = $('#apply_form').serialize();

	$.post("apply",$('#apply_form').serialize(),function(result){
	    console.log("");
	});
}
$.fn.form2json = function () {  
    var o = {};  
    var a = this.serializeArray();  
    $.each(a, function () {  
        if (o[this.name]) {  
            if (!o[this.name].push) {  
                o[this.name] = [o[this.name]];  
            }  
            o[this.name].push(this.value || '');  
        } else {  
            o[this.name] = this.value || '';  
        }  
    });  
    return o;  
}  