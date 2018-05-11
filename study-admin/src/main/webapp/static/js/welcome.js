/**
 * Created by lansha on 2016/10/7.
 */

var SchedulePreviewGrid = DataGridClass.extend({

    init: function (opt) {
        var columns = [
            {
                field: 'createTime',
                title: '日期',
                align: 'center',
                width: 60,
                formatter: function (value) {
                    var time1 = new Date(value);
                    return time1.Format("MM-dd");
                }
            },
            {
                field: 'scheduleNo',
                title: '计划单编号',
                //width: '16%'
            },
            {
                field: 'scheduleName',
                title: '计划单名称',
                //width: '50%'
            }, {
                field: 'trafficType',
                title: '投放方式',
                align: 'center',
                //width: '6%',
                formatter: function (value) {
                    if (value == 1) {
                        return "无限量";
                    } else if (value == 2) {
                        return "总共投 ";
                    } else {
                        return "按天投";
                    }
                }
            }, {
                field: 'totalTraffic',
                title: '投放总量',
                width: 90,
                halign: 'center',
                align: 'right'
            }, {
                field: 'sendAmount',
                title: '曝光量',
                width: 90,
                halign: 'center',
                align: 'right'
            }];
        this._super(columns, opt);
    },
    urls: {
        data_list: 'schedule.html'
    }
});

var dspChart, dspOption;
$(function () {

    var opt = {
        idField: 'Id',
        showOperate: false,
        showColumns: false,
        pagination: false,
        paginationLoop: false,
        pageSize: 6,
        sortable: false,
        showFooter: false,
        search: false
    };

    var dataGrid = new SchedulePreviewGrid(opt);
    dataGrid.createGrid("#scheduleTable");
    // //去除指定列
    // dataGrid.hideColumn("operate");
    // setInterval(function(){
    //     dataGrid.refresh();
    // },20000);


    // 基于准备好的dom，初始化echarts实例
    //dspChart = echarts.init(document.getElementById('statChart'));
    /*dspChart.showLoading({
        text: 'loading',
        color: '#c23531',
        textColor: '#000',
        maskColor: 'rgba(255, 255, 255, 0.8)',
        zlevel: 0
    });*/
    dspOption = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['开机广告', '屏保广告', '应用启动广告', '视频时间轴', '关机广告'],
            bottom: 10
        },
        grid: {
            borderWidth: 0,
            top: 30,
            left: 60,
            right: 20
        },
        toolbox: {
            feature: {
                saveAsImage: {
                    show: false
                }
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            axisLine: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisTick: {
                show: false,
                interval: 0,
                alignWithLabel: true
            },
            //data: ['0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00']
            data: ['0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00'],

        },
        yAxis: {
            type: 'value',
            axisLine: {
                show: false,
                lineStyle: {
                    width: 0
                }
            },
            axisTick: {
                show: false,
                interval: 0,
                alignWithLabel: true
            },
            axisLabel: {
                formatter: function (value) {
                    if (value > 1000) {
                        return (value / 1000) + 'k';
                    } else {
                        return value;
                    }
                }
            }
        },
        series: [
            {
                name: '关机广告',
                type: 'line',
                stack: '总量',
                data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            },
            {
                name: '视频时间轴',
                type: 'line',
                stack: '总量',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '应用启动广告',
                type: 'line',
                stack: '总量',
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: '屏保广告',
                type: 'line',
                stack: '总量',
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: '开机广告',
                type: 'line',
                stack: '总量',
                data: [820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };

    //dspChart.setOption(dspOption);
    setDspChartData();
    /*setInterval(function () {
        setDspChartData();
    }, 1000*10);*/

});

var legendData_key = {};
var series_key = {};
var showData = {};
var setDspChartData = function () {
    $api.get('getDspData.html?dataType=' + $('#selDspDate').val(), function (data) {
        //dspChart.hideLoading();
        var jsonData = JSON.parse(data);
        var series = [];
        var legendData = [];
        //var showData = {};
        $('#show-data').empty();
        for (let k in  jsonData) {
            var dname = jsonData[k].name;
            var ddata = jsonData[k].data;
            series.push({
                name: dname,
                type: 'line',
                stack: '总量',
                data: ddata
            });
            series_key[k] = {
                name: dname,
                type: 'line',
                stack: '总量',
                data: ddata
            };
            legendData.push(dname);
            legendData_key[k] = dname;
            //求广告位总数
            if (showData[k] == null) {
                showData[k] = {};
                showData[k].tit = dname;
                var nums = 0;
                ddata.forEach(function (item) {
                    nums += item;
                });
                showData[k].nums = nums;
            }
        }

        showData = sortObj(showData);
        for (let k in  showData) {
            //var el = '<li><p class="tit">' + showData[k].tit + '(PV)</p> <p class="nums">' + showData[k].nums + '</p><div style="width: 100%;height: 100%;" id="' + k + '" > </div></li>';
            var el = '<div class="col-sm-3"><div class="space_data"><p class="tit">' + showData[k].tit + '(PV)</p> <p class="nums">' + showData[k].nums + '</p><div style="width: 100%;min-height: 140px;" id="' + k + '" > </div></div></div>';
            $('#show-data').append(el);
            let dspChart_k = echarts.init(document.getElementById(k));
            dspOption.series = series_key[k];
            dspOption.legend.data = legendData_key[k];
            dspOption.grid = {
                borderWidth: 0,
                top: 15,
                left: 8,
                right: 10,
                bottom:30
            };
            dspChart_k.setOption(dspOption);
            //break;
        }
        /*dspOption.series = series;
        dspOption.legend.data = legendData;
        dspChart.setOption(dspOption);*/
    });
}


function sortObj(obj) {
    let arr = [];
    for (let i in obj) {
        arr.push([obj[i]["nums"], i, obj[i]["tit"]]);
    }
    arr.sort(function (a,b) {
        return -(a[0] - b[0]);
    });
    let len = arr.length,
        result = {};
    console.log(arr)
    for (var i = 0; i < len; i++) {
        let ss = {};
        ss["nums"] = arr[i][0];
        ss["tit"] = arr[i][2];
        result[arr[i][1]] = ss;
    }
    return result;
}