package com.thinksoas

import grails.transaction.Transactional

@Transactional
class MessageService {

    def springSecurityService


//    def getUserMessages() {
//        def userId = springSecurityService.getCurrentUserId();
//        def messageList = Message.findAllByUser(User.findById(userId))
//        return messageList
//    }
//
//    def createMessagesForClassReport(Long classId, User user) {
//        createMessageInput_MinGrade(classId, user)
//        createMessageInput_MaxGrade(classId, user)
//        createMessageInput_Instrument(classId, user)
//    }
//
//    Message createMessageInput_MinGrade(Long classId, User user) {
//        def clazz = Class.findById(classId)
//        def message = new Message(user, clazz, MessageType.COURSE_REPORT_MIN_INPUT)
//        String description =  MessageType.COURSE_REPORT_MIN_INPUT.desc + clazz.toString()
//        message.setDescription(description)
//
//        def result = message.save()
//        return result
//    }
//
//    Message createMessageInput_MaxGrade(Long classId, User user) {
//        def clazz = Class.findById(classId)
//        def message = new Message(user, clazz, MessageType.COURSE_REPORT_MAX_INPUT)
//        String description = MessageType.COURSE_REPORT_MAX_INPUT.desc + clazz.toString()
//        message.setDescription(description)
//        def result = message.save()
//        return result
//    }
//
//    Message createMessageInput_Instrument(Long classId, User user) {
//        def clazz = Class.findById(classId)
//        def message = new Message(user, clazz, MessageType.COURSE_REPORT_INSTRUMENT_INPUT)
//        String description = MessageType.COURSE_REPORT_INSTRUMENT_INPUT.desc + clazz.toString()
//        message.setDescription(description)
//
//        def result = message.save()
//        return result
//    }
//
//    def updateMessagesForClassReport(CourseReportDetail detail) {
//
//        def clazz = detail.getReport().getSection()
//        def details = detail.getReport().getDetails()
//        boolean b1 = details.stream().noneMatch({x -> x.getMax().equals(BigDecimal.ZERO)})
//        if(b1) {
//            def message = Message.findByInClassAndType(clazz, MessageType.COURSE_REPORT_MAX_INPUT)
//            if (!message.is(null)) {
//                message.delete()
//            }
//        }
//        boolean b2 = details.stream().noneMatch({x -> x.getMin().equals(BigDecimal.ZERO)})
//        if(b2) {
//            def message = Message.findByInClassAndType(clazz, MessageType.COURSE_REPORT_MIN_INPUT)
//            if (!message.is(null)) {
//                message.delete()
//            }
//        }
//        boolean b3 = details.stream().noneMatch({x -> x.getInstrument().equals("")})
//        if(b3) {
//            def message = Message.findByInClassAndType(clazz, MessageType.COURSE_REPORT_INSTRUMENT_INPUT)
//            if (!message.is(null)) {
//                message.delete()
//            }
//        }
//    }

}
