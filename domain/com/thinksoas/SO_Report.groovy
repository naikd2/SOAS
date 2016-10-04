package com.thinksoas

class SO_Report {

	StudentOutcome outcome

    static  hasMany = [criteria: PerformanceCriteria]

    static constraints = {
    }

    String toString() {
        "$outcome"
    }
}
