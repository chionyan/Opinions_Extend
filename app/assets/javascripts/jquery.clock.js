/*global $*/
// JavaScript Document

$(function(){
	'use strict';
  
	// 定数　（月・曜日の配列）
	var MONTH = {
				full: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				short: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			},
			DAY = {
				full: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
				short: ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'],
				ja: ['日', '月', '火', '水', '木', '金', '土']
			};

	// 表示中時刻
	var nowCurrent;

	// 毎秒ごとに時刻を取得し表示
	setInterval( clock, 100 );

	// 日付＆時間の出力関数
	function clock(){
		// 現在時間の取得
		var now = new Date();

		if ( now.getSeconds() !== nowCurrent ) {
			// 表示中時刻の更新
			nowCurrent = now.getSeconds();

			// 各値の取得
			now = {
				'full': now,
				'year': now.getFullYear(),
				'month': MONTH.short[now.getMonth()],
				'month-full': MONTH.full[now.getMonth()],
				'month-num': now.getMonth() + 1,
				'month-num-full': ( now.getMonth() + 1 < 10 ) ? '0' + ( now.getMonth() + 1 ) : now.getMonth() + 1,
				'date': now.getDate(),
				'date-full': ( now.getDate() < 10 ) ? '0' + now.getDate() : now.getDate(),
				'day': DAY.short[now.getDay()],
				'day-full': DAY.full[now.getDay()],
				'day-ja': DAY.ja[now.getDay()],
				'hour': ( now.getHours() < 10 ) ? '0' + now.getHours() : now.getHours(),
				'minute': ( now.getMinutes() < 10 ) ? '0' + now.getMinutes() : now.getMinutes(),
				'second': ( now.getSeconds() < 10 ) ? '0' + now.getSeconds() : now.getSeconds()
			};
		
		var tgtFull = new Date($('.deadline').data('deadline'));

    var SECOND_MILLISECOND = 1000,
        MINUTE_MILLISECOND = 60 * SECOND_MILLISECOND,
        HOUR_MILLISECOND = 60 * MINUTE_MILLISECOND,
        DAY_MILLISECOND = 24 * HOUR_MILLISECOND,
        WEEK_MILLISECOND = 7 * DAY_MILLISECOND,
        YEAR_MILLISECOND = 365 * DAY_MILLISECOND;
    
    var dayDistance = function (src, dst) {
        var deltaMillsecond = dst.getTime() - src.getTime();
        return parseInt(deltaMillsecond / DAY_MILLISECOND);
    },   
    hourDistance = function (src, dst) {
        var deltaMillsecond = dst.getTime() - src.getTime() - dayDistance(src,dst) * DAY_MILLISECOND;
        return parseInt(deltaMillsecond / HOUR_MILLISECOND);
    },
    minuteDistance = function (src, dst) {
        var deltaMillsecond = dst.getTime() - src.getTime() - dayDistance(src,dst) * DAY_MILLISECOND - hourDistance(src,dst) * HOUR_MILLISECOND;
        return parseInt(deltaMillsecond / MINUTE_MILLISECOND);
    },
    secondDistance = function (src, dst) {
        var deltaMillsecond = dst.getTime() - src.getTime() - dayDistance(src,dst) * DAY_MILLISECOND - hourDistance(src,dst) * HOUR_MILLISECOND - minuteDistance(src,dst) * MINUTE_MILLISECOND;
        return parseInt(deltaMillsecond / SECOND_MILLISECOND);
    };

  	var diff_Date = dayDistance(now['full'],tgtFull);
		var diff_hour = hourDistance(now['full'],tgtFull);
		var diff_min = minuteDistance(now['full'],tgtFull);
		var diff_sec = secondDistance(now['full'],tgtFull);
    
    if (diff_Date == 0 && diff_hour == 0 && diff_min == 0 && diff_sec == 0) {
      $(".deadline").html("回答期限終了");
    } else {
    	console.log(diff_sec);
      $(".deadline").html("残り" + diff_Date + "日" + diff_hour + "時間" + diff_min + "分" + diff_sec + "秒");
    }
  
		}
	}
    
});