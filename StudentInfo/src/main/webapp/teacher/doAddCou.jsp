<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico"
	type="image/x-icon" />
<meta charset="UTF-8">
<title>学生信息管理系统</title>

<script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
<!-- Loading Bootstrap -->
<link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
<!-- Loading Flat UI Pro -->
<link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
<!-- Loading Flat UI JS -->
<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>

<script type="text/javascript">
	// let addCourse = document.getElementById('addCourse');
	$(document).ready(
			function() {
				$("#addCourse").click(
						function() {
							<%--var s1 = ${sessionScope.tid };--%>
							<%--var s2 = "/1";--%>
							var curPath = window.document.location.href;
							//获取主机地址之后的目录，
							var pos = curPath.indexOf(pathName);
							//获取主机地址
							var localhostPaht = curPath.substring(0, pos);
							// alert(localhostPaht);
							var jumpQuery = `180.76.98.159:8080/StudentInfo/TeacherHandler/managecou/${tid}`+"/1";
							alert(jumpQuery);
							var arrayObj = new Array();
							var arr2 = new Array();
							for(var i = 1;i<=document.getElementsByName('coursetime').length;i++){
								if(document.getElementById('coursetime'+i).checked){
									arrayObj.push(document.getElementById('coursetime'+i).value);

								};
							};

							for(var n=1; n<= document.getElementsByName('courseweek').length;n++){
								if(document.getElementById('courseweek'+n).checked){
									arr2.push(document.getElementById('courseweek'+n).value)
								};
							};

							$.ajax({
								type: "POST",
								url: "/StudentInfo/AjaxHandler/existTime/",
								// data:{"courseTime:":JSON.stringify(arrayObj),"courseweek:":$("#courseweek").val() ,"classroom:":$("#classroom")},
								data: {"courseclass":$("#courseclass").val(),
									"classroom":$("#classroom").val(),"courseweek":arr2,
									"courseTime": arrayObj,
									"cid": ${cid},
									"tid": ${tid},
									"credits": $("#credits").val(),
									"period": $("#period").val(),
									"totalnum": $("#totalnum").val()
								},
								// contentType : "application/json",
								success:function (result){
								    if(result.code == "100" || result.code == "200" || result.code == "400"){
										// addCourse.style.
								    	alert(result.msg)
                                    }else if(result.code == 300){
								    	// alert("添加成功");

										location.href=jumpQuery;
									}
								}
							});
						})

			})

</script>

<script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script><link href="/StudentInfo/utils/css/animate.css" rel="stylesheet"></head>




<body>
<div id="particles-js"><canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas></div>
	<jsp:include page="teacherLeft.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5>新建课程</h5>
				<form action="/StudentInfo/CoursePlanHandler/doaddcouplan/${sessionScope.tid}"
					method="get">
					<div class="row">
						<div class="col-md-6">
							<br /> 新建班级名称 <input type="text" name="courseclass" id="courseclass"
								class="form-control" maxlength="8"/>
								上课时间
							<label class="checkbox" for="coursetime1">
								<input type="checkbox" name="coursetime" value="12" id="coursetime1"
									   data-toggle="checkbox" class="custom-checkbox">
								<span class="icons">
									<span class="icon-unchecked"></span>
							<span class="icon-checked"></span>
								</span> 第一二节
							</label>
							<label class="checkbox" for="coursetime2"> <input
								type="checkbox" name="coursetime" value="34" id="coursetime2"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 第三四节
							</label>
							<label class="checkbox" for="coursetime3"> <input
								type="checkbox" name="coursetime" value="56" id="coursetime3"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 第五六节
							</label>
							<label class="checkbox" for="coursetime4"> <input
								type="checkbox" name="coursetime" value="78" id="coursetime4"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 第七八节

							</label> <br> 上课周 <label class="checkbox" for="courseweek1">
								<input type="checkbox" name="courseweek" value="1"
								id="courseweek1" data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期一
							</label> <label class="checkbox" for="courseweek2"> <input
								type="checkbox" name="courseweek" value="2" id="courseweek2"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期二
							</label> <label class="checkbox" for="courseweek3"> <input
								type="checkbox" name="courseweek" value="3" id="courseweek3"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期三
							</label> <label class="checkbox" for="courseweek4"> <input
								type="checkbox" name="courseweek" value="4" id="courseweek4"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期四
							</label> <label class="checkbox" for="courseweek5"> <input
								type="checkbox" name="courseweek" value="5" id="courseweek5"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期五
							</label> <label class="checkbox" for="courseweek6"> <input
								type="checkbox" name="courseweek" value="6" id="courseweek6"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期六
							</label> <label class="checkbox" for="courseweek7"> <input
								type="checkbox" name="courseweek" value="7" id="courseweek7"
								data-toggle="checkbox" class="custom-checkbox"><span
								class="icons"><span class="icon-unchecked"></span><span
									class="icon-checked"></span></span> 星期日
							</label>

						</div>
						<div class="col-md-6">
							<h6>课程编号</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="cid" value="${cid}"
										class="form-control" readonly />
								</div>
							</div>
							<h6>教师编号</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="tid" value="${sessionScope.tid }"
										class="form-control" readonly />
								</div>
							</div>
							<h6>上课教室</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="classroom" id="classroom"
										class="form-control" maxlength="8" />
								</div>
							</div>
							<span id="couplan" style="color: #ff0000;"></span>
							<h6>学分</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="credits" id="credits" class="form-control" oninput = "value=value.replace(/[^\d]/g,'')" maxlength="1"/>
								</div>
							</div>
							<h6>学时</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="period" id="period" class="form-control" oninput = "value=value.replace(/[^\d]/g,'')" maxlength="2" />
								</div>
							</div>
							<h6>总人数</h6>
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="totalnum" id="totalnum" class="form-control" oninput = "value=value.replace(/[^\d]/g,'')" maxlength="2"  />
								</div>
							</div>
						</div>
<%--						class="btn btn-primary btn-wide login-btn"--%>
					</div>

				</form>
				<div class="col-md-12" style="margin-top: 1rem;">
					<input type="submit" value="添加" id="addCourse" name="addCourse"
						   class="btn btn-primary btn-wide login-btn"
					/>
				</div>
			</div>


		</div>

	</div>
	<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.js"></script>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script></body>

</html>