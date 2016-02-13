import com.thinksoas.StudentOutcome
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_studentOutcome_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/studentOutcome/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: studentOutcomeInstance, field: 'prefix', 'error'))
printHtmlPart(1)
invokeTag('message','g',8,['code':("studentOutcome.prefix.label"),'default':("Prefix")],-1)
printHtmlPart(2)
expressionOut.print(studentOutcomeInstance?.prefix)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: studentOutcomeInstance, field: 'description', 'error'))
printHtmlPart(4)
invokeTag('message','g',17,['code':("studentOutcome.description.label"),'default':("Description")],-1)
printHtmlPart(5)
expressionOut.print(studentOutcomeInstance?.description)
printHtmlPart(6)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449538924000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
