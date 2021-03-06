package com.thinksoas.data

import com.thinksoas.system.*

class Message {

    User user
    Class inClass
    MessageType type
    String description

    static belongsTo = [user: User]

    Message(Class inClass) {
        this()
        this.inClass = inClass
    }

    Message(Class inClass, MessageType type) {
        this()
        this.inClass = inClass
        this.type = type
    }

    Message(User user, Class inClass, MessageType type) {
        this()
        this.user = user
        this.inClass = inClass
        this.type = type
    }
}
