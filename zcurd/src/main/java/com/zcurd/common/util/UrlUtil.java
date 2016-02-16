package com.zcurd.common.util;

public class UrlUtil {

	public static String formatBaseUrl(String url) {
		url = url.replaceAll("//+", "/");
		if(url.split("/").length > 2) {
			url = url.replaceAll("/\\w*$", "");
		}
		return url;
	}
	
}
