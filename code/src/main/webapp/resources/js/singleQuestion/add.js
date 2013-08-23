
$(function(){
	$("#options").load(contextPath+"singleQuestion/choice");
	$("#modalContent").load(contextPath+"knowledgePoint");
	});

//切换题型的选项
function switchQuestion(obj){
	var type=obj.val();
	if(type=="rightOrWrong"){
		$("#options").load(contextPath+"singleQuestion/rightOrWrong");
	}
	if(type=="choice"){
		index=3; //添加选项在切换再切回时，避免index显示错误
		$("#options").load(contextPath+"singleQuestion/choice");
	}
}

//添加选择题选项
var index=3;
function addOptions(){
	$("#options").append("选项"+index+"：<input name='options' />&nbsp;&nbsp;<input name='rightAnswer' value='"+index+"' type='checkbox'/><br /> ");
	index++;
}

//添加知识点
function addPoints(){
	 $("#allKnowledgePoints").find("option:selected").each(function(){
		$("#knowledgePoints").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>");
		$(this).remove();
	 });
}

//移除知识点
function removePoints(){
	$("#knowledgePoints").find("option:selected").each(function(){
		$("#allKnowledgePoints").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>");
		$(this).remove();
	 });
}

function onSubmit(){
	
	$("#knowledgePoints").find("option").each(function(){
		$(this).attr("selected","selected");
	 });
	
	var rightAnswer=0;
	var type="";
	$("input[name='rightAnswer']").each(function () {  
		type=$(this).attr("type");
        if($(this).attr("checked")=="checked"){
        	$(this).prev("input[name='multipleSelected']")
        	rightAnswer++;
        }  
    });
	if(rightAnswer==0 && (type=="checkbox" || type=="radio")){alert("请勾选正确答案");}
	else{
	if(rightAnswer==1 && type=="checkbox"){$("#type").attr("value","SINGLE_CHOICE");}
	if(rightAnswer==1 && type=="radio"){$("#type").attr("value","RIGHT_OR_WRONG");}
	if(rightAnswer>1 && type=="checkbox"){$("#type").attr("value","MULTIPLE_CHOICE");}
	if(rightAnswer==0){$("#type").attr("value","COMBINATION_QUESTION");}
	document.choiceForm.submit();
	}
}
