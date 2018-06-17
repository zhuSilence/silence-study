package com.silence.study.admin.utils;

import com.origin.eurybia.utils.Prop;
import com.origin.eurybia.utils.PropertiesUtil;

public class Constant {
	//获取配置文件
	private static Prop propertiesUtils;
	
	static{
		propertiesUtils = PropertiesUtil.use();
	}
	
	/** 用户上一个URL **/
	public final static String COOKIE_URL = "prev_url";
	/** 验证码 **/
	public final static String SESSION_CAPTCHA = "sessionCaptcha";

	/** 根目录 **/
	public final static String UPLOAD_ROOT = propertiesUtils.get("upload.root");
	/** URL前缀 **/
	public final static String UPLOAD_URL = propertiesUtils.get("upload.url");
	/** 上传文件路径 **/
	public final static String UPLOAD_PATH = propertiesUtils.get("upload.path");
	/** 上传图片大小 **/
	public final static String UPLOAD_PIC_SIZE = propertiesUtils.get("upload.pic.size");

	/** 媒体素材库服务器URL **/
	public final static String MEDIA_SERVER = propertiesUtils.get("media.server");
}
