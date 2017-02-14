package com.thinksoas.dashboard

enum MessageType {

    COURSE_REPORT_MIN_INPUT('COURSE REPORT MIN', 'Need to input min grade field'),
    COURSE_REPORT_MAX_INPUT('COURSE REPORT MAX', 'Need to input max grade field'),
    COURSE_REPORT_INSTRUMENT_INPUT('COURSE REPORT INSTRUMENT', 'Need to input instrument field'),
    ALERT('alert', 'Please address the alert'),

    final String id;
    final String desc;

    private MessageType(String id, String desc) {
        this.id = id;
        this.desc = desc;
    }

}





