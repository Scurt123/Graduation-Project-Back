package com.jan.crowd.funding.util;

import java.util.HashMap;
import java.util.Map;

//辅助功能：声明常量
public class CrowdFundingConstant {

    public static final String ATTR_NAME_MESSAGE = "MESSAGE";
    public static final String ATTR_NAME_LOGIN_ADMIN = "LOGIN-ADMIN";
    public static final String ATTR_NAME_PAGE_INFO = "PAGE-INFO";

    public static final String MESSAGE_LOGIN_FAILED = "登录账号或密码不正确！请核对后再登录！";
    public static final String MESSAGE_CODE_INVALID = "明文不是有效字符串，请核对后再操作！";
    public static final String MESSAGE_ACCESS_DENIED = "请登录后再操作！";
    public static final String MESSAGE_LOGIN_ACCT_ALREADY_IN_USE = "登录账号被占用，请重新设定";

    public static final Map<String, String> EXCEPTION_MESSAGE_MAP = new HashMap<String, String>();

    static {
        EXCEPTION_MESSAGE_MAP.put("java.lang.ArithmeticException", "系统在进行数学运算时发生错误");
        EXCEPTION_MESSAGE_MAP.put("java.lang.RuntimeException", "系统在运行时发生错误");
        EXCEPTION_MESSAGE_MAP.put("org.springframework.security.access.AccessDeniedException", "不具备访问当前功能的权限");
    }

}
