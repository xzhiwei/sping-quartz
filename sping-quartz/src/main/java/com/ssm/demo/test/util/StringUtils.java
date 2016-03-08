package com.ssm.demo.test.util;

public class StringUtils {

	public static boolean isNotBlank(String springId) {
		// TODO Auto-generated method stub
		if(springId == null && springId.trim().length() ==0)
			return false;
		return true;
	}

	public static Object trim(String string) {
		return string.trim();
	}

	public static boolean isEmpty(String bodyContent) {
		if(bodyContent == null || bodyContent == "" || bodyContent.trim().length() == 0){
			return true;
		}
		return false;
	}

}
