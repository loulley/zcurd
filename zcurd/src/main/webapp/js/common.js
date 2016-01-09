

$(function() {
	//去掉加载页面时，遮挡的div
	$("#loadFloat").remove();
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



