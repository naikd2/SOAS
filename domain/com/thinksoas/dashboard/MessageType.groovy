package com.thinksoas.dashboard

enum MessageType {

    INPUT('input', 'Need to input field'),
    ALERT('alert', 'Please address the alert'),

    final String id;
    final String desc;
    static final Map map


    static {
        map = [:] as TreeMap
        values().each{ m ->
            println "id: " + m.id + ", desc:" + m.desc
            map.put(m.id, m)
        }
    }

    private MessageType(String id, String desc) {
        this.id = id;
        this.desc = desc;
    }

    static getMessageType( id ) {
        map[id]
    }

}





