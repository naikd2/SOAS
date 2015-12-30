import com.thinksoas.Programs
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soasindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',5,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("main")],-1)
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',6,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',6,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',8,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
if(true && (request.getSession(false) && session.user)) {
printHtmlPart(6)
if(true && (Programs.count() == 0)) {
printHtmlPart(7)
expressionOut.print(createLink(controller:'Programs', action:'create'))
printHtmlPart(8)
}
else {
printHtmlPart(9)
invokeTag('set','g',25,['var':("programList"),'value':(Programs.getAll())],-1)
printHtmlPart(10)
loop:{
int i = 0
for( program in (programList) ) {
printHtmlPart(11)
expressionOut.print(createLink(controller:'Programs', action:'show', params:[id:program.id]))
printHtmlPart(12)
expressionOut.print(program)
printHtmlPart(13)
i++
}
}
printHtmlPart(6)
}
printHtmlPart(14)
}
else {
printHtmlPart(15)
}
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',41,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451500376000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
