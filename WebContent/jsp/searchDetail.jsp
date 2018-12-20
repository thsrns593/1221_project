<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>도서정보</title>

<style type="text/css">
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: none;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}
.row {
	margin-top: 5%;
}

.panel {
	height: 1100px;
}

.p_heading {
	height: auto;
	width: 100%;
	font-size: 40px;
	background-color: #b0b0b0;
	padding: 10px;
	margin-bottom: 40px;
}

.table {
	margin: auto;
	width: 80%;
	float: right;
}

.t_table {
	width: 100%;
	height: auto;
}

.panel-body p {
	margin: 20px 10px 0 40px; width : 160px;
	height: 200px;
	border: 1px solid black;
	display: inline-block;
	width: 160px;
}

.h3_title {
	margin-top: 10%;
	width: auto;
	background-color: #efefef;
	padding: 20px;
}

.view_tbl {
	width: 100%;
	text-align: center;
}

.view_tbl thead {
	background-color: #c0c0c0;
	width: 100%;
}

.c_total {
	margin: auto;
	height: auto;
	min-width: 100%;
	border: 1px solid #c0c0c0;
}

#map {
	margin: auto;
	width: auto;
	height: 500px;
}

.show {
	display: block;
}

.b_table tbody a:hover {
	text-decoration: none;
	color: red !important;
	border-bottom: 1px solid red;
}

.in_table {
	margin-left: 5px;
	margin-right: 30px;
	margin-top: 15px;
	float: right;
	width: 850px;
	border: 1px solid black;
}

.in_table .c_td {
	border: 1px solid black;
}

.in_table .br_none {
	border: 1px solid black;
}

.li_box .b_table {
	border: 10px solid red;
	width: 100%;
	margin: auto;
}

#content {
	margin: auto;
	padding: 0;
	width: 1100px;
	height: auto;
	min-height: 655px;
}

.page_button {
	padding: 5px;
	display: inline-block;
}

.page_area {
	border: 1px solid #dedede;
	border-radius: 5px;
	text-align: center;
	padding: 0;
}

.page_area a {
	color: rgba(0, 84, 255);
}

.page_disable {
	display: inline-block;
	color: #ababab;
}

.page_selected {
	font-size: 20px;
	font-weight: bold;
}
</style>

</head>

<body>
	<jsp:include page="navigation.jsp"></jsp:include>

	<!-- /#page-content-wrapper -->
	<div id="content">
		<div class="row">
			<div class="c_total">
				<div class="panel panel-primary">
					<div class="p_heading">도서 정보</div>
					<!-- /.panel-heading -->


					<div class="panel-body">
						<p class="book_img"><img src="${thumbnail}"></p>
						<table class="in_table" id="dataTables-example">
							<colgroup>
								<col style="width: 100px;">
								<col style="">
								<col style="width: 100px;">
								<col style="width: 150px;">
								<col style="width: 100px;">
								<col style="width: 150px;">
							</colgroup>
							<tbody>
								<tr>
									<th class="c_td">도서명</th>
									<td class="br_none left_td" colspan="5">${title}</td>
								</tr>
								<tr>
									<th class="c_td">저자</th>
									<td class="br_none left_td" colspan="5">${author}</td>
								</tr>
								<tr>
									<th class="c_td">출판사</th>
									<td class="br_none left_td" colspan="5">${publisher}</td>
								</tr>
								<tr>
									<th class="c_td">책소개</th>
									<td class="br_none left_td" colspan="5">${contents}</td>
								</tr>
								<tr>
									<th class="c_td">출판연월</th>
									<td class="br_none left_td">${datetime}</td>
									<th class="c_td">ISBN</th>
									<td class="br_none left_td" colspan="3">
									<input type="hidden" value="${isbn13}" id="isbn"/>
									${isbn13}
									</td>
								</tr>
								<tr>

									<th class="c_td">번역가</th>
									<td class="br_none left_td" style="word-break: all;" id="cate">
									${translators}
									</td>
									<th class="c_td">원가</th>
									<td class="br_none left_td">${price}</td>
								</tr>
							</tbody>

						</table>
						
						<h3 class="h3_title">지역을 선택해 주세요</h3>
						<form action="" method="post" id="searchbookform">
							<label
									style="line-height: 100%; border: 1px solid #E0F8E0; background-color: #E0F8E0; color: gray; width: 50px; padding: 2px; font-size: 20px;">지역</label>
								<select name="h_area1" id="h_area1"
									onChange="cat1_change(this.value,h_area2)">
									<option selected>-선택-</option>
									<option value='1'>서울특별시</option>
									<option value='2'>부산광역시</option>
									<option value='3'>대구광역시</option>
									<option value='4'>인천광역시</option>
									<option value='5'>광주광역시</option>
									<option value='6'>대전광역시</option>
									<option value='7'>울산광역시</option>
									<option value='8'>강원도</option>
									<option value='9'>경기도</option>
									<option value='10'>경상남도</option>
									<option value='11'>경상북도</option>
									<option value='12'>전라남도</option>
									<option value='13'>전라북도</option>
									<option value='14'>제주특별자치도</option>
									<option value='15'>충청남도</option>
									<option value='16'>충청북도</option>
								</select> <select name="h_area2" id="h_area2">
									<option>-선택-</option>
								</select>
								<button type="button" onclick="searchlib(this.form)">검색하기</button>
						</form>
						<div class="li_box">

							


							<div id="map"></div>
							<div id="ing"></div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>

				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->

	<!-- /#wrapper -->

	<jsp:include page="footer.jsp"></jsp:include>

	<div id="load">
		<img src="${pageContext.request.contextPath}/images/loading.gif" alt="loading">
	</div>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10238676475819144801ce4c309505cf&libraries=services"></script>
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>


	<script type="text/javascript">
	
	function searchlib(frm) {
		var h_area1 = frm.h_area1;
		var h_area2 = frm.h_area2;
		
		var address = h_area1.options[h_area1.selectedIndex].text+" "+h_area2.options[h_area2.selectedIndex].text;
		var isbn13 = $("#isbn").val();
		$("#load").show();
		$.ajax({
			url : "searchLib.inc?address="+address+"&isbn13="+isbn13,
			type : "get",
			dataType : "json"
		}).done(function(data){
			var ar = data.ar;
			
			if(ar.length == 0){
				alert("책을 소장하고 있는 도서관이 없습니다.");
			}
			
			
			
			var points = new Array;
			var markers = [];
			var bounds = new daum.maps.LatLngBounds();
	 		for(var i = 0; i < ar.length; i++){
	 			points.push(new daum.maps.LatLng(ar[i].latitude, ar[i].longitude));
			 
			    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			    var marker = new daum.maps.Marker({
			        position : points[i], // 마커를 표시할 위치
			        title : ar[i].libName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
			        clickable: true
			    });
			    //var marker = new daum.maps.Marker({ position : points[i], clickable: true });
			    marker.setMap(map);
			    markers.push(marker);
			    var fontSize;
			    if(ar[i].libName.length >11)
			    	fontSize = "10";
			    else
			    	fontSize = "12";
			    var iwContent = "<div style='padding:5px; font-size :"+fontSize+"px;'><div>"+ar[i].libName+
			    	"</div><div><a target='_blank' href='"+ar[i].homepage+"'>"+ar[i].homepage+"</a></div></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			    iwPosition = new daum.maps.LatLng(ar[i].latitude, ar[i].longitude);
			    var infowindow = new daum.maps.InfoWindow({
			        content : iwContent,
			        removable : iwRemoveable
			    });
			 // LatLngBounds 객체에 좌표를 추가합니다
			    bounds.extend(points[i]);
			 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
			    //daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			   
	 		}
	 		setBounds(bounds);
	 		$("#load").hide();
		});  
		
	}
	function setBounds(bounds) {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		// 아래와 같이 옵션을 입력하지 않아도 된다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("서울특별시 관악구 시흥대로 552 석천빌딩 7층",function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});
				var iwContent = '<div style="padding:5px;">인크레파스<img src="${pageContext.request.contextPath}/images/heart.png"/><div>대표님감사합니다</div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new daum.maps.LatLng(result[0].y, result[0].x); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				infowindow.open(map, marker);
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
			
			function relayout() {

				// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
				// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
				// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
				map.relayout();
			}
			
			// 지도 오른쪽에 줌 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		});
		var cat1_num = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
				15, 16);
		var cat1_name = new Array('서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시',
				'대전광역시', '울산광역시', '강원도', '경기도', '경상남도', '경상북도', '전라남도', '전라북도',
				'제주특별자치도', '충청남도', '충청북도');

		var cat2_num = new Array();
		var cat2_name = new Array();

		cat2_num[1] = new Array(17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
				29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
		cat2_name[1] = new Array('강남구', '강동구', '강북구', '강서구', '관악구', '광진구',
				'구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
				'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구',
				'중구', '중랑구');

		cat2_num[2] = new Array(42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
				54, 55, 56, 57);
		cat2_name[2] = new Array('강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구',
				'사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구', '기장군');

		cat2_num[3] = new Array(58, 59, 60, 61, 62, 63, 64, 65);
		cat2_name[3] = new Array('남구', '달서구', '동구', '북구', '서구', '수성구', '중구',
				'달성군');

		cat2_num[4] = new Array(66, 67, 68, 69, 70, 71, 72, 73, 74, 75);
		cat2_name[4] = new Array('계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구',
				'중구', '강화군', '옹진군');

		cat2_num[5] = new Array(76, 77, 78, 79, 80);
		cat2_name[5] = new Array('광산구', '남구', '동구', '북구', '서구');

		cat2_num[6] = new Array(81, 82, 83, 84, 85);
		cat2_name[6] = new Array('대덕구', '동구', '서구', '유성구', '중구');

		cat2_num[7] = new Array(86, 87, 88, 89, 90);
		cat2_name[7] = new Array('남구', '동구', '북구', '중구', '울주군');

		cat2_num[8] = new Array(91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101,
				102, 103, 104, 105, 106, 107, 108);
		cat2_name[8] = new Array('강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시',
				'태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군',
				'홍천군', '화천군', '횡성군');

		cat2_num[9] = new Array(109, 110, 111, 112, 113, 114, 115, 116, 117,
				118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129,
				130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141,
				142, 143, 144, 145, 146, 147, 148);
		cat2_name[9] = new Array('고양시 덕양구', '고양시 일산구', '과천시', '광명시', '광주시',
				'구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시 소사구', '부천시 오정구',
				'부천시 원미구', '성남시 분당구', '성남시 수정구', '성남시 중원구', '수원시 권선구',
				'수원시 장안구', '수원시 팔달구', '시흥시', '안산시 단원구', '안산시 상록구', '안성시',
				'안양시 동안구', '안양시 만안구', '오산시', '용인시', '의왕시', '의정부시', '이천시',
				'파주시', '평택시', '하남시', '화성시', '가평군', '양주군', '양평군', '여주군', '연천군',
				'포천군');

		cat2_num[10] = new Array(149, 150, 151, 152, 153, 154, 155, 156, 157,
				158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168);
		cat2_name[10] = new Array('거제시', '김해시', '마산시', '밀양시', '사천시', '양산시',
				'진주시', '진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군',
				'창녕군', '하동군', '함안군', '함양군', '합천군');

		cat2_num[11] = new Array(169, 170, 171, 172, 173, 174, 175, 176, 177,
				178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
				190, 191, 192);
		cat2_name[11] = new Array('경산시', '경주시', '구미시', '김천시', '문경시', '상주시',
				'안동시', '영주시', '영천시', '포항시 남구', '포항시 북구', '고령군', '군위군', '봉화군',
				'성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군',
				'칠곡군');

		cat2_num[12] = new Array(193, 194, 195, 196, 197, 198, 199, 200, 201,
				202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214);
		cat2_name[12] = new Array('광양시', '나주시', '목포시', '순천시', '여수시', '강진군',
				'고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군',
				'완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군');

		cat2_num[13] = new Array(215, 216, 217, 218, 219, 220, 221, 222, 223,
				224, 225, 226, 227, 228, 229);
		cat2_name[13] = new Array('군산시', '김제시', '남원시', '익산시', '전주시 덕진구',
				'전주시 완산구', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군',
				'장수군', '진안군');

		cat2_num[14] = new Array(230, 231, 232, 233);
		cat2_name[14] = new Array('서귀포시', '제주시', '남제주군', '북제주군');

		cat2_num[15] = new Array(234, 235, 236, 237, 238, 239, 240, 241, 242,
				243, 244, 245, 246, 247, 248);
		cat2_name[15] = new Array('공주시', '논산시', '보령시', '서산시', '아산시', '천안시',
				'금산군', '당진군', '부여군', '서천군', '연기군', '예산군', '청양군', '태안군', '홍성군');

		cat2_num[16] = new Array(249, 250, 251, 252, 253, 254, 255, 256, 257,
				258, 259, 260);
		cat2_name[16] = new Array('제천시', '청주시 상당구', '청주시 흥덕구', '충주시', '괴산군',
				'단양군', '보은군', '영동군', '옥천군', '음성군', '진천군', '청원군');

		function cat1_change(key, sel) {
			if (key == '')
				return;
			var name = cat2_name[key];
			var val = cat2_num[key];

			for (i = sel.length - 1; i >= 0; i--)
				sel.options[i] = null;
			sel.options[0] = new Option('-선택-', '', '', 'true');
			for (i = 0; i < name.length; i++) {
				sel.options[i + 1] = new Option(name[i], val[i]);
			}
		}
	</script>
</body>

</html>
