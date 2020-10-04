<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="bodywrap">

<form action="coffeeAdd.do" method="post" enctype="multipart/form-data">
	<input type="text" name="name" size="20" placeholder="커피 이름을 적어주세요"> <br>
	<input type="text" name="price" size="20" placeholder="가격을 입력해주세요"><br>
	<input type="file" name="fileload" size="20"><br><br>
	
	<input type="submit" value="추가" size="20">
</form>

</div>

<script type="text/javascript">
$(document).ready(function(){
	let b = ${b};

	if(b!=null && b){
		alert("정상적으로 추가되었습니다");
	}else if(b!=null && !b){
		alert("추가 진행 중 오류가 발생하였습니다");
	}
});


</script>