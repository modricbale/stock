package com.stock.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;

public class CommonUtils {
public static String getUUID(){
	return UUID.randomUUID().toString().replace("-", "").substring(0, 16);
}
/*
 *   @author  sandaoliu
 *   @date     2016/2/20 
 *   @parameter  message 需要加密混淆的信息
 *   @return 	加密混淆后的信息
 */
public static String MD5(String message){
	try {
		MessageDigest md = MessageDigest.getInstance("md5");
		byte md5[] = md.digest(message.getBytes());// 二进制
		return DigestUtils.md5Hex(md5);
	} catch (NoSuchAlgorithmException e) {
		throw new RuntimeException(e);
	}
}

}
