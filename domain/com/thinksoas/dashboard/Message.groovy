package com.thinksoas.dashboard

import com.thinksoas.Class
import com.thinksoas.User

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
