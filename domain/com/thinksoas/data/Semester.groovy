package com.thinksoas.data

class Semester {

    String year
    String term
    Boolean active

    static constraints = {
        year(blank:false)
        term(blank:false)
    }

    String toString() {
        "$year - $term"
    }
}
