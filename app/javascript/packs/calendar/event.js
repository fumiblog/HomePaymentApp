//インストールしたファイルたちを呼び出します。
import { Calendar, groupIntersectingEntries } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import googleCalendarPlugin from '@fullcalendar/google-calendar'
import timeGridWeekPlugin from '@fullcalendar/timegrid'
import timeGridDayPlugin from '@fullcalendar/timegrid'
// import listPlugin from '@fullcalendar/list'

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function () {
  var calendarEl = document.getElementById('calendar');

  //カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
  var calendar = new Calendar(calendarEl, {
    plugins: [monthGridPlugin, interactionPlugin, googleCalendarPlugin, timeGridWeekPlugin, timeGridDayPlugin],
    initialView: 'listMonth',
    googleCalendarApiKey: 'AIzaSyBFC7aes19eGHNXbM0BtXZkx7s2REUQ4S0',


    eventSources: [
      {
        googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
        className: 'event_holiday'
      },
      {
        googleCalendarId: 'g-calendar@group.calendar.google.com',
      }],

    events: "/users/homes/index.json",

    // events: [
    //   {
    //     title: 'event1',
    //     start: '2021-08-12'
    //   }
    // ],



    //細かな表示設定
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    headerToolbar: {
      start: 'prev,next today',
      center: 'title',
      end: 'dayGridMonth timeGridWeek timeGridDay'
      // end: 'dayGridMonth,timeGridWeek,timeGridDay,list'
    },

    expandRows: true,
    navLinks: true,
    weekends: true,
    selectable: true,
    // eventLimit: true,
    // editable: true,
    // slotEventOverlap: true,
    // selectable: true,
    // selectHelper: true,
    // businessHours: true,
    businessHours: {
      daysOfWeek: [1, 2, 3, 4, 5],
      days: ['2021-09-04']
    },
    stickyHeaderDates: true,
    buttonText: {
      today: '今日',
      month: '月',
      week: '週',
      day: '日',
    },
    allDayText: '終日',
    height: "auto",


    dateClick: function (info) {
      //日付をクリックしたときのイベント(詳しくは次回の記事へ)
      // alert('日付です');
    },
    eventClick: function (info) {
      //表示されたイベントをクリックしたときのイベント(詳しくは次回の記事へ)
      // alert(gon.user_name + 'さんのスケジュールです。');

      // alert(calendar.getEventById());
      alert(calendar.getEvents());
    },
    eventClassNames: function (arg) {
      //表示されたイベントにclassをcss用に追加する(詳しくは次回の記事へ)
    },

  });
  //カレンダー表示
  calendar.render();

});
