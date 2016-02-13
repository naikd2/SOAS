import com.thinksoas.Course
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_courseshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/course/show.gsp" }
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
invokeTag('message','g',8,['code':("default.show.label"),'args':([entityName])],-1)
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
invokeTag('fieldValue','g',39,['bean':(courseInstance),'field':("subject")],-1)
printHtmlPart(8)
invokeTag('fieldValue','g',39,['bean':(courseInstance),'field':("name")],-1)
printHtmlPart(9)
invokeTag('fieldValue','g',40,['bean':(courseInstance),'field':("number")],-1)
printHtmlPart(10)
invokeTag('fieldValue','g',44,['bean':(courseInstance),'field':("offered")],-1)
printHtmlPart(8)
invokeTag('fieldValue','g',44,['bean':(courseInstance),'field':("units")],-1)
printHtmlPart(11)
invokeTag('fieldValue','g',47,['bean':(courseInstance),'field':("description")],-1)
printHtmlPart(12)
createTagBody(2, {->
printHtmlPart(13)
createTagBody(3, {->
invokeTag('message','g',57,['code':("default.button.edit.label"),'default':("Edit")],-1)
})
invokeTag('link','g',57,['class':("edit"),'action':("edit"),'resource':(courseInstance)],3)
printHtmlPart(14)
invokeTag('actionSubmit','g',58,['class':("delete"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(15)
})
invokeTag('form','g',60,['url':([resource:courseInstance, action:'delete']),'method':("DELETE")],2)
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',65,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1455251002000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
