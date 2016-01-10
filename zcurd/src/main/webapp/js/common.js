if(!top.window.subPage) {
	top.window.subPage = {};
}


$(function() {
	//去掉加载页面时，遮挡的div
	$("#loadFloat").remove();
	$("body").css("visibility", "visible");
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
        title: '警告',
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
    $("#dialogWindow iframe").attr("src", "#");
}


