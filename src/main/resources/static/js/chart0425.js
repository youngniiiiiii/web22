let chart01 = {
    init: function () {
        Highcharts.chart('container', {
            chart: {
                type: 'spline'
            },
            title: {
                text: 'Monthly Average Temperature'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                    'target="_blank">Wikipedia.com</a>'
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                accessibility: {
                    description: 'Months of the year'
                }
            },
            yAxis: {
                title: {
                    text: 'Temperature'
                },
                labels: {
                    formatter: function () {
                        return this.value + '°';
                    }
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            series: [{
                name: 'Tokyo',
                marker: {
                    symbol: 'square'
                },
                data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 26.0, 22.8, 17.5, 12.1, 7.6]

            }, {
                name: 'Bergen',
                marker: {
                    symbol: 'diamond'
                },
                data: [1.0, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
            }, {
                name: 'Korea',
                marker: {
                    symbol: 'diamond'
                },
                data: [2.0, 3.6, 4.3, 5.9, 11.5, 14.5, 15.5, 15.4, 12.5, 9.7, 6.7, 4.6]
            }
            ]
        });

    }
}

let chart02 = {
    init: function () {
        $('#chart02 > button').on('click', () => {
            chart02.getdata();
        });
        setInterval(chart02.getdata, 5000);
    },
    getdata: function () {
        $.ajax({
            url: '/chart02',
            success: function (result) {
                chart02.display(result);
            }
        });
    },
    display: function (result) {
        Highcharts.chart('container', {
            chart: {
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 10,
                    beta: 25,
                    depth: 70
                }
            },
            title: {
                text: 'External trade in goods by country, Norway 2021',
                align: 'left'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                    'target="_blank">SSB</a>',
                align: 'left'
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            xAxis: {
                categories: result.category,
                labels: {
                    skew3d: true,
                    style: {
                        fontSize: '16px'
                    }
                }
            },
            yAxis: {
                title: {
                    text: 'NOK (million)',
                    margin: 20
                }
            },
            tooltip: {
                valueSuffix: ' MNOK'
            },
            series: [{
                name: 'Total imports',
                data: result.datas
            }]
        });

    }
};