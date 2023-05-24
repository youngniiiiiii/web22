<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<style>--%>
<%--    #c1, #c2, #c3 {--%>
<%--        width: 330px;--%>
<%--        height: 300px;--%>
<%--        border: 2px solid lightskyblue;--%>
<%--        margin: 0 20px;--%>
<%--    }--%>
<%--</style>--%>
<script>
    let chart03 = {
        init: function () {
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1: function () {
            $.ajax({
                url: '/chart0301',
                success: function (result) {
                    chart03.display1(result);
                }
            });
        },
        getdata2: function () {
            $.ajax({
                url: '/chart0302',
                success: function (result) {
                    chart03.display2(result);
                }
            })
        },
        getdata3: function () {
            $.ajax({
                url: '/chart0303',
                success: function (result) {
                    chart03.display3(result);
                }
            })
        },
        display1: function (result) {
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });

        },
        display2: function (result) {
            Highcharts.chart('c2', {
                chart: {
                    type: 'pyramid3d',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        depth: 50,
                        viewDistance: 50
                    }
                },
                title: {
                    text: 'Highcharts Pyramid3D Chart'
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            allowOverlap: true,
                            x: 10,
                            y: -5
                        },
                        width: '60%',
                        height: '80%',
                        center: ['50%', '45%']
                    }
                },
                series: [{
                    name: 'Unique users',
                    data: result
                }]
            });

        },
        display3: function (result) {
            Highcharts.chart('c3', {
                chart: {
                    type: 'packedbubble',
                    height: '100%'
                },
                title: {
                    text: 'Carbon emissions around the world (2014)',
                    align: 'left'
                },
                tooltip: {
                    useHTML: true,
                    pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
                },
                plotOptions: {
                    packedbubble: {
                        minSize: '30%',
                        maxSize: '120%',
                        zMin: 0,
                        zMax: 1000,
                        layoutAlgorithm: {
                            splitSeries: false,
                            gravitationalConstant: 0.02
                        },
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            filter: {
                                property: 'y',
                                operator: '>',
                                value: 250
                            },
                            style: {
                                color: 'black',
                                textOutline: 'none',
                                fontWeight: 'normal'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Europe',
                    data: result
                }, {
                    name: 'Africa',
                    data: result
                }, {
                    name: 'Oceania',
                    data: result
                }, {
                    name: 'North America',
                    data: result
                }, {
                    name: 'South America',
                    data: result
                }, {
                    name: 'Asia',
                    data: result
                }]
            })
        }
    };

    $(function () {
        chart03.init();
    })

</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>CHART03 Page</h3>
        <div class="row">
            <div class="col-sm-4" id="c1">

            </div>
            <div class="col-sm-4" id="c2">

            </div>
            <div class="col-sm-4" id="c3">

            </div>
        </div>
    </div>
</div>
