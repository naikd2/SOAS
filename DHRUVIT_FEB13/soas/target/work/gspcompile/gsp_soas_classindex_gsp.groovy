import com.thinksoas.Class
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_classindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/class/index.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'class.label', default: 'Class'))],-1)
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
expressionOut.print(createLink(controller:'Class', action:'index'))
printHtmlPart(5)
expressionOut.print(createLink(controller:'Class', action:'create'))
printHtmlPart(6)
expressionOut.print(createLink(controller:'Class', action:'index'))
printHtmlPart(7)
invokeTag('sortableColumn','g',41,['property':("section"),'title':(message(code: 'class.section.label', default: 'Section'))],-1)
printHtmlPart(8)
invokeTag('message','g',43,['code':("class.course.label"),'default':("Course")],-1)
printHtmlPart(9)
invokeTag('message','g',45,['code':("class.user.label"),'default':("User")],-1)
printHtmlPart(10)
loop:{
int i = 0
for( classInstance in (classInstanceList) ) {
printHtmlPart(11)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(12)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: classInstance, field: "section"))
})
invokeTag('link','g',53,['action':("show"),'id':(classInstance.id)],3)
printHtmlPart(13)
expressionOut.print(fieldValue(bean: classInstance, field: "course"))
printHtmlPart(13)
expressionOut.print(fieldValue(bean: classInstance, field: "user"))
printHtmlPart(14)
i++
}
}
printHtmlPart(15)
invokeTag('paginate','g',64,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',71,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449537207000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
