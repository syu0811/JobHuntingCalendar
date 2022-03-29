window.insertEvent = function(year, month, day, title, hour, minute, url) {
  if(minute < 10)
    minute = "0" + minute;
  
  if(url == ""){
    events.push({'Date': new Date(year, month - 1, day), 'Title': hour + ":" + minute + " " + title});
  } else {
    events.push({'Date': new Date(year, month - 1, day), 'Title': hour + ":" + minute + " " + title, 'Link': url});
  }
}

window.calendarDraw = function() {
  events = [];
  var element = $('#events').data('events');
  for(var i = 0; i < element.length; i++){
    insertEvent(element[i].year, element[i].month, element[i].day, element[i].title, element[i].hour, element[i].minute ,element[i].url);
  }
  var settings = {};
  var element = document.getElementById('calendar');
  calendar(element, events, settings);
}