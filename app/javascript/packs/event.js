window.insertEvent = function(year, month, day, title, url) {
  events.push({'Date': new Date(year, month - 1, day), 'Title': title, 'Link': url})
}

window.calendarDraw = function() {
  events = [];
  var element = $('#events').data('events');
  console.log(element);
  for(var i = 0; i < element.length; i++){
    insertEvent(element[i].year, element[i].month, element[i].day, element[i].title, element[i].url)
  }
  var settings = {};
  var element = document.getElementById('calendar');
  calendar(element, events, settings);
}