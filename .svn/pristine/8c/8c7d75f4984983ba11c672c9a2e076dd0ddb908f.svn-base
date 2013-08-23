/**
 * Created with JetBrains WebStorm.
 * User: Administrator
 * Date: 13-2-17
 * Time: 上午9:32
 * To change this template use File | Settings | File Templates.
 */


$(function(){
    loadData(0,false);
});


var inputIndex=1;

//添加知识节点（渲染）
function addPoint(codes){
    var parent=$("#"+codes);
    parent.append(
        "<div class='accordion-group'>"
            +"<div class='accordion-heading'>"
            +"<a class='accordion-toggle' data-toggle='collapse'  data-parent='#knowledgeTree' href='#collapse_"+inputIndex+"'><i class='icon-plus'></i>"
            +"<span id='new_"+inputIndex+"'><span  class='input-append'><input class='span2' type='text' size='16' id='input_"+inputIndex+"'/><button class='btn' type='button' onclick=savePoint("+inputIndex+",'"+codes+"')>确定</button></span></span></a>"
            +"</div>"
            +"<div id='#collapse_"+inputIndex+"'  class='accordion-body collapse'>"
            +"<div class='accordion-inner' id='inner_"+inputIndex+"'></div>"
            +"</div>"
            +"</div>"
    );
    inputIndex++;
}

//保存知识点（数据持久化）
function savePoint(index,codes){
    var obj=$("#input_"+index);
    var show=$("#new_"+index);
    var inner=$("#inner_"+index);

    $.post(contextPath+"knowledgePoint/save",{content:obj.val(),sortCode:codes},function(data){
        if(data.indexOf("SUCCESS")>0){
            show.text(obj.val());
            loadData(codes,true);
        }else{
            show.append("<font color=red>添加失败</font>")
        }
    });
}

//加载子知识点,当bool==true时强制加载
function loadData(code,bool){
    var child=$("#child_"+code);
    var show=$("#demo_"+code);
    var isLoad=true;
    if(code!=0 && bool==false){
        switchIcon(show);
    }

    if(bool==false){
        for (var i=0;i<loadList.length;i++) {
            if(code==loadList[i]){
                isLoad=false;
            }
        }
    }

    if(isLoad){
        child.load(contextPath+"knowledgePoint/edit/child?sortCode="+code,function(data){
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
