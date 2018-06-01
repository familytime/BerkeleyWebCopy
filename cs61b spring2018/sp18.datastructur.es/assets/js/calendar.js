/*
 * Lots of credit to CS 61A - cs61a.org
 */
var startDate = '2018-01-18', endDate = '2018-05-11';

// Show the current week during the semester and the first week of class otherwise.
function calendarStartDate() {
    if (moment().isBefore(moment(endDate)) && moment().isAfter(moment(startDate))) {
        return moment();
    }
    return startDate;
}

var transform = function(event) {
    event.url = null;
    return event;
};

var render = function(event, element, view) {
    var eventStr = "";
    if (typeof event.location != "undefined") {
        eventStr = "@ " + event.location;
    }
    element.append($('<div class="fc-content">').html(eventStr));
    if (event.title.includes('Lecture')) {
        element.addClass('lecture-event');
    }
    if (event.title.includes('prep') || event.title.toLowerCase().includes('conceptual')) {
        element.addClass('special-disc-event');
    }
    if (event.title.includes('Josh Hug')) {
        element.addClass('hug-event');
    }
};

var afterRender = function(event, element, view) {
    var eventStr = "";
    if (typeof event.description != "undefined") {
        eventStr = event.title + "<br>" + event.description.split("\n").join("<br>");
    } else if (typeof event.location != "undefined") {
        eventStr = event.title + " @ " + event.location;
    }
    $(element).qtip({
        content: {
            text: eventStr,
        },
        position: {
            target: 'mouse',
            adjust: {mouse: false},
        },
        show: {
            solo: true,
            effect: function() {
                $(this).slideDown("fast");
            }
        },
        hide: {
            effect: function() {
                $(this).slideUp("fast");
            }
        },
        style: {
            classes: 'qtip-light',
        }
    });
};

function launchCal(lab_disc_url, oh_url) {
  return function() {
    $('#lab_disc').fullCalendar({
        allDaySlot: false,
        defaultView: 'agendaWeek',
        hiddenDays: [6, 7],
        slotEventOverlap: false,
        height: 'auto',
        minTime: "09:00:00",
        maxTime: "21:00:00",
        defaultDate: calendarStartDate(),
        eventDataTransform: transform,
        eventRender: render,
        eventAfterRender: afterRender,
        googleCalendarApiKey: 'AIzaSyDgOiy-PbgwzyEA9hUVQVayKMHQcDqFhXw',
        eventSources: [
            {
                googleCalendarId: lab_disc_url,
                cache: true,
            },
        ]
    });
    $('#oh').fullCalendar({
        allDaySlot: false,
        defaultView: 'agendaWeek',
        slotEventOverlap: false,
        height: 'auto',
        minTime: "09:00:00",
        maxTime: "21:00:00",
        defaultDate: calendarStartDate(),
        eventDataTransform: transform,
        eventRender: render,
        eventAfterRender: afterRender,
        googleCalendarApiKey: 'AIzaSyDgOiy-PbgwzyEA9hUVQVayKMHQcDqFhXw',
        eventSources: [
            {
                googleCalendarId: oh_url,
                cache: true,
            },
        ]
    });
  };
}

