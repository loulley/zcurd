var subPage = {};	//用于弹窗，如增删改查页面
var popup = {};		//用于弹层

$(function() {
	//去掉加载页面时，遮挡的div
	$("body").css("visibility", "visible");
	
	//回车刷新
	if(!/login$/.test(location.href) && !/main/.test(location.href) && window.datagrid && $(".pagination-num:focus").length == 0) {
		document.onkeydown = function() {
			if(event.keyCode==13) {
				if(window.zcurdSearch) {
					zcurdSearch();
				}
				return true;                               
			}
		}
	}
	
	//列表页面，如果没有搜索条件，则隐藏搜索按钮
	if($("#tb .wrap_search .search_item").size() == 0) {
		$("#tb #searchBtnWrap").hide();
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
    	title: title || '增加',
    	width: options.width || 700,
    	height: options.height || 450,
    	onClose: function() {
    		$("#dialogWindow iframe").removeAttr("src");
    		//关闭popup
    		try {
    			$("#popupWindow").window("close");
    		} catch(err) {
    			//没有弹层
    		}
    		
    	}
    });
    $("#dialogWindow").window("center");
}

/**
 * 打开一个弹层，用于选择一些信息（如城市等）
 * @param ipt	需要弹层的input或其它元素
 * @param title	弹层标题
 * @param url	页面ulr
 * @param options	其它参数（参考easyui-window）
 */
function openPopup(ipt, title, url, options) {
	ipt = $(ipt);
	popup.ipt = ipt;
	var os1 = $("#dialogWindow").offset();
	var os2 = ipt.offset();
	
	
	if(!url || popup.currUrl != url) {
		$("#popupWindow iframe").attr("src", url);
	}
	if(!options) {
		options = {};
	}
	options.title = title || "popup";
	options.top = os1.top + os2.top + ipt.outerHeight();
	options.left = os1.left + os2.left;
	options.onClose = function() {
		//回调关闭事件
		if(top.window.popup.close) {
			top.window.popup.close();
		}
	}
	//回调显示事件
	if(top.window.popup.show) {
		top.window.popup.show();
	}
    $("#popupWindow").window(options);
    popup.currUrl = url;
}

/**
 * 关闭弹层
 **/
function closePopup() {
	$("#popupWindow").window("close");
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
 * 如：当前页面为stockHistoryLog/listPage，则getCurrUrl(addPage)返回stockHistoryLog/addPage
 */
function getCurrUrl(method) {
	return window.location.pathname.replace(/\w+$/, method);
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
$(window).ajaxSuccess(function(evt, request, settings){
	var s = request.responseText;
	if(s && s.indexOf('{"result":"fail"') != -1) {
		showWarnMsg(s.substring(24, s.length - 2));
	}
});

//删除页面没有权限的按钮
$(function() {
	if(noAuthBtn) {
		$.each(noAuthBtn.split(","), function(i, item) {
			$("." + item).remove();
		});
	}
});

/**
 * 处理页面没有【数据权限】的按钮
 */
function handleAuthDataRule() {
	if(authField) {
		$.each(authField.split(","), function(i, item) {
			//$("#" + item + ",#_start_" + item + ",#_end_" + item).textbox({disabled:true});
			$("#" + item + ",#_start_" + item + ",#_end_" + item).parents(".search_item:first").remove();
		});
	}
}

//extend the 'equals' rule
$.extend($.fn.validatebox.defaults.rules, {
    equals: {
        validator: function(value,param){
            return value == $(param[0]).val();
        },
        message: '两次输入不一致.'
    }
});