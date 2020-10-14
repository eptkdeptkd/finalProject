<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--Coffee add - 메뉴 추가 페이지-->
    <section id="menu" class="section">
        <div class="section_container">
            <h2>Coffee Add (Admin)</h2>
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
                            <input type="submit" class="coffeeadd_btn" value="추가" size="20">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
