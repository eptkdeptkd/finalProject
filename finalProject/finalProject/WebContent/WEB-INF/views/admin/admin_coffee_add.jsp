<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="bodywrap">

<form action="coffeeAdd.do" method="post" enctype="multipart/form-data">
	<input type="text" name="kind" size="20" placeholder="커피 종류를 입력해주세요" required><br>
	<input type="text" name="name" size="20" placeholder="커피 이름을 적어주세요" required> <br>
	<input type="text" name="price" size="20" placeholder="가격을 입력해주세요" required><br>
	<textarea rows="10" cols="20" name="info" placeholder="커피 정보를 입력해주세요" required></textarea>
	<input type="file" name="fileload" size="20" required><br><br>
	
	<input type="submit" value="추가" size="20">
</form>

</div>
