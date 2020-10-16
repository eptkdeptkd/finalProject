<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mn/coffeeMenu.css">

 <!--Menu-->
  <section class="section">
    <div class="section_container">
      <h2>MENU</h2>
      <div class="coffee_categories">
        <button class="category_btn selected" data-filter="*" onclick="showCoffee(0)">
          All
        </button>
        <button class="category_btn" data-filter="Espresso" onclick="showCoffee(1)">
          Espresso
        </button>
        <button class="category_btn" data-filter="Frappuccino" onclick="showCoffee(2)">
          Frappuccino
        </button>
        <button class="category_btn" data-filter="ColdBrew" onclick="showCoffee(3)">
          Cold Brew
        </button>
        <button class="category_btn" data-filter="OtherDrinks" onclick="showCoffee(4)">
          Other Drinks
        </button>
      </div>

	 <div class="coffee_contents">
	 	<c:forEach items="${list }" var="dto" varStatus="vs">
	 		<div class="content_box">
	 			<a href="coffeeDetailMove.do?seq=${dto.seq }" class="content">
	 				<img src="http://192.168.0.195:8090/finalProject/upload/${dto.newname }" class="coffee_img">
	 			</a>
	 			<p class="coffee_name">${dto.name }</p>
	 		</div>
	 	</c:forEach>
	 </div> 
	</div>
	</section>
	
<script type="text/javascript">

function showCoffee(kind){
	$.ajax({
		url:"getKindList.do",
		data:{"kind":kind},
		type:"post",
		success:function(list){
			$(".content_box").remove();

			var str = "";
			for(var i=0; i<list.length; i++){
				str += "<div class='content_box'>";
				str += "<a href='coffeeDetailMove.do?seq="+list[i].seq+"' class='content' >";
				str += "<img src='http://192.168.0.195:8090/finalProject/upload/"+list[i].newname+"'></a>";
				str += "<p class='coffee_name'>"+list[i].name+"</p></div>";
			}
			
			$(".coffee_contents").append(str);
		},
		error:function(){
			alert("error");
		}
	});		
}

//Menu
const coffeeBtnContainer = document.querySelector(".coffee_categories");
const coffeeContainer = document.querySelector(".coffee_contents");
const contents = document.querySelectorAll(".content_box");
coffeeBtnContainer.addEventListener("click", (e) => {
    const filter = e.target.dataset.filter || e.target.parentNode.dataset.filter;
    if (filter == null) {
        return;
    }

    // Remove selection from the previous item and select the new one
    const active = document.querySelector(".category_btn.selected");
    active.classList.remove("selected");
    const target =
        e.target.nodeName === "BUTTON" ? e.target : e.target.parentNode;
    target.classList.add("selected");

    // console.log(filter);
    coffeeContainer.classList.add("anim-out");
    setTimeout(() => {
        contents.forEach((content_box) => {
            console.log(content_box.dataset.type);
            if (filter === "*" || filter === content_box.dataset.type) {
                content_box.classList.remove("invisible");
            } else {
                content_box.classList.add("invisible");
            }
        });
        // for(let project of projects) {}
        /* let project
        for(let i = 0; i < projects.length ; i++ ) {
            project = projects[i];
        } */
        coffeeContainer.classList.remove("anim-out");
    }, 300);
});

</script>