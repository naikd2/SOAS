import com.thinksoas.Course
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_courseindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/course/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'course.label', default: 'Course'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
expressionOut.print(createLink(controller:'Course', action:'index'))
printHtmlPart(5)
expressionOut.print(createLink(controller:'Course', action:'create'))
printHtmlPart(6)
expressionOut.print(createLink(controller:'Course', action:'index'))
printHtmlPart(7)
invokeTag('sortableColumn','g',42,['property':("subject"),'title':(message(code: 'course.subject.label', default: 'Subject'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',44,['property':("number"),'title':(message(code: 'course.number.label', default: 'Number'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',46,['property':("name"),'title':(message(code: 'course.name.label', default: 'Name'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',48,['property':("description"),'title':(message(code: 'course.description.label', default: 'Description'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',50,['property':("units"),'title':(message(code: 'course.units.label', default: 'Units'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',52,['property':("offered"),'title':(message(code: 'course.offered.label', default: 'Offered'))],-1)
printHtmlPart(9)
loop:{
int i = 0
for( courseInstance in (courseInstanceList) ) {
printHtmlPart(10)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(11)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: courseInstance, field: "subject"))
})
invokeTag('link','g',60,['action':("show"),'id':(courseInstance.id)],3)
printHtmlPart(12)
expressionOut.print(fieldValue(bean: courseInstance, field: "number"))
printHtmlPart(12)
expressionOut.print(fieldValue(bean: courseInstance, field: "name"))
printHtmlPart(12)
expressionOut.print(fieldValue(bean: courseInstance, field: "description"))
printHtmlPart(12)
expressionOut.print(fieldValue(bean: courseInstance, field: "units"))
printHtmlPart(12)
expressionOut.print(fieldValue(bean: courseInstance, field: "offered"))
printHtmlPart(13)
i++
}
}
printHtmlPart(14)
invokeTag('paginate','g',77,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(15)
})
invokeTag('captureBody','sitemesh',86,[:],1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449525660000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
