import com.thinksoas.StudentOutcome
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_studentOutcomeindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/studentOutcome/index.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'studentOutcome.label', default: 'StudentOutcome'))],-1)
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
expressionOut.print(createLink(controller:'StudentOutcome', action:'index'))
printHtmlPart(5)
expressionOut.print(createLink(controller:'StudentOutcome', action:'create'))
printHtmlPart(6)
expressionOut.print(createLink(controller:'StudentOutcome', action:'index'))
printHtmlPart(7)
invokeTag('sortableColumn','g',39,['property':("prefix"),'title':(message(code: 'studentOutcome.prefix.label', default: 'Prefix'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',42,['property':("description"),'title':(message(code: 'studentOutcome.description.label', default: 'Description'))],-1)
printHtmlPart(9)
loop:{
int i = 0
for( studentOutcomeInstance in (studentOutcomeInstanceList) ) {
printHtmlPart(10)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(11)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: studentOutcomeInstance, field: "prefix"))
})
invokeTag('link','g',51,['action':("show"),'id':(studentOutcomeInstance.id)],3)
printHtmlPart(12)
expressionOut.print(fieldValue(bean: studentOutcomeInstance, field: "description"))
printHtmlPart(13)
i++
}
}
printHtmlPart(14)
invokeTag('paginate','g',56,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(15)
})
invokeTag('captureBody','sitemesh',59,[:],1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449538733000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
