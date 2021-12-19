package com.blog.util;

public class ValidateUtil {
	/**
	 * @Description 类方法 判空处理 验证用户名
	 * @param userName
	 * @return
	 */
	public static boolean isInvalidUserName(String userName){
		if(userName == null || userName.equals("")){
			System.out.println("isInvalidUserName");
			return true;
		}
		return false;
	}
/**
 * @Description 判断密码是否为空 
 * @param password
 * @return 布尔值
 */
	public static boolean isInvalidPassword(String password){
		if(password == null || password.equals("")){
			return true;
		}
		return false;
	}
}
