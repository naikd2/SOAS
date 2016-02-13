import com.thinksoas.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_book_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: bookInstance, field: 'authors', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("book.authors.label"),'default':("Authors")],-1)
printHtmlPart(2)
expressionOut.print(hasErrors(bean: bookInstance, field: 'isbn', 'error'))
printHtmlPart(3)
invokeTag('message','g',16,['code':("book.isbn.label"),'default':("Isbn")],-1)
printHtmlPart(4)
invokeTag('textField','g',19,['name':("isbn"),'required':(""),'value':(bookInstance?.isbn)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'title', 'error'))
printHtmlPart(6)
invokeTag('message','g',25,['code':("book.title.label"),'default':("Title")],-1)
printHtmlPart(4)
invokeTag('textField','g',28,['name':("title"),'required':(""),'value':(bookInstance?.title)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'year', 'error'))
printHtmlPart(7)
invokeTag('message','g',34,['code':("book.year.label"),'default':("Year")],-1)
printHtmlPart(4)
invokeTag('field','g',37,['name':("year"),'type':("number"),'value':(bookInstance.year),'required':("")],-1)
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1450581981000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
