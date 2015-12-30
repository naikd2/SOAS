import com.thinksoas.Programs
import com.thinksoas.Course
import com.thinksoas.StudentOutcome
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_programsshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/programs/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',9,['var':("entityName"),'value':(message(code: 'programs.label', default: 'Programs'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',10,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('set','g',13,['var':("currentProgram"),'value':(programsInstance.id),'scope':("session")],-1)
printHtmlPart(4)
expressionOut.print(createLink(controller:'Programs', action:'index'))
printHtmlPart(5)
createTagBody(2, {->
invokeTag('message','g',20,['code':("program.button.edit.label"),'default':("Edit Program")],-1)
})
invokeTag('link','g',20,['class':("edit"),'action':("edit"),'resource':(programsInstance)],2)
printHtmlPart(6)
createTagBody(2, {->
invokeTag('message','g',21,['code':("program.button.delete.label"),'default':("Delete Program")],-1)
printHtmlPart(7)
})
invokeTag('link','g',21,['controller':("programs"),'action':("delete"),'params':([id:programsInstance.id]),'onclick':("return confirm('${message(code: 'programs.button.delete.confirm.message', default: 'Are you sure? Deleting this program will delete all of its courses and outcomes')}');")],2)
printHtmlPart(8)
expressionOut.print(createLink(controller:'Course', action:'index'))
printHtmlPart(9)
expressionOut.print(createLink(controller:'Course', action:'create'))
printHtmlPart(10)
expressionOut.print(createLink(controller:'studentOutcome', action:'index'))
printHtmlPart(11)
expressionOut.print(createLink(controller:'studentOutcome', action:'create'))
printHtmlPart(12)
expressionOut.print(programsInstance.programName)
printHtmlPart(13)
invokeTag('sortableColumn','g',47,['property':("programCourses"),'title':(message(code: 'programs.courses.label', default: 'Course Name'))],-1)
printHtmlPart(14)
invokeTag('set','g',51,['var':("courseList"),'value':(Course.getAll())],-1)
printHtmlPart(15)
loop:{
int i = 0
for( course in (courseList) ) {
printHtmlPart(16)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(17)
if(true && (course.program =~ session.currentProgram)) {
printHtmlPart(18)
expressionOut.print(createLink(controller:'Course', action:'show', params:[id:course.id]))
printHtmlPart(19)
expressionOut.print(fieldValue(bean: course, field: "name"))
printHtmlPart(20)
}
printHtmlPart(21)
i++
}
}
printHtmlPart(22)
invokeTag('paginate','g',62,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(23)
invokeTag('sortableColumn','g',72,['property':("prefix"),'title':(message(code: 'studentOutcome.prefix.label', default: 'Prefix'))],-1)
printHtmlPart(24)
invokeTag('sortableColumn','g',73,['property':("description"),'title':(message(code: 'studentOutcome.description.label', default: 'Description'))],-1)
printHtmlPart(25)
invokeTag('set','g',77,['var':("studentOutcomeList"),'value':(StudentOutcome.getAll())],-1)
printHtmlPart(26)
loop:{
int i = 0
for( studentOutcome in (studentOutcomeList) ) {
printHtmlPart(27)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(28)
if(true && (studentOutcome.program =~ session.currentProgram)) {
printHtmlPart(29)
createTagBody(4, {->
expressionOut.print(fieldValue(bean: studentOutcome, field: "prefix"))
})
invokeTag('link','g',81,['action':("edit"),'id':(studentOutcome.id)],4)
printHtmlPart(30)
expressionOut.print(fieldValue(bean: studentOutcome, field: "description"))
printHtmlPart(31)
}
printHtmlPart(32)
i++
}
}
printHtmlPart(33)
invokeTag('paginate','g',89,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(34)
})
invokeTag('captureBody','sitemesh',96,[:],1)
printHtmlPart(35)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451506541000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
