package com.thinksoas

class PerformanceCriteria {

    String prefix
    String description
    String length_of_cycle
    String whenCollected
    List<MOAssessments> assessments = []

    static  hasMany = [assessments: MOAssessments]


    static constraints = {
    }
}
