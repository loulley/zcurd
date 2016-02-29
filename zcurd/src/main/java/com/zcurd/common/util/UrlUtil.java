package com.zcurd.common.util;

public class UrlUtil {

	/**
	 * 获得url的基础地址（到action部分，用于权限管理）
	 */
	public static String formatBaseUrl(String url) {
		url = url.replaceAll("//+", "/").replaceAll("/$", "");
		if(url.split("/").length >= 2) {
			url = url.replaceAll("/\\w*$", "");
		}
		return url;
	}
	
	public static String formatUrl(String url) {
		url = url.replaceAll("//+", "/").replaceAll("/$", "");
		return url;
	}
}
