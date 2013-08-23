$(function(){
	$("#loadSimilar").load(contextPath+"/combinedQuestion/"+id+"/similar",function(data){
		if(data.indexOf("div")==-1){
			$("#similar").html("<center class='alert alert-warn'><b>对不起，没有相同题型的题目</b></center>");
		}
	});
});

function toggleRecord(){
	$("#showRecord").slideToggle();
}

function loadSimilar(id){
	$("#loadSimilar").load(contextPath+"/combinedQuestion/"+id+"/similar");
}