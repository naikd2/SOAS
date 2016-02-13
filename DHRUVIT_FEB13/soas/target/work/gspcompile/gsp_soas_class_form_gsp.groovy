import com.thinksoas.Class
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_class_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/class/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: classInstance, field: 'section', 'error'))
printHtmlPart(1)
invokeTag('message','g',10,['code':("class.section.label"),'default':("Section")],-1)
printHtmlPart(2)
invokeTag('textField','g',13,['name':("section"),'required':(""),'value':(classInstance?.section)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: classInstance, field: 'course', 'error'))
printHtmlPart(4)
invokeTag('message','g',19,['code':("class.course.label"),'default':("Course")],-1)
printHtmlPart(2)
invokeTag('select','g',22,['id':("course"),'name':("course"),'from':(com.thinksoas.Course.list()),'optionKey':(""),'required':(""),'value':(""),'class':("many-to-one")],-1)
printHtmlPart(5)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449537360000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
