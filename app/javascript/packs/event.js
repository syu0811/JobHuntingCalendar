window.onload = function() {
  var events = [
    {'Date': new Date(2022, 2, 7), 'Title': '資格取得セミナー午後2時からセンタービル'},
    {'Date': new Date(2022, 2, 18), 'Title': '●●イベント開催', 'Link': 'https://yahoo.co.jp/'},
    {'Date': new Date(2022, 2, 27), 'Title': '〇〇企画創業20周年記念', 'Link': 'https://www.google.com/'},
  ];

  var settings = {};
  var element = document.getElementById('calendar');
  calendar(element, events, settings);
}