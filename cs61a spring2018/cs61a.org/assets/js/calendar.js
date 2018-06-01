/**
 * Displays the office hours and weekly calendars using
 * FullCalendar with Google Calendars integration.
 **/

var apiKey = 'AIzaSyAbN4DIP_IV6h1QbPYl1soK0-kuy45pjYw';

// Change event url to null.
var transform = function(event) {
    event.url = null;
    return event;
}

// Add location to event display.
var render = function(event, element, view) {
    element.append($('<div class="fc-location">').html(event.location));
    return element;
}

// Show the current week during the semester and the first week of class otherwise.
function calendarStartDate() {
    if (moment().isBefore(moment(endDate)) && moment().isAfter(moment(startDate))) {
        return moment();
    }
    return startDate;
}

$(document).ready(function() {
    $('#office-hours').fullCalendar({
        eventDataTransform: transform,
        eventRender: render,
        defaultView: $(window).width() >= 768 ? 'agendaWeek' : 'agendaDay',
        allDaySlot: false,
        slotEventOverlap: false,
        hiddenDays: [],
        height: "auto",
        minTime: "09:00:00",
        maxTime: "21:00:00",
        defaultDate: calendarStartDate(),
        googleCalendarApiKey: apiKey,
        eventSources: [
            {
                googleCalendarId: officeHoursCalendarId,
                cache: true,
                color: '#0072c1'
            },
            {
                googleCalendarId: instructorOfficeHoursCalendarId,
                cache: true,
                color: '#c1d6e3',
                textColor: '#000'
            },
        ]
    });

    $('#weekly').fullCalendar({
        eventDataTransform: transform,
        eventRender: render,
        defaultView: $(window).width() >= 768 ? 'agendaWeek' : 'agendaDay',
        allDaySlot: false,
        slotEventOverlap: false,
        weekends: true,
        height: "auto",
        minTime: "09:00:00",
        maxTime: "19:00:00",
        defaultDate: calendarStartDate(),
        googleCalendarApiKey: apiKey,
        eventSources: [
            {
                googleCalendarId: sectionsCalendarId,
                cache: true,
                color: '#0072c1'
            },
            {
                googleCalendarId: lecturesCalendarId,
                cache: true,
                color: '#c1d6e3',
                textColor: '#000'
            },
        ]
    });
});
