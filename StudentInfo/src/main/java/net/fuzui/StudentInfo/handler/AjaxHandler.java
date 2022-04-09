package net.fuzui.StudentInfo.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.JsonArray;
import com.sun.media.sound.SoftTuning;
import net.fuzui.StudentInfo.pojo.CoursePlan;
import net.fuzui.StudentInfo.pojo.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import net.fuzui.StudentInfo.service.CoursePlanService;
import net.fuzui.StudentInfo.service.CourseService;
import net.fuzui.StudentInfo.service.StudentService;
import net.fuzui.StudentInfo.service.TeacherService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 * @author fuzui
 * @date 2019年4月13日 下午5:32:39
 * 
 */
@Controller
@RequestMapping("/AjaxHandler")
public class AjaxHandler {
	@Autowired
    CourseService courseService;
	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	CoursePlanService coursePlanService;
	
	/**
	 * ajax验证课程编号是否存在
	 * @param cid
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping(value="/existCid",method = RequestMethod.POST)
	public void existCid(@RequestParam("cid") String cid,HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println("课程编号="+cid);
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		System.out.println(cid+"----------");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(courseService.getByCouCid(cid) != null && cid !=null && !"".equals(cid)){
			out.println("课程编号已存在");
		}else if(cid !=null && !"".equals(cid)){
			out.println("此课程编号可以使用");
		}else {
			out.println("课程编号不能为空");
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="/existSid",method = RequestMethod.POST)
	public void existSid(@RequestParam("sid") String sid,HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println("学号="+sid);
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(studentService.getByStuSid(sid) != null && sid.length() ==12){
			out.println("学号已存在");
		}else if(sid.length() ==12){
			out.println("学号可以使用");
		}else {
			out.println("学号必须是12位");
		}
		out.flush();
		out.close();
		
	}
	//ajax验证教师id
	@RequestMapping(value="/existTid",method = RequestMethod.POST)

	public void existTid(@RequestParam("tid") String tid,HttpServletResponse response,HttpServletRequest request) throws IOException{
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(teacherService.getByTeaTid(tid) != null && tid.length() <=5){
			out.println("教师编号已存在");
		}else if(tid.length() <=12){
			out.println("教师编号可以使用");
		}else {
			out.println("教师编号必须小于等于5位");
		}
		out.flush();
		out.close();
		
	}

	
	@RequestMapping(value="/existTime",method = RequestMethod.POST)
	@ResponseBody
	public Msg existTime(@RequestParam("courseclass") String courseclass,
						 @RequestParam("classroom") String classroom,
						 @RequestParam("cid") String cid,@RequestParam("tid") String tid,
						 @RequestParam("credits") String credits,@RequestParam("period") String period,
						 @RequestParam("totalnum") String totalnum, HttpServletResponse response, HttpServletRequest request) throws IOException{


		String courseweek1 = null;
		String coursetime1 = null;
//		System.out.println("cid:"+cid+",tid"+tid+",credits:"+credits+",period:"+period+"totalnum:"+totalnum);
		String[] courseweek = request.getParameterValues("courseweek[]");
		String[] courseTime = request.getParameterValues("courseTime[]");
		Msg msg = coursePlanService.ajaxGetCoursePlan(courseclass, courseTime, courseweek, classroom);
		for(int i=0; i<courseTime.length; i++){
			coursetime1 += courseTime[i]+",";
		}
		for(int n=0; n<courseweek.length; n++){
			courseweek1 += courseweek[n]+",";
		}
		coursetime1 = coursetime1.substring(4,coursetime1.length()-1);
		courseweek1 = courseweek1.substring(4,courseweek1.length()-1);
		CoursePlan coursePlan = new CoursePlan(courseclass,coursetime1,courseweek1,cid,tid,classroom,credits,period,totalnum);
//		System.out.println(coursePlan);
		if (coursePlanService.insertCoursePlan(coursePlan) != 0) {
			return msg;
		} else {
			return Msg.fail3();
//			return new ModelAndView(new RedirectView("/StudentInfo/fail.jsp"));
		}



	}
	
}
