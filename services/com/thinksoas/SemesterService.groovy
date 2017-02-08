package com.thinksoas

import grails.transaction.Transactional

@Transactional
class SemesterService {

    Semester changeActiveSemester(Long key) {

        def newS = Semester.findById(key)
        if (newS != null) {
            def oldS = Semester.findByActive(Boolean.TRUE)
            oldS.setActive(Boolean.FALSE)
            newS.setActive(Boolean.TRUE)
        }
    }

    Semester createSemesterHook(Long key) {
        def newS = Semester.findById(key)
        for (Semester s : Semester.list()) {
            if (s.getActive()) {
                s.setActive(Boolean.FALSE)
            }
        }
        newS.setActive(Boolean.TRUE)
    }

    Semester getActiveSemester() {
        return Semester.findByActive(Boolean.TRUE)
    }
}
