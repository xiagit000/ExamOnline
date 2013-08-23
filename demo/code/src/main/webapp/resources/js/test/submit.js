$(function(){
	countDowm();
});

var times=totalTime*60;
function countDowm(){
	$("#showTime").html("距离考试结束还有：<font color='red'>"+parseInt(times/60)+"分"+times%60+"秒</font>");
	if(times==30){
		hideTime();
	}
	if(times!=0){
	setTimeout("countDowm()", 1000);   
	}else{
		$("#subTest").attr("onclick","");
		$("#subTest").attr("class","btn btn-primary disabled");
	}
	times--;
}

function hideTime(){
	if(times%2==0){
	$("#showTime").fadeOut();
	}else{
		$("#showTime").fadeIn();
	}
	setTimeout("hideTime()", 500);   
}

function onSubmit(){
	var val="";
	var id="";
	$(":input").each(function () {
		if(id!=$(this).attr("id")){
			id=$(this).attr("id");
			val="";
		}
		if($(this).attr("type")=="checkbox" || $(this).attr("type")=="radio" ){
		var answer=$("#selected_"+$(this).attr("id"));
		if(answer.val()==""){
			 val="";
		}
        if($(this).attr("checked")=="checked"){
        	val+=$(this).val()+";";
        	answer.attr("value",val);
        }  
		}
    });

   document.answerForm.submit();
}