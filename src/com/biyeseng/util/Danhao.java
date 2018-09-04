package com.biyeseng.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 物流单号生成器
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class Danhao {
	/**
	 * 获取单号
	 * @return 单号
	 */
	public static String getHao() {
		String key="";
		Date d = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		key = "BH"+formatter.format(d);
		return key;
	}


}
