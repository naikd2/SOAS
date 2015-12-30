import com.thinksoas.Newspaper
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_newspaper_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/newspaper/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
for( type in (com.thinksoas.ArticleType?.values()) ) {
printHtmlPart(2)
expressionOut.print(type)
printHtmlPart(3)
expressionOut.print(type)
printHtmlPart(4)
}
printHtmlPart(5)
})
invokeTag('script','r',58,[:],1)
printHtmlPart(6)
expressionOut.print(hasErrors(bean: newspaperInstance, field: 'name', 'error'))
printHtmlPart(7)
invokeTag('message','g',63,['code':("newspaper.name.label"),'default':("Name")],-1)
printHtmlPart(8)
invokeTag('textField','g',66,['name':("name"),'required':(""),'maxlength':("16"),'value':(newspaperInstance?.name)],-1)
printHtmlPart(9)
expressionOut.print(hasErrors(bean: newspaperInstance, field: 'articles', 'error'))
printHtmlPart(10)
invokeTag('message','g',72,['code':("newspaper.articles.label"),'default':("Articles")],-1)
printHtmlPart(11)
loop:{
int i = 0
for( article in (newspaperInstance.articles) ) {
printHtmlPart(12)
if(true && (!article?.id)) {
printHtmlPart(13)
}
printHtmlPart(14)
expressionOut.print(i)
printHtmlPart(15)
invokeTag('textField','g',88,['id':(""),'required':(""),'name':("articles[$i].title"),'value':(article?.title)],-1)
printHtmlPart(16)
if(true && (article?.id)) {
printHtmlPart(17)
invokeTag('hiddenField','g',90,['id':(""),'name':("articles[$i].id"),'value':(article?.id)],-1)
printHtmlPart(16)
}
printHtmlPart(18)
invokeTag('select','g',94,['value':(article?.type),'name':("articles[${i}].type"),'from':(com.thinksoas.ArticleType?.values()),'keys':(com.thinksoas.ArticleType.values()*.name())],-1)
printHtmlPart(19)
i++
}
}
printHtmlPart(20)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1450754557000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
