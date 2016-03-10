if(!top.window.subPage) {
	top.window.subPage = {};
}

$(function() {
	//去掉加载页面时，遮挡的div
	$("body").css("visibility", "visible");
	
	//回车刷新
	if(!location.href.endsWith("login") && !location.href.endsWith("main")) {
		document.onkeydown = function() {
			if(event.keyCode==13) {
				if(window.zcurdSearch) {
					zcurdSearch();
				}
				return false;                               
			}
		}
	}
});

function log(obj) {
	if(console) {
		console.log(obj);
	}
}

/**
 * 显示消息
 */
function showMsg(msg) {
	top.window.$.messager.show({
        title: '消息',
        msg:'<div style="padding-top: 10px;">' + msg||"消息内容！" + '</div>',
        timeout: 3000,
        showType: 'slide'
    });
}

/**
 * 显示警告消息
 */
function showWarnMsg(msg) {
	top.window.$.messager.show({
        title: '错误消息',
        msg: '<div class="messager-icon messager-warning"></div><div style="padding-top: 10px;">' + (msg || "消息内容！") + "</div>",
        timeout: 3000,
        showType: 'slide'
    });
}

/**
 * 确认消息
 */
function confirmMsg(msg, successFunc){
	top.window.$.messager.confirm('请确认', '<div style="padding-top: 10px;">' + (msg || 'Are you confirm this?') + "</div>", function(r){
		if(r) {
			if($.isFunction(successFunc)) {
				successFunc();
			}
		}
    });
}

/**
 * 打开弹出窗
 * @param title		标题
 * @param url		iframe地址
 * @param options	可选参数
 */
function openWindow(title, url, options) {
	options = options || {};
	if(options.size && options.size.indexOf("x") >= 0) {
		options.width = options.size.split("x")[0];
		options.height = options.size.split("x")[1];
	}
	$("#dialogWindow iframe").attr("src", url);
    $("#dialogWindow").window({
    	closed:false,
    	modal:true,
    	iconCls:'icon-save',
    	title: title || '增加',
    	width: options.width || 700,
    	height: options.height || 450
    });
    $("#dialogWindow").window("center");
}

/**
 * 关闭弹出窗口
 */
function closeWindow() {
    $("#dialogWindow").window("close");
}

/**
 * 刷新页面
 */
function flushPage() {
	location.replace(location);
}

/**
 * 根据对象属性从集合中获得对象
 * @param list
 * @param attrName
 * @param attrValue
 * @returns	匹配到的第一个对象
 */
function getObjFromList(list, attrName, attrValue) {
	if($.isArray(list)) {
		for (var i = 0; i < list.length; i++) {
			var item = list[i];
			if(item[attrName] == attrValue) {
				return item;
			}
		}
	}
	return null;
}

function getInputValue(inputName) {
	var result = "";
	$(":input[name='" + inputName + "']").each(function(i, item) {
		result += "," + $(item).val();
	});
	return result.replace(",", "");
}

/**
 * 使combobox变为多选
 * @param inputIds 单个id或者数组
 */
function changeComboboxToMult(inputIds) {
	if(!$.isArray(inputIds)) {
		inputIds = [inputIds];
	}
	$.each(inputIds, function(i, item) {
		var iptObj = $("#" + inputIds);
		var data = iptObj. combobox("getData").splice(0, 1);
		iptObj. combobox({multiple:true});
	});
}


//扩展easyui-datagrid的edit模式
$.extend($.fn.datagrid.defaults.editors, {
	//支持checkbox
    checkbox: {
        init: function(container, options){
        	var align = "center";
        	if(options && options.align) {
        		align = options.align;
        	}
        	container.attr("align", align);
            var input = $('<input type="checkbox" class="datagrid-editable-checkbox">').appendTo(container);
            return input;
        },
        destroy: function(target){
            $(target).remove();
        },
        getValue: function(target){
            return $(target).is(":checked") ? 1 : 0;
        },
        setValue: function(target, value){
        	if(value == 1) {
        		$(target).click();
        	}
        },
        resize: function(target, width){
            //$(target)._outerWidth(width);
        }
    }
});

//全局ajax事件处理
$(window).ajaxError(function(handler){
	showWarnMsg("操作失败，服务器出现错误！");
});

//删除页面没有权限的按钮
$(function() {
	if(noAuthBtn) {
		$.each(noAuthBtn.split(","), function(i, item) {
			$("." + item).remove();
		});
	}
});

//处理页面没有【数据权限】的按钮
$(function() {
	if(authField) {
		$.each(authField.split(","), function(i, item) {
			$("#" + item + ",#_start_" + item + ",#_end_" + item).textbox({disabled:true});
			
		});
	}
});