<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>도서정보</title>

	<link href="${pageContext.request.contextPath}/lib/css/table.css" rel="stylesheet">
	
	
	
  </head>

  <body>
	<jsp:include page="navigation.jsp"></jsp:include>
    
        <!-- /#page-content-wrapper -->
		<div id="content">
		<div class="row">
                <div class="c_total" >
                    <div class="panel panel-primary">
                        <div class="p_heading">
                            도서 정보
                        </div>
                        <!-- /.panel-heading -->
                        
                         
                        <div class="panel-body">
                        <p class="book_img"></p> 
                            <table class="in_table" id="dataTables-example">
                      			<colgroup>
			                        <col style="width:100px;">
			                        <col style="">
			                        <col style="width:100px;">
			                        <col style="width:150px">
			                        <col style="width:100px;">
			                        <col style="width:150px;">
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
		                    <td class="br_none left_td" colspan="5">'해리 포터' 1편부터 6편까지의 영화 명장면 90장 이상을 수록한 포스터 북. 주인공들의 성장 과정과 영화 속 명장면은 물론 주변인물들, 주요사건의 배경이 되는 장소까지 영화 '해리 포터' 시리즈를 고스란히 담았다. 특별부록으로 '해리 포터' 명장면 스티커 100장이 함께 구성된다.</td>
		                </tr>
		                <tr>
		                    <th class="c_td">출판연월</th>
		                    <td class="br_none left_td">2009</td>
		                    <th class="c_td">ISBN</th>
		                    <td class="br_none left_td" colspan="3">9788926390092</td>
		                </tr>
		                <tr>
		                  
		                    <th class="c_td">주제분야</th>
		                    <td class="br_none left_td" style="word-break:all;">688&nbsp;<br/>
		                    [예술 - 영화]
		                    </td> 
		                    <th class="c_td">총 대출건수</th>
		                    <td class="br_none left_td">257</td>
		                </tr>
		            </tbody>

                            </table>
                            
                     <h3 class="h3_title">책을 가지고 있는 도서관</h3>
					    <div class="mgb_20">
					        <span>
					        	도서관을 클릭하시면 지도가 나옵니다.</span>
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
                                            <td><a style="cursor:pointer">도서관A</a></td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><a style="cursor:pointer">도서관B</a></td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><a style="cursor:pointer">도서관C</a></td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
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
    
    
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6602de1672cc7b8e1ce5e3cd00979ed3&libraries=services"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>

	
    <script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
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
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">도서관</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    $("tbody a").bind("click",function(){
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
}); 
    </script>
  </body>

</html>
