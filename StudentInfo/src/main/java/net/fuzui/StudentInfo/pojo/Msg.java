package net.fuzui.StudentInfo.pojo;

import java.util.HashMap;

/**
 * @author FJJ
 * @creat 2022--03--21--21:32
 * @description
 */
public class Msg {
    //状态码显示，100失败，200成功
    private int code;

    private String msg;

    private HashMap<String,Object> extend = new HashMap();

    public static Msg fail1(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("此班级在这个时间点有课");
        return result;

    }

    public static Msg fail2(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("这个教室在这个时间点已被占用");
        return result;
    }

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(300);
        result.setMsg("可以排课");
        return result;
    }

    public static Msg fail3(){
        Msg result = new Msg();
        result.setCode(400);
        result.setMsg("添加失败");
        return result;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", extend=" + extend +
                '}';
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

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }

    public Msg() {
    }

    public Msg(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
