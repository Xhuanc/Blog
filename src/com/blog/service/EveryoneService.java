package com.blog.service;

import java.util.List;

import com.blog.dao.FriendDao;
import com.blog.daoImpl.FriendDaoImpl;
import com.blog.entity.User;


public class EveryoneService
{
	private FriendDao friendDao = new FriendDaoImpl();

			/**
			 * @Description 查询数据的总条数
			 * @return 总条数
			 */
			public int getTotalCount() {
				return friendDao.getTotalCount();
				}
			/**
			 * @Description  分页查询所有用户
			 * @param currentPage 当前页面 
			 * @param pageSize 页面大小
			 * @return 数据集合
			 */
		public List<User> queryEveryoneByPage( int currentPage ,int pageSize){
			return friendDao.queryEveryoneByPage(currentPage, pageSize);
		}
		
		
		/**
		 * @Description 查询符合条件数据的总条数
		 * @param searchContent 搜索框输入的内容
		 * @return  符合条件数据的总条数
		 */
		public int getSearchCount(String searchContent) {
			return friendDao.getSearchCount(searchContent);
		
		}
		/**
		 * @Description  模糊-分页查询所有用户
		 * @param currentPage 当前页
		 * @param pageSize 页面大小
		 * @param searchContent 搜索内容
		 * @return  数据集合
		 */
		public List<User> queryEveryoneByPage( int currentPage ,int pageSize,String searchContent){
			return friendDao.queryEveryoneByPage(currentPage, pageSize,searchContent);
		}
		
		
		/**
		 * @Description 我的关注--查询数据的总条数
		 * @param userId 当前用户的id值--数据库中
		 * @param status 查询条件 1--关注 2--好友
		 * @return 总条数
		 */
		
		public int getFriendTotalCount(int userId,int status) {
			return friendDao.getFriendTotalCount(userId, status);
		
		}
		/**
		 * @Description 我的关注和好友---分页查询所有用户
		 * @param userId
		 * @param currentPage 当前页面 
		 * @param pageSize 页面大小
		 * @return 数据集合
		 */
		
		public List<User> queryFriendByPage(int userId,int status,int currentPage ,int pageSize){
		return friendDao.queryFriendByPage(userId, status, currentPage, pageSize);
		}

		
		/**
		 * @Description 我的关注和好友--查询数据的总条数
		 * @param userId 当前用户的id值--数据库中
		 * @param status 查询条件 1--关注 2--好友
		 * @return 总条数
		 */
		
		public int getFriendSearchCount(String searchContent, int userId, int status) {
			return friendDao.getFriendSearchCount(searchContent,userId, status);
		
		}
		/**
		 * @Description 我的关注---分页查询所有用户
		 * 
		 * @param userId
		 * @param currentPage 当前页面 
		 * @param pageSize 页面大小
		 * @return 数据集合
		 */
		
		public List<User> queryFriendByPage(String searchContent,int userId,int status,int currentPage ,int pageSize){
		return friendDao.queryFriendByPage(searchContent,userId, status, currentPage, pageSize);
		}
		
		
		/**
		 * @Description 我的关注和好友--查询数据的总条数
		 * @param userId 当前用户的id值--数据库中
		 * @param status 查询条件 1--关注 2--好友 3-黑名单
		 * @return 总条数
		 */
		public int getFriendGroupCount(String searchContent, int userId, int status) {
			return friendDao.getFriendGroupCount(searchContent,userId, status);
		
		}
		/**
		 * @Description 我的关注---分页查询所有用户
		 * @param userId 当前用户的id
		 * @param currentPage 当前页面 
		 * @param pageSize 页面大小
		 * @return 数据集合
		 */
		public List<User> queryFriendGroupByPage(String searchContent,int userId,int status,int currentPage ,int pageSize){
		return friendDao.queryFriendGroupByPage(searchContent,userId, status, currentPage, pageSize);
		}
		
}
