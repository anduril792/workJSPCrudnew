<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Soar Like an Eagle 販售各式包包">
<meta name="keywords" content="Soar Like an Eagle 波士頓包 郵差包 腰包 肩背包 托特包">
<title>Soar Like an Eagle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	var interval;

	function startSecond() {
		interval = window.setInterval("changeSecond()", 1000);

	}

	function changeSecond() {
		var second = document.getElementById("second");

		var svalue = second.innerHTML;

		svalue = svalue - 1;

		if (svalue == 0) {
			window.clearInterval(interval);
			location.href = "index.jsp";
			return;
		}

		second.innerHTML = svalue;
	}
</script>
</head>
<body onload="startSecond()">
	<jsp:include page="header.jsp" />
	
	<div class="container" style="margin-top:50px">
		<div class="row">
			<div class="col-lg-4 col-lg-offset-4">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">修改失敗！</h3>
					</div>
					<div class="panel-body">
						<span id="second">5</span>秒後自動為您跳回首頁。
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>