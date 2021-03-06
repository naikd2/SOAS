package com.thinksoas.report.outcome

import com.thinksoas.data.StudentOutcome

class OutcomeReport {

    StudentOutcome outcome
    List<OutcomeReportCriteria> criteria = []

    OutcomeReport(StudentOutcome outcome) {
        this()
        this.outcome = outcome
    }

    static hasMany = [criteria: OutcomeReportCriteria]

    static constraints = {
    }

    String toString() {
        "$outcome"
    }
}
