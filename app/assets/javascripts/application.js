//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar

$(document).ready(function() {

    $('#calendar').fullCalendar({
      events: '/services.json',
      defaultView: 'agendaDay',
    })

});
