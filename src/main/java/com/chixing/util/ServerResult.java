package com.chixing.util;

public class ServerResult {
    private int code;
    private String msg;
    private  Object data;
    public ServerResult(){}
    public ServerResult(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static ServerResult success(int code, String msg, Object data){
        return new ServerResult(code,msg,data);
    }

    public static ServerResult fail(int code, String msg, Object data){
        return new ServerResult(code,msg,data);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ServerResult{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
