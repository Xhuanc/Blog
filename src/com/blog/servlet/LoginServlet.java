package com.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.bean.Msg;
import com.blog.entity.User;
import com.blog.service.UserService;
import com.blog.util.MD5Util;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String LOGIN_USER_SECCESS = "用户登录成功";
//    static final String LOGIN_ADMIN_SECCESS="管理员登录成功";
	static final String PASSWORD_WRONG="密码错误";
    static final String USERNAME_INEXISTENCE="该用户不存在";
	/**
	 * 留在当前的登录界面
	 */
	private final String LOGIN_VIEW="/jsp/login.jsp";
	/**
	 *
	 * 跳到个人主页的页面
	 */
	private final String SUCCESS_VIEW = "/jsp/my_page.jsp";
	/**
	 * 调用service层的方法
	 */
	UserService us = new UserService();
	User user = new User();
	Msg msg = new Msg();

	
	/**
	 * 相当于controller层的作用，负责调用service层的方法，并对返回的结果进行处理
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

        // 获取用户信息
        String name = request.getParameter("uname");
		 String pwd1 = request.getParameter("upwd");
		
		        if (name == null||name.equals("")) 
		        {
		            // 设置错误提示
		            request.setAttribute("errorMsg", "用户名为空!");
		           // 转发到登录页面
		            request.getRequestDispatcher(LOGIN_VIEW).forward(request, response);
		            return;
		        }
		     
		        //pwd用md5加密
				  String pwd = MD5Util.MD5Encode(pwd1,"utf8");
        
        // 获取请求参数
      	//比一下页面传过来的验证码
        String imageText = request.getParameter("image");
        // 图片的验证码
        String text = (String) request.getSession().getAttribute("text");

        if ( !(text.equalsIgnoreCase(imageText)) ) {
            request.setAttribute("errorMsg", "identifying code error!");//TODO:编码有问题
            request.getRequestDispatcher(LOGIN_VIEW).forward(request, response);
      	    return;
        }
			     //访问数据库，将返回结果传送给msg 装信息的对象 
				msg =us.login(name, pwd);
					  
					   //对不同的结果进行分析，并进行相对应的页面跳转处理
					  if(LOGIN_USER_SECCESS.equals(msg.getResult()))
				        { 
						  
								//只有登录成功才会出现在session中
							  request.getSession().setAttribute("uname", name);
							  request.getSession().setAttribute("upwd", pwd);
							  
							  //设置查询出用户的所有信息userinfo，交给---session
							  User userInfo = new User();
							  userInfo = us.UserInfo(name);
							  request.getSession().setAttribute("userInfo", userInfo);
							  
							  
							  
					            //记住密码---放在cookie中
					            if(request.getParameter("remember")!=null) 
						            {
						            	//密码未为加密前的
						            	
						            		Cookie cookie1 = new Cookie("upwd",pwd1);
						            		//七天的时长
						            		cookie1.setMaxAge(7*60*60*24);
						            		//放在响应中
											response.addCookie(cookie1);
						            }  
					            else if(request.getParameter("remember")==null)
					            	{
						            	Cookie cookie1 = new Cookie("upwd","");
					            		cookie1.setMaxAge(7*60*60*24);
					            		//放在响应中
					            		  response.addCookie(cookie1);
					            
						            }
							            //选择自动登录
							            if(request.getParameter("auto")!=null) 
								            {
								            	    //密码未为加密前的
								            		Cookie cookie2 = new Cookie("auto","auto");
								            		cookie2.setMaxAge(7*60*60*24);
								            		//放在响应中
								            		  response.addCookie(cookie2);
								            }  
												   // 使用cookie实现回写用户名
										            Cookie cookie = new Cookie("uname", name);
										            //设置cookie七天失效
										            cookie.setMaxAge(7*60*60*24);
										            
										            // 通过响应头发送cookie
										            response.addCookie(cookie);
					
										            
										            //转到my_page下
										            response.sendRedirect(request.getContextPath() +SUCCESS_VIEW);
										            return;
						  
					    					}
					  							//TODO:没有管理员现在
//												    else if(LOGIN_ADMIN_SECCESS.equals(msg.getResult()))
//														        {
//															    	 //转发到success页面 //管理员的界面跳转
//																	  request.getRequestDispatcher(SUCCESS_VIEW).forward(request, response);
//																	  return;
//																 }
														  	else if(PASSWORD_WRONG.equals(msg.getResult()))
																	{
//																		   request.setAttribute("errorMsg", "pwderror");
																		   request.setAttribute("errorMsg", "password error!");
																           request.getRequestDispatcher(LOGIN_VIEW).forward(request, response);
																           return;
																	}
												  					//用户名不存在
																  	else if(USERNAME_INEXISTENCE.equals(msg.getResult()))
																		  	{
																				   request.setAttribute("errorMsg", "username no exist");
																		           request.getRequestDispatcher(LOGIN_VIEW).forward(request, response);
																		           return;
																		  	}	
																		   request.setAttribute("errorMsg", "login again please!");
																		   request.getRequestDispatcher(LOGIN_VIEW).forward(request, response);
																           return;
	}
	

}
