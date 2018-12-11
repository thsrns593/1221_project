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
	height: 300px;
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
						<p class="book_img"></p>
						<table class="in_table" id="dataTables-example">
							<colgroup>
								<col style="width: 100px;">
								<col style="">
								<col style="width: 100px;">
								<col style="width: 150px">
								<col style="width: 100px;">
								<col style="width: 150px;">
							</colgroup>
							<tbody>
								<tr>
									<th class="c_td">저자</th>
									<td class="br_none left_td" colspan="5">서울문화사 [편]</td>
								</tr>
								<tr>
									<th class="c_td">출판사</th>
									<td class="br_none left_td" colspan="5">서울문화사</td>
								</tr>
								<tr>
									<th class="c_td">책소개</th>
									<td class="br_none left_td" colspan="5">'해리 포터' 1편부터 6편까지의
										영화 명장면 90장 이상을 수록한 포스터 북. 주인공들의 성장 과정과 영화 속 명장면은 물론 주변인물들,
										주요사건의 배경이 되는 장소까지 영화 '해리 포터' 시리즈를 고스란히 담았다. 특별부록으로 '해리 포터' 명장면
										스티커 100장이 함께 구성된다.</td>
								</tr>
								<tr>
									<th class="c_td">출판연월</th>
									<td class="br_none left_td">2009</td>
									<th class="c_td">ISBN</th>
									<td class="br_none left_td" colspan="3">9788926390092</td>
								</tr>
								<tr>

									<th class="c_td">주제분야</th>
									<td class="br_none left_td" style="word-break: all;">688&nbsp;<br />
										[예술 - 영화]
									</td>
									<th class="c_td">총 대출건수</th>
									<td class="br_none left_td">257</td>
								</tr>
							</tbody>

						</table>

						<h3 class="h3_title">책을 가지고 있는 도서관</h3>
						<div class="mgb_20">
							<span> 도서관을 클릭하시면 지도가 나옵니다.</span>
						</div>
						<div class="li_box">

							<div class="panel-body">
								<div class="table-responsive">
									<table class="b_table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>No</th>
												<th>도서관명</th>
												<th>주소</th>
												<th>전화번호</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><a style="cursor: pointer">도서관A</a></td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<td>2</td>
												<td><a style="cursor: pointer">도서관B</a></td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<td>3</td>
												<td><a style="cursor: pointer">도서관C</a></td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
											<tr>
												<td>4</td>
												<td><a style="cursor: pointer">도서관D</a></td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
											<tr>
												<td>5</td>
												<td><a style="cursor: pointer">도서관E</a></td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div id="page_num_area">
									<ul class="page_area">
										<li class="page_button page_disable" id="previous_btn">이전</li>
										<li class="page_button page_selected"><a href="#">1</a></li>
										<li class="page_button"><a href="#">2</a></li>
										<li class="page_button"><a href="#">3</a></li>
										<li class="page_button"><a href="#">4</a></li>
										<li class="page_button"><a href="#">5</a></li>
										<li class="page_button" id="next_btn"><a href="#">다음</a></li>
									</ul>
								</div>
							</div>


							<div id="map" style="display: none;"></div>
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


	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10238676475819144801ce4c309505cf&libraries=services"></script>
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>


	<script type="text/javascript">
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
		geocoder.addressSearch('인천광역시 남구 숭의4동', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new daum.maps.InfoWindow({
					content : '도서관'
				});
				infowindow.open(map, marker);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
			$("tbody a").bind("click", function() {
				$("#map").slideToggle("fast");
				resizeMap();
				relayout();

			});
			function relayout() {

				// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
				// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
				// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
				map.relayout();
			}
			function resizeMap() {
				var mapContainer = document.getElementById('map');
				mapContainer.style.width = '650px';
				mapContainer.style.height = '650px';
			}
			// 지도 오른쪽에 줌 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		});
	</script>
</body>

</html>
