<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map02 > #map {
        width: 80%;
        height: 550px;
        border: 2px solid red;
    }
</style>
<%--자바스크립트내에서도 jsp 값을 끄집어 낼수 있따--%>
<script>

    let map02 = {
        map: null,
        init: function () {
            this.display();
            $('#s_btn').click(function () {
                map02.go(37.579617, 126.977041);
            });
            $('#b_btn').click(function () {
                map02.go(35.114495, 129.03933);
            });
            $('#j_btn').click(function () {
                map02.go(33.2541205, 126.560076);
            });
        },
        display: function () {
            var mapContainer = document.querySelector('#map02 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.544569, 127.055974), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨

            };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(37.544569, 127.055974);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
        },
        go: function (lat, lng) {
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.panTo(moveLatLon);

            var markerPosition = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        }
    };
    $(function () {
        map02.init();
    });

</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map02">
        <h3>MAP02 Page</h3>
        <button id="s_btn" type="button" class="btn btn-primary">Seoul</button>
        <button id="b_btn" type="button" class="btn btn-primary">Busan</button>
        <button id="j_btn" type="button" class="btn btn-primary">Jeju</button>
        <div id="map"></div>
    </div>
</div>

