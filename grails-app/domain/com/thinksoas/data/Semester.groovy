package com.thinksoas.data

class Semester {

    String year
    String term
    String startDate
    String endDate
    Boolean active

    Semester(String year, String term, Date startDate, Date endDate) {
        this.year = year
        this.term = term
        this.startDate = startDate
        this.endDate = endDate
    }

    static constraints = {
        year(blank:false)
        term(blank:false)
    }

    String toString() {
        "$year - $term"
    }
}
