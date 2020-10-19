<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="menu" class="section">
        <div class="section_container">

		<h2 class="coffee_add_h2"> 사이드 추가 </h2>
            <form action="addSideAf.do" method="post">
                <div class="menu_admin">
                    <div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Name</h3>
                            <input type="text" class="info_input" name="name" size="20" placeholder="사이드의 이름을 적어주세요"
                                required>
                        </div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Price</h3>
                            <input type="text" class="info_input" name="price" size="20" placeholder="가격을 입력해주세요"
                                required>
                        </div>
                        <div class="info_titleinput">
                            <input type="submit" class="sideadd_btn" value="추가" size="20">
                        </div>
                    </div>
                </div>
            </form>
 </div>
</section>
            


