package com.thinksoas.report.improvement

import com.thinksoas.data.Class
import com.thinksoas.data.Course
import com.thinksoas.data.StudentOutcome
import com.thinksoas.data.CourseObjective
import com.thinksoas.report.course.CourseReport
import com.thinksoas.report.course.CourseReportOutcome
import com.thinksoas.report.course.CourseReportMethod
import com.thinksoas.report.course.CourseReportOutcome
import com.thinksoas.report.outcome.OutcomeReport
import com.thinksoas.report.outcome.OutcomeReportCriteria
import grails.transaction.Transactional

import java.util.Map.Entry

@Transactional
class ImprovementReportService {

//    def test() {
//        println("test")
//    }

    @Transactional
    def calculate() {
        println("Calculating.....")

        List<OutcomeReport> plans = OutcomeReport.findAll()
        for (OutcomeReport plan : plans) {
            StudentOutcome outcome = plan.outcome
            println("For Student Outcome: " + outcome.prefix)
            ImprovementReport improvementReport = ImprovementReport.findByOutcome(outcome)

            for (OutcomeReportCriteria criteria : plan.criteria) {

                CourseObjective courseObjective = criteria.objective
                println("Criteria: " + courseObjective)
                Course course = courseObjective.course
                println("Where Collected: " + course)
                List<Class> sections = Class.findAllByCourse(course)

                ImprovementReportCourse releventImprovementCourse = null;
                for (ImprovementReportCourse impCourse : improvementReport.courses) {
                    if (impCourse.courseObjective == courseObjective) {
                        releventImprovementCourse = impCourse
                    }
                }

                Map<String, ValueNode> data = new HashMap<>()

                if (releventImprovementCourse != null) {
                    println(" rel " + releventImprovementCourse)
                    getValuesFromAllSections(sections, data, outcome, courseObjective)
                    setValuesToImprovementReport(data, releventImprovementCourse, courseObjective)
                }
            }
            println("  ")
            improvementReport.save(flush: true)
        }
    }

    def getValuesFromAllSections(List<Class> sections, Map<String, ValueNode> data, StudentOutcome outcome, CourseObjective courseObjective) {
        for (Class section : sections) {
            CourseReport courseReport = CourseReport.findBySection(section)
            BigDecimal students = section.students

            List<CourseReportOutcome> reportOutcomes = []
            println("Gathering info for: " + section)
            println("Number of students: " + students)

            courseReport.objectives.forEach({rObj -> reportOutcomes.addAll(rObj.outcomes)})
            reportOutcomes = reportOutcomes.stream().filter({out -> out.outcome == outcome}).collect(java.util.stream.Collectors.toList())
            reportOutcomes = reportOutcomes.stream().filter({out -> out.objective.objective == courseObjective}).collect(java.util.stream.Collectors.toList())

            for (CourseReportOutcome o : reportOutcomes) {
                println("outcomes: " + o)

                for(CourseReportMethod method : o.methods) {
                    BigDecimal percentage = method.percentage
                    String key = method.method.concat(courseObjective.prefix)
                    println("key: " + key)
                    println("percentage: " + percentage)

                    ValueNode node = data.get(key)
                    if (node == null) {
                        node = new ValueNode()
                    }

                    BigDecimal rawScore = node.getRawScore()
                    BigDecimal totalStudents = node.getTotalStudents()

                    rawScore += percentage.multiply(students)
                    totalStudents += students

                    node.setRawScore(rawScore)
                    node.setTotalStudents(totalStudents)

                    data.put(key, node)
                    println("rawScore: " + rawScore)
                    println("totalStudents: " + totalStudents)
                }
            }
        }
    }

    def setValuesToImprovementReport(Map<String, ValueNode> data, ImprovementReportCourse releventImprovementCourse, CourseObjective courseObjective) {
        List<ImprovementReportMethod> methods = ImprovementReportMethod.findAllByReportCourse(releventImprovementCourse)

        for (Entry<String, ValueNode> e : data.entrySet()) {
            for (ImprovementReportMethod method : methods) {
                if (method != null) {
                    println("key compare: " + method.method.concat(courseObjective.prefix))
                    println("map compare: " + e.key)

                    if (method.method.concat(courseObjective.prefix).equals(e.key)) {
                        println("nice!!!!!!!!!")

                        BigDecimal rawScore = e.value.getRawScore()
                        BigDecimal totalStudents = e.value.getTotalStudents()
                        method.percentage = rawScore / totalStudents
                        println("avg: " + method)
                    }
                }
            }
        }
    }

    class ValueNode {

        private BigDecimal rawScore
        private BigDecimal totalStudents

        public ValueNode() {
            this.rawScore = BigDecimal.ZERO
            this.totalStudents = BigDecimal.ZERO
        }

        BigDecimal getRawScore() {
            return rawScore
        }

        void setRawScore(BigDecimal rawScore) {
            this.rawScore = rawScore
        }

        BigDecimal getTotalStudents() {
            return totalStudents
        }

        void setTotalStudents(BigDecimal totalStudents) {
            this.totalStudents = totalStudents
        }

    }

}
