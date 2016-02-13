import com.thinksoas.CourseObjective
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_courseObjective_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/courseObjective/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: courseObjectiveInstance, field: 'prefix', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("courseObjective.prefix.label"),'default':("Prefix")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("prefix"),'required':(""),'value':(courseObjectiveInstance?.prefix)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: courseObjectiveInstance, field: 'description', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("courseObjective.description.label"),'default':("Description")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['name':("description"),'required':(""),'value':(courseObjectiveInstance?.description)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: courseObjectiveInstance, field: 'course', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("courseObjective.course.label"),'default':("Course")],-1)
printHtmlPart(2)
invokeTag('select','g',28,['id':("course"),'name':("course.id"),'from':(com.thinksoas.Course.list()),'optionKey':("id"),'required':(""),'value':(courseObjectiveInstance?.course?.id),'class':("many-to-one")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: courseObjectiveInstance, field: 'objOut', 'error'))
printHtmlPart(6)
invokeTag('message','g',34,['code':("courseObjective.objOut.label"),'default':("Obj Out")],-1)
printHtmlPart(7)
for( o in (courseObjectiveInstance?.objOut) ) {
printHtmlPart(8)
createTagBody(2, {->
expressionOut.print(o?.encodeAsHTML())
})
invokeTag('link','g',40,['controller':("objectiveOutcome"),'action':("show"),'id':(o.id)],2)
printHtmlPart(9)
}
printHtmlPart(10)
createTagBody(1, {->
expressionOut.print(message(code: 'default.add.label', args: [message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome')]))
})
invokeTag('link','g',43,['controller':("objectiveOutcome"),'action':("create"),'params':(['courseObjective.id': courseObjectiveInstance?.id])],1)
printHtmlPart(11)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1444758313000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
