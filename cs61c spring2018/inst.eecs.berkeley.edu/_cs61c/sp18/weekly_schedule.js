/* This builds the weekly schedule on the front page.
 * It is based of the FullCalendar plugin and connects to bCal.
 * There are custom functions defined to modify event titles, URLs,
 * and descriptions.
 *
 * Docs: https://fullcalendar.io/docs/
 */

// Most events have CS61C or 61C in the title, but this is redundant
var editTitle = function(t) {
      return t.replace(/(CS)?61C\s*/gi, '');
}

var getRoomURL = function(loc) {
    if (!loc) { return ''; }
   
    if (loc.match(/Soda/gi)) {
        var start = 'https://people.eecs.berkeley.edu/~sequin/soda/',
            end = '.rect.html';
        if (loc.match(/2\d\d/)) {
            return start + 'f2' + end;
        } else if (loc.match(/3\d\d/)) {
            return start + 'f3' + end;
        } else if (loc.match(/4\d\d/)) {
            return start + 'f4' + end;
        } else if (loc.match(/6\d\d/)) {
            return start + 'f6' + end;
        }
    }

    return "https://www.berkeley.edu/map";
}

// Use this to modify the data fullcalendar gets from google
var fullCalTransorm = function(event) {
    event.url = getRoomURL(event.location);
    event.title = editTitle(event.title);
    return event;
};

// This changes the display of each event
// It modifies links to open in a new window and adds descriptions
// and locations to the event text
var fullCalRender = function(event, element, view) {
    var content = '';

    if (event.location) {
        content += event.location;
        element.attr({'target':'_blank'}); // open links in a new window
    } else {
        element.attr({'href': '#sched'});
    }
    if (event.description) {
        content += ' &ndash; ' + event.description;
    }
    element.append($('<div class="fc-content">').html(content));
    return element;
};


// This shows "today" while the semester is in progress
// Defaults to the first week of class before or after the semester.
function calendarStartDate() {
    if (moment().isBefore(moment('2018-05-03')) && moment().isAfter(moment('2018-01-16'))) {
        return moment();
    }
    return '2018-01-16';
}


function daysUntil(from, to) {
    var MS_DAY = 1000*60*60*24;
    return Math.floor((from - (to || moment())) / MS_DAY);
}

// These are exam dates and will show the weekend slots on the calendar
// if a review session is coming up.
var mt1 = daysUntil(moment('2018-02-13')),
    mt2 = daysUntil(moment('2018-03-20')),
    fin = daysUntil(moment('2018-05-11'));

function inRange(num) { return num <= 9 && num > -1; }


$(document).ready(function() {
    // show weekends when we are close to at least one review session.
    var wkds = (inRange(mt1) || inRange(mt2) || inRange(fin));

    $('#week-cal').fullCalendar({
        slotDuration: "1:00:00",
        allDaySlot: false,
        defaultView: 'agendaWeek',
        titleFormat: '[Weekly Schedule]',
        weekends: wkds,
        minTime: "08:00:00",
        maxTime: "22:00:00",
        defaultDate: calendarStartDate(),
        header : {
              left:   'title',
              center: 'month, agendaWeek, agendaDay',
              right:  'today prev,next'
        },
        height: "auto",
        nowIndicator: true,
        // To make your own Google API key, follow the directions here:
        // http://fullcalendar.io/docs/google_calendar/
        // googleCalendarApiKey: 'AIzaSyDvH9GPbZrEbWEx4rB1-A6pf6zHZXNlkRY',
        googleCalendarApiKey: 'AIzaSyD-UMXCYQe950FPhDWCH13cOiTfieRjgBo',
        eventDataTransform: fullCalTransorm,
        eventRender: fullCalRender,
        eventSources: [
            // {
            //     googleCalendarId: 'berkeley.edu_3jkd6e3vcpt8qllp5943f58q34@group.calendar.google.com',
            //     cache: true,
            //     className: '61c-lec',
            //     color: '#59bfb3'
            // },
            {
                googleCalendarId: 'berkeley.edu_5oac4jec7ts1j86qid3tvn2634@group.calendar.google.com',
                cache: true,
                className: '61c-lec'
            },
            {
                googleCalendarId: 'berkeley.edu_7ikgbrr34kh5o2cuh1qv90scks@group.calendar.google.com',
                cache: true,
                className: '61c-labs',
                color: '#e67399'
            },
            {
                googleCalendarId: 'berkeley.edu_3c4o8hhme6ktu17qndu7677p8s@group.calendar.google.com',
                cache: true,
                className: '61c-disc',
                color: '#4cb052'
            },
            // {
            //     googleCalendarId: 'berkeley.edu_q5delv7sk4p0hnvs6sbp0aclc4@group.calendar.google.com',
            //     cache: true,
            //     className: '61c-events',
            //     color: '#f2a640'
            // },
            {
                googleCalendarId: 'berkeley.edu_pdpk2lhqhlfiblt5hqaov0rfn4@group.calendar.google.com',
                cache: true,
                className: '61c-oh',
                color: '#b373b3'
            }
        ],
    });
});
