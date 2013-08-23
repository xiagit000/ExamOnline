
// 删除试题
function deleteExam(id) {
	
	if (confirm("确认删除？")){
		
		$.post(contextPath + "/exam/" + id, {
			_method : "DELETE"
		}).success(function(){
			window.location.href=contextPath +"/exam";
		});
		
	}
	
}