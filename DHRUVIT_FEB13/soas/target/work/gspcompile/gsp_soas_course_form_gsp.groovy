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
createTagBody(1, {->
printHtmlPart(1)
for( a in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(a)
printHtmlPart(3)
expressionOut.print(a)
printHtmlPart(4)
}
printHtmlPart(5)
for( b in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(b)
printHtmlPart(3)
expressionOut.print(b)
printHtmlPart(4)
}
printHtmlPart(6)
for( c in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(c)
printHtmlPart(3)
expressionOut.print(c)
printHtmlPart(4)
}
printHtmlPart(7)
for( d in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(d)
printHtmlPart(3)
expressionOut.print(d)
printHtmlPart(4)
}
printHtmlPart(8)
for( e in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(e)
printHtmlPart(3)
expressionOut.print(e)
printHtmlPart(4)
}
printHtmlPart(9)
for( f in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(f)
printHtmlPart(3)
expressionOut.print(f)
printHtmlPart(4)
}
printHtmlPart(10)
for( g in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(g)
printHtmlPart(3)
expressionOut.print(g)
printHtmlPart(4)
}
printHtmlPart(11)
for( h in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(h)
printHtmlPart(3)
expressionOut.print(h)
printHtmlPart(4)
}
printHtmlPart(12)
for( i in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(i)
printHtmlPart(3)
expressionOut.print(i)
printHtmlPart(4)
}
printHtmlPart(13)
for( j in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(j)
printHtmlPart(3)
expressionOut.print(j)
printHtmlPart(4)
}
printHtmlPart(14)
for( k in (com.thinksoas.CourseObjective.Level.values()) ) {
printHtmlPart(2)
expressionOut.print(k)
printHtmlPart(3)
expressionOut.print(k)
printHtmlPart(4)
}
printHtmlPart(15)
})
invokeTag('script','r',84,[:],1)
printHtmlPart(16)
expressionOut.print(hasErrors(bean: courseInstance, field: 'subject', 'error'))
printHtmlPart(17)
invokeTag('message','g',92,['code':("course.subject.label"),'default':("Subject")],-1)
printHtmlPart(18)
expressionOut.print(courseInstance?.subject)
printHtmlPart(19)
expressionOut.print(hasErrors(bean: courseInstance, field: 'number', 'error'))
printHtmlPart(20)
invokeTag('message','g',101,['code':("course.number.label"),'default':("Number")],-1)
printHtmlPart(21)
expressionOut.print(courseInstance?.number)
printHtmlPart(19)
expressionOut.print(hasErrors(bean: courseInstance, field: 'name', 'error'))
printHtmlPart(22)
invokeTag('message','g',110,['code':("course.name.label"),'default':("Name")],-1)
printHtmlPart(23)
expressionOut.print(courseInstance?.name)
printHtmlPart(19)
expressionOut.print(hasErrors(bean: courseInstance, field: 'description', 'error'))
printHtmlPart(24)
invokeTag('message','g',119,['code':("course.description.label"),'default':("Description")],-1)
printHtmlPart(25)
expressionOut.print(courseInstance?.description)
printHtmlPart(26)
expressionOut.print(hasErrors(bean: courseInstance, field: 'units', 'error'))
printHtmlPart(27)
invokeTag('message','g',127,['code':("course.units.label"),'default':("Units")],-1)
printHtmlPart(28)
expressionOut.print(courseInstance?.units)
printHtmlPart(19)
expressionOut.print(hasErrors(bean: courseInstance, field: 'offered', 'error'))
printHtmlPart(29)
invokeTag('message','g',136,['code':("course.offered.label"),'default':("Offered")],-1)
printHtmlPart(30)
expressionOut.print(courseInstance?.offered)
printHtmlPart(31)
expressionOut.print(hasErrors(bean: courseInstance, field: 'objectives', 'error'))
printHtmlPart(32)
invokeTag('message','g',146,['code':("course.objectives.label"),'default':("Objectives")],-1)
printHtmlPart(33)
loop:{
int i = 0
for( objectives in (courseInstance.objectives) ) {
printHtmlPart(34)
if(true && (!objectives?.id)) {
printHtmlPart(35)
}
printHtmlPart(36)
expressionOut.print(i)
printHtmlPart(37)
expressionOut.print(objectives?.prefix)
printHtmlPart(38)
if(true && (objectives?.id)) {
printHtmlPart(39)
invokeTag('hiddenField','g',163,['id':(""),'name':("objectives[$i].id"),'value':(objectives?.id)],-1)
printHtmlPart(40)
}
printHtmlPart(41)
expressionOut.print(objectives?.description)
printHtmlPart(38)
if(true && (objectives?.id)) {
printHtmlPart(39)
invokeTag('hiddenField','g',169,['id':(""),'name':("objectives[$i].id"),'value':(objectives?.id)],-1)
printHtmlPart(40)
}
printHtmlPart(42)
i++
}
}
printHtmlPart(43)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1455250433000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
