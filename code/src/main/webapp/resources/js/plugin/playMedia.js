var path;


function play(data){
	id=data;
	path=contextPath+data;
	
	if(path.indexOf("/image")!=-1){
	   	 $("#play").html("<img src='"+path+"' alt='' />");
	   }
	   if(path.indexOf("/video")!=-1){
		   alert("即将播放视频文件");
	   	$("#play").html("<video width='458' src='"+path+"' controls='controls' />");
	   }
	   if(path.indexOf("/audio")!=-1){
		   alert("即将播放音频文件");
	   	$("#play").html("<audio src='"+path+"' controls='controls' />");
	   }
}

