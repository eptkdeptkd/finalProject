<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">


<body>
	<section id="menu" class="section">
		<div class="section_container">
			<div>
				<h1>Charless Factory<button type="button" class="menu"><img src="image/coffee5.PNG" width="80"></button></h1>
				
				<!-- bgm 배경 클릭시 노래 -->
				<audio autoplay controls autoplay loop id="mp4" style="opacity: 0">
					<source src="image/coffee.mp4" type="audio/mp4">
				</audio>
				<!-- 배경음악 숨겨놓음  -->
				
				<img src="image/coffee.gif" width="900" height="800">
				

				<hr>
				<h1>RESPONSIBILITY<img src="image/coffee6.PNG" width="80"></h1>
				<p>
					“여러분, 환경을 위해 매장에서는 머그로 찰스의 커피 공장 음료를 즐겨주세요.”<br> 찰스의 커피 공장은
					환경부와 함께 일회용 컵 없는 매장 캠페인을 통해 매장에서 드시는 고객께는 음료를 머그에 담아드리는 것을 <br>표준으로 지정해
					실천하고 있습니다. 찰스의 커피 공장은 환경부, 그린스타트 전국네트워크, 자원순환사회연대와 함께
					2011년 1월부터<br> '일회용 컵 없는 매장' 캠페인을 전개하고 있습니다. 매장에서 음료를 드시는 고객께는
					머그에 제공드리는 것을 서비스의 표준으로 하고 있습니다.<br> 이를 위해 찰스의 커피 공장의 일회용 컵 없는
					매장에서는 업계 최초로 머그 전용 선반을 비롯해, 머그의 온도를 따뜻하게 유지시켜 줄 수 있도록 특별
					열선이 장치된 '머그 워머'가 설치되어 있어 더욱 편리하고 위생적으로 머그를 제공하고 사용할 수 있도록 최선을 다하고
					있습니다.<br> 여러분, 환경을 위해 매장에서는 머그로 찰스의 커피 공장 음료를 즐겨주세요.
				</p>

				<hr>

			</div>

			<div>


				<img src="image/coffee3.PNG" width="800">

				<hr>
				<h1>C.A.F.E Practice<img src="image/coffee7.PNG" width="100"></h1>
				<p>
					찰스의 커피 공장은 투명하고 윤리적인 커피 원두 구매에 있어서 전 세계 커피 산업을 선도하며, <br>그동안
					친환경, 윤리적 커피 원두 구매 방식을 구축해 왔습니다. 1998년 국제 환경 보호 단체 (Conservation
					International)와 협약을 통해<br> 커피 원두 구매 방식에 환경 보호 원칙을 결합시켰으며, 사회적
					· 환경적 책임을 다하는 이러한 노력의 바탕으로 찰스의 커피 공장의 <br>윤리적 커피 원두 구매 프로그램인
					C.A.F.E (Coffee and Farmer Equity) Practice가 탄생될 수 있었습니다. <br>2004년
					정식으로 출범한 찰스의 커피 공장 C.A.F.E Practice는 최상급 커피 원두 재배, 윤리적 책임 완수를 원칙하며,
					<br>소규모 농가에서부터 대규모 농장에 이르기까지 모든 커피 농가가 참여할 수 있도록 운영되고 있습니다.
				</p>
			</div>

			<hr>

			<h1>Charless Factory Map<img src="image/coffee8.PNG" width="90"></h1>

			<!-- 이미지 지도를 표시할 div -->
			<div id="staticMap" style="width: 1150px; height: 350px;" align="center"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43b88cf3a7d7bdc297525273ce6a7468"></script>
			<!-- 이미지 지도를 표시할 div -->
			
			<script type="text/javascript" >
			
			// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
			var markers = [ {
				position : new kakao.maps.LatLng(33.450701, 126.570667)
			}, {
				position : new kakao.maps.LatLng(37.4985161, 127.0270386, 18),
				text : 'Charless Factory 1호점' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
			}, {
				position : new kakao.maps.LatLng(37.4993493, 127.0261126, 17),
				text : 'Charless Factory 2호점'
			}, {
				position : new kakao.maps.LatLng(37.4982127, 127.0265565, 20),
				text : ' Charless Factory s3호점'
			} ];

			var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
			staticMapOption = {
				center : new kakao.maps.LatLng(37.4993493, 127.0261126, 17), // 이미지 지도의 중심좌표
				level : 3, // 이미지 지도의 확대 레벨
				marker : markers
			// 이미지 지도에 표시할 마커 
			};

			// 이미지 지도를 생성합니다
			var staticMap = new kakao.maps.StaticMap(staticMapContainer,
					staticMapOption);
			

			// 배경음악 / 아무곳 클릭시 노래 자동 재생 ----------------------------------------------------------
			
			const beeSound = document.getElementById("mp4"); 
			const [body] = document.getElementsByTagName("body");
			function play() { 
			if (!beeSound instanceof HTMLAudioElement) 
				return; 
			if (beeSound.paused) {
				beeSound.play(); 
			} else { 
				body.removeEventListener("click", play)
			}
				console.log(beeSound.paused); 
			} 
				body.addEventListener("click", play);
			
			// 커피이미지 클릭시 메뉴화면---------------------------------------------------------------------
			
			$(".menu").click(function(){
				location.href="coffeeMain.do";	
			});
			
		</script>



		</div>

	</section>
</body>
