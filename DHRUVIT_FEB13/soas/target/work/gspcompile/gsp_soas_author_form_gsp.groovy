import com.thinksoas.Author
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_author_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/author/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: authorInstance, field: 'books', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("author.books.label"),'default':("Books")],-1)
printHtmlPart(2)
invokeTag('select','g',10,['name':("books"),'from':(com.thinksoas.Book.list()),'multiple':("multiple"),'optionKey':("id"),'size':("5"),'value':(authorInstance?.books*.id),'class':("many-to-many")],-1)
printHtmlPart(3)
invokeTag('select','g',14,['value':(article?.type),'name':("articles[${i}].type"),'from':(com.thinksoas.ArticleType?.values()),'keys':(com.thinksoas.ArticleType.values()*.name())],-1)
printHtmlPart(4)
expressionOut.print(hasErrors(bean: authorInstance, field: 'name', 'error'))
printHtmlPart(5)
invokeTag('message','g',19,['code':("author.name.label"),'default':("Name")],-1)
printHtmlPart(6)
invokeTag('textField','g',22,['name':("name"),'required':(""),'value':(authorInstance?.name)],-1)
printHtmlPart(7)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1450587537000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
