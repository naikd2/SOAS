import com.thinksoas.Course
import com.thinksoas.Newspaper
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_course_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/course/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
createClosureForHtmlPart(1, 1)
invokeTag('script','r',60,[:],1)
printHtmlPart(2)
expressionOut.print(hasErrors(bean: courseInstance, field: 'subject', 'error'))
printHtmlPart(3)
invokeTag('message','g',68,['code':("course.subject.label"),'default':("Subject")],-1)
printHtmlPart(4)
expressionOut.print(courseInstance?.subject)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: courseInstance, field: 'number', 'error'))
printHtmlPart(6)
invokeTag('message','g',77,['code':("course.number.label"),'default':("Number")],-1)
printHtmlPart(7)
expressionOut.print(courseInstance?.number)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: courseInstance, field: 'name', 'error'))
printHtmlPart(8)
invokeTag('message','g',86,['code':("course.name.label"),'default':("Name")],-1)
printHtmlPart(9)
expressionOut.print(courseInstance?.name)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: courseInstance, field: 'description', 'error'))
printHtmlPart(10)
invokeTag('message','g',95,['code':("course.description.label"),'default':("Description")],-1)
printHtmlPart(11)
expressionOut.print(courseInstance?.description)
printHtmlPart(12)
expressionOut.print(hasErrors(bean: courseInstance, field: 'units', 'error'))
printHtmlPart(13)
invokeTag('message','g',103,['code':("course.units.label"),'default':("Units")],-1)
printHtmlPart(14)
expressionOut.print(courseInstance?.units)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: courseInstance, field: 'offered', 'error'))
printHtmlPart(15)
invokeTag('message','g',112,['code':("course.offered.label"),'default':("Offered")],-1)
printHtmlPart(16)
expressionOut.print(courseInstance?.offered)
printHtmlPart(17)
expressionOut.print(hasErrors(bean: courseInstance, field: 'objectives', 'error'))
printHtmlPart(18)
invokeTag('message','g',122,['code':("course.objectives.label"),'default':("Objectives")],-1)
printHtmlPart(19)
loop:{
int i = 0
for( objectives in (courseInstance.objectives) ) {
printHtmlPart(20)
if(true && (!objectives?.id)) {
printHtmlPart(21)
}
printHtmlPart(22)
expressionOut.print(i)
printHtmlPart(23)
expressionOut.print(objectives?.prefix)
printHtmlPart(24)
if(true && (objectives?.id)) {
printHtmlPart(25)
invokeTag('hiddenField','g',139,['id':(""),'name':("objectives[$i].id"),'value':(objectives?.id)],-1)
printHtmlPart(26)
}
printHtmlPart(27)
expressionOut.print(objectives?.description)
printHtmlPart(24)
if(true && (objectives?.id)) {
printHtmlPart(25)
invokeTag('hiddenField','g',145,['id':(""),'name':("objectives[$i].id"),'value':(objectives?.id)],-1)
printHtmlPart(26)
}
printHtmlPart(28)
i++
}
}
printHtmlPart(29)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451344172000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
