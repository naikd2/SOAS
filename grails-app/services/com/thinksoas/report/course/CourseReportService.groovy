package com.thinksoas.report.course

import com.thinksoas.data.StudentOutcome

class CourseReportService {

    def findAllReleventOutcomes(long reportId) {
        def report = CourseReport.findById(reportId)
        def result = [] as Set
        for (CourseReportObjective obj : report.objectives) {
            for (CourseReportOutcome out : obj.outcomes) {
                result.add(out.outcome)
            }
        }
        return result
    }

    def getReportOutcomeBySO(long soId, long reportObjId) {
        def courseReportObjective = CourseReportObjective.findById(reportObjId)

        for (CourseReportOutcome rOutcome : courseReportObjective.outcomes) {
            if (rOutcome.outcome.id.equals(soId)) {
                return rOutcome
            }
        }
    }
}
