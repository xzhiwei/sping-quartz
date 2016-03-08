package com.ssm.demo.test.constant;


public class Constants {
	
	public static final String TABLE_JOB = "job";
	
	public static final String STATUS_RUNNING = "1";
	public static final String STATUS_NOT_RUNNING = "0";
	public static final String CONCURRENT_IS = "1";
	public static final String CONCURRENT_NOT = "0";
	
	/** 准备就绪，待执行 **/
	public static final String JOB_STATUS_READY = "1";
	
	/**  执行中 **/
	public static final String JOB_STATUS_RUNNING = "2";
	
	/**  执行成功 **/
	public static final String JOB_STATUS_SUCCESS = "3";
	
	/** 执行失败 **/
	public static final String JOB_STATUS_FAILURE = "4";
	
	/** 普通任务 **/
	public static final String JOB_TYPE_COMMON ="00";
	
	/**  自动补跑任务 **/
	public static final String JOB_TYPE_AUTO_RETRY = "01";
	
	/** 临时任务 **/
	public static final String JOB_TYPE_TEMP = "03";
	
	/** 手动补跑任务 **/
	public static final String JOB_TYPE_MANNAL_RETRY = "04";
	
    public static final String SESSION_QRCODEID = "qrCodeId";
	
}
