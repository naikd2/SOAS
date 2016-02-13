import com.thinksoas.Profile
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_profile_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/profile/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: profileInstance, field: 'firstName', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("profile.firstName.label"),'default':("First Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("firstName"),'value':(profileInstance?.firstName)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: profileInstance, field: 'lastName', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("profile.lastName.label"),'default':("Last Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['name':("lastName"),'value':(profileInstance?.lastName)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: profileInstance, field: 'email', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("profile.email.label"),'default':("Email")],-1)
printHtmlPart(2)
invokeTag('field','g',28,['type':("email"),'name':("email"),'value':(profileInstance?.email)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: profileInstance, field: 'user', 'error'))
printHtmlPart(6)
invokeTag('message','g',34,['code':("profile.user.label"),'default':("User")],-1)
printHtmlPart(7)
invokeTag('select','g',37,['id':("user"),'name':("user.id"),'from':(com.thinksoas.User.list()),'optionKey':("id"),'required':(""),'value':(profileInstance?.user?.id),'class':("many-to-one")],-1)
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1444758313000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
