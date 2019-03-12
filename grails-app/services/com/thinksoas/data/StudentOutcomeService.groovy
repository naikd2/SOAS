package com.thinksoas.data

import com.thinksoas.report.outcome.*
import com.thinksoas.report.improvement.*

import grails.transaction.Transactional

@Transactional
class StudentOutcomeService {

    def createReports(StudentOutcome outcome) {
        // Create Outcome Report first - this will drive the continuous improvement reports
        def outcomeReport = new OutcomeReport(outcome: outcome)
        println("create Report")
        outcomeReport = outcomeReport.save(flush: true)
        println("save Report")
        def improveReport = new ImprovementReport(outcome: outcome)
        println("create improvement")
        println("errors " + improveReport.errors)
        improveReport = improveReport.save(flush: true)
        println("save improvement" + improveReport)
    }

}
