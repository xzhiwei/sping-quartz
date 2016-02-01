package com.ssm.demo.test.util;

public class StringUtils {

	public static boolean isNotBlank(String springId) {
		// TODO Auto-generated method stub
		if(springId == null && springId.trim().length() ==0)
			return false;
		return true;
	}

}
