package net.fuzui.StudentInfo.pojo;

import java.io.Serializable;

/**
 * @author FJJ
 * @creat 2022--04--03--15:51
 * @description
 */
public class StudentGrade implements Serializable {
    //序列化
    private static final long serialVersionUID = 1L;
    //学号
    private String sid;
    //姓名
    private String sname;
    //性别
    private String ssex;
    //班级
    private String classr;
    //专业
    private String profession;
    //学院
    private String college;
    //分数
    private Integer grade;
    //学分
    private Integer credits;

    public StudentGrade() {
    }

    public StudentGrade(String sid, String sname, String ssex, String classr, String profession, String college, Integer grade, Integer credits) {
        this.sid = sid;
        this.sname = sname;
        this.ssex = ssex;
        this.classr = classr;
        this.profession = profession;
        this.college = college;
        this.grade = grade;
        this.credits = credits;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getClassr() {
        return classr;
    }

    public void setClassr(String classr) {
        this.classr = classr;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    @Override
    public String toString() {
        return "StudentGrade{" +
                "sid='" + sid + '\'' +
                ", sname='" + sname + '\'' +
                ", ssex='" + ssex + '\'' +
                ", classr='" + classr + '\'' +
                ", profession='" + profession + '\'' +
                ", college='" + college + '\'' +
                ", grade=" + grade +
                ", credits=" + credits +
                '}';
    }
}
