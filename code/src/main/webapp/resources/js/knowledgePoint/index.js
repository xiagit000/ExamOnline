/**
 * Created with JetBrains WebStorm.
 * User: Administrator
 * Date: 13-2-17
 * Time: 上午9:32
 * To change this template use File | Settings | File Templates.
 */

//初始化数据
$(function(){
    loadData(0);
});



//加载子知识点
function loadData(code){
	
	var child=$("#child_"+code);
	var show=$("#demo_"+code);
	var isLoad=true;
	
	if(code!=0){
	switchIcon(show);
	}
	
	for (var i=0;i<loadList.length;i++) {
		if(code==loadList[i]){
			isLoad=false;
		}
	}
	if(isLoad){
	child.load(contextPath+"knowledgePoint/child?sortCode="+code,function(data){
		child.html(data);
		loadList.push(code);
	});
	}
}

//切换节点图标
function switchIcon(obj){
	if(obj.attr("class").indexOf("in")>0){
		obj.prev("div").find("i").attr("class","icon-plus");
	}else{
		obj.prev("div").find("i").attr("class","icon-minus");
		
		//获取父节点id
        var code=(obj.attr("id")).split("_");
        var childeId=code[1];
        var codes=childeId.split("-");
        var parentId="0";
        
        for(var i=1;i<codes.length;i++){
        	if((i+1)!=codes.length){
            parentId+="-"+codes[i];
        	}
        }
        
        $("a[data-parent='#"+parentId+"']").each(function(){
            if("#"+obj.attr("id")!=$(this).attr("href")){
            	$(this).find("i").attr("class","icon-plus");
            }
        });
    }
}


//根据知识点关系进行选择
var choices;
var ids;
function selectPoint(obj){
	var parent=obj.parent().parent().parent().parent();
	var child=obj.parent().next().find("input");
	var parentPoint=parent.parent().prev("div").find("input");
	
	if(obj.attr("checked")=="checked"){
	if(parent.attr("class")=="accordion-inner"){
		parentPoint.attr("checked","checked");
		selectPoint(parentPoint);
	}
	}else{
		child.attr("checked",false);
	}
	
	//遍历所选择的知识点，并显示
	choices=[];
	ids=[];
	$("input[name='pointList']").each(function(){
		if($(this).attr("checked")=="checked"){
			choices.push($(this).val());
			ids.push($(this).attr("id"));
		}
	});
	
	var showPoints="";
	for(var i=0;i<choices.length;i++){
		showPoints+="<span class='label label-info'>"+choices[i]+"</span>&nbsp;"
	}
	
	$("#choices").html(showPoints);
}

//向录题页面提交知识点
function submitPoints(){
	var showPoints="";
	var showText="";
	var pointIds="";
	for(var i=0;i<choices.length;i++){
		showPoints+="<span class='label'>"+choices[i]+"</span><input type='hidden' value='"+ids[i]+"' name='knowledges'/>&nbsp;"
		showText+="["+choices[i]+"]";
		pointIds+=ids[i]+";";
	}
	
	if($("#showPoints").attr("type")=="text"){
		$("#showPoints").val(showText);
		$("#pointIds").val(pointIds);
	}else{
	    $("#showPoints").html(showPoints);
	}
	
}
