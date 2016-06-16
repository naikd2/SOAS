package com.thinksoas

class SO_Report {

    String prefix
    List<PerformanceCriteria> criteria = []

    static  hasMany = [criteria: PerformanceCriteria]


    static constraints = {
        prefix(blank:false)
    }
}
