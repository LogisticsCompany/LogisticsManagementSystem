package com.biyeseng.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 

/**
 * 数据库操作类
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class DBManager {
	//驱动名
	private String className = "com.mysql.jdbc.Driver";
	//JDBC URL
	private String url = "jdbc:mysql://101.132.70.64:3306/wlxxxt?useUnicode=true&characterEncoding=UTF-8";
 
	public Connection getConnection() {

		Connection coon = null;
		try {
			Class.forName(className);
			coon = DriverManager.getConnection(url, "root", "sv155064");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coon;
	}

 
	/**
	 * 判断账号是否已注册
	 * @param username 账号
	 * @return 是否注册
	 */
	public boolean haveUser(String username) {
		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from userinfo where name='"
							+ username + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 后台员工登录验证
	 * @param username 账号
	 * @param pwd 密码
	 * @return 是否成功
	 */
	public boolean login(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from admin where userName='"
							+ username + "' and userPw='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * 会员登录验证
	 * @param username 账号
	 * @param pwd 密码
	 * @return 是否成功
	 */
	public boolean loginUser(String username, String pwd) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon
					.prepareStatement("select * from userinfo where name='"
							+ username + "' and pwd='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
