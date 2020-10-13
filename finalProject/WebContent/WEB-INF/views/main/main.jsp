<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="test">

<div>
	<iframe width="854" height="480" src="http://www.youtube.com/embed/Y6_X0UoEsBQ"></iframe>
	<p>“여러분, 환경을 위해 매장에서는 머그로 스타벅스 음료를 즐겨주세요.”<br>

	        스타벅스커피 코리아는 환경부와 함께 일회용 컵 없는 매장 캠페인을 통해 매장에서 드시는 고객께는 음료를 머그에 담아드리는 것을 표준으로 지정해 실천하고 있습니다.<br>
		스타벅스커피 코리아는 환경부, 그린스타트 전국네트워크, 자원순환사회연대와 함께 2011년 1월부터 '일회용 컵 없는 매장' 캠페인을 전개하고 있습니다.<br>
		매장에서 음료를 드시는 고객께는 머그에 제공드리는 것을 서비스의 표준으로 하고 있습니다.<br>

		이를 위해 스타벅스의 일회용 컵 없는 매장에서는 업계 최초로 머그 전용 선반을 비롯해,<br>
		머그의 온도를 따뜻하게 유지시켜 줄 수 있도록 특별 열선이 장치된 '머그 워머'가 설치되어 있어 더욱 편리하고 위생적으로 머그를 제공하고 사용할 수 있도록 최선을 다하고 있습니다.<br>

		여러분, 환경을 위해 매장에서는 머그로 스타벅스 음료를 즐겨주세요.</p>
</div>

<div>
	<iframe width="854" height="480" src="http://www.youtube.com/embed/js9KuCLpdRw"></iframe>
	<p>하하하ㅏ하하하</p>
</div>

	<h1>찰스의 커피공장 위치 </h1>

<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width:600px;height:350px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43b88cf3a7d7bdc297525273ce6a7468"></script>
<script>    

//이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(33.450701, 126.570667)
    },
    {
        position: new kakao.maps.LatLng(37.4985161,127.0270386,18), 
        text: '찰스의 커피공장1호점' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    },
    {
    	position: new kakao.maps.LatLng(37.4993493,127.0261126,17), 
        text: '찰스의 커피공장2호점'
    },
    {
    	position: new kakao.maps.LatLng(37.4982127,127.0265565,20), 
        text: '찰스의 커피공장3호점'
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.4993493,127.0261126,17), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);

</script>
</div>



