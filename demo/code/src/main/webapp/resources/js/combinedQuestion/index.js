

// 删除试题
function deleteQuestion(id) {
	
	if (confirm("确认删除？")){
		
		$.post(contextPath + "/combinedQuestion/" + id, {
			_method : "DELETE"
		}).success(function(){
			window.location.href=contextPath +"/combinedQuestion";
		});
		
	}
	
}