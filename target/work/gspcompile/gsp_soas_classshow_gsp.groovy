import com.thinksoas.Class
import com.thinksoas.Course
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_classshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/class/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'class.label', default: 'Class'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
expressionOut.print(createLink(controller:'Course', action:'show', params:[id:classInstance.course.id]))
printHtmlPart(5)
expressionOut.print(createLink(controller:'Class', action:'edit', params:[id:classInstance.id]))
printHtmlPart(6)
createTagBody(2, {->
invokeTag('message','g',22,['code':("class.button.delete.label"),'default':("Delete Class")],-1)
printHtmlPart(7)
})
invokeTag('link','g',22,['controller':("Class"),'action':("delete"),'params':([id:classInstance.id]),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],2)
printHtmlPart(8)
invokeTag('set','g',39,['var':("courseList"),'value':(Course.getAll())],-1)
printHtmlPart(9)
for( course in (courseList) ) {
printHtmlPart(7)
if(true && (course =~ classInstance.course)) {
expressionOut.print(course.name)
}
}
printHtmlPart(10)
invokeTag('fieldValue','g',43,['bean':(classInstance),'field':("section")],-1)
printHtmlPart(11)
})
invokeTag('captureBody','sitemesh',50,[:],1)
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451507216000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
