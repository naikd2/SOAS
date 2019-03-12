package com.thinksoas.data

class StudentOutcome {

    String prefix
    String description

    StudentOutcome(String prefix, String description) {
        this()
        this.prefix = prefix
        this.description = description
    }

    static constraints = {
        prefix(blank:false)
        description(blank:false)
    }

    String toString() {
        "$prefix: $description"
    }
}
