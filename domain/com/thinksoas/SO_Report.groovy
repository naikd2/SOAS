package com.thinksoas

class SO_Report {

	StudentOutcome outcome

    SO_Report(StudentOutcome outcome) {
        this()
        this.outcome = outcome
    }

    static  hasMany = [criteria: PerformanceCriteria]

    static constraints = {
    }

    String toString() {
        "$outcome"
    }
}
