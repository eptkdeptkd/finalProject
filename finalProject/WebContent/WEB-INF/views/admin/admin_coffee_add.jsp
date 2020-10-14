<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.add_h2 {
    font-size: 36pt;
    color:black;
    margin: 8px 0;
    text-align:center;
    font-family: 'Sunflower', sans-serif;
} 
</style>

<!--Coffee add - 메뉴 추가 페이지-->
    <section id="menu" class="section">
        <div class="section_container">
            <h2 class="add_h2">커피 추가</h2>
            <form action="coffeeAdd.do" method="post" enctype="multipart/form-data">
                <div class="menu_admin">
                    <div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Type</h3>
                            <input type="text" class="info_input" name="kind" size="20" placeholder="커피 종류를 입력해주세요"
                                required>
                        </div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Name</h3>
                            <input type="text" class="info_input" name="name" size="20" placeholder="커피 이름을 적어주세요"
                                required>
                        </div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Price</h3>
                            <input type="text" class="info_input" name="price" size="20" placeholder="가격을 입력해주세요"
                                required>
                        </div>
                        <div class="info_titleinput">
                            <h3 class="info_title">Explain</h3>
                            <textarea class="info_textarea" name="info" placeholder="커피 정보를 입력해주세요" required></textarea>
                        </div>
                        <div class="info_titleinput">
                            <input type="file" name="fileload" size="20" required>
                            <input type="submit" class="coffeeadd_btn" value="ADD" size="20">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
