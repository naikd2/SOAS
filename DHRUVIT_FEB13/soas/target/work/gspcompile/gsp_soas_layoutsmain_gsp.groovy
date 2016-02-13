import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_layoutsmain_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/main.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("Content-Type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("X-UA-Compatible"),'content':("IE=edge,chrome=1")],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('layoutTitle','g',10,['default':("Grails")],-1)
})
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0")],-1)
printHtmlPart(2)
expressionOut.print(assetPath(src: 'favicon.ico'))
printHtmlPart(3)
expressionOut.print(assetPath(src: 'apple-touch-icon.png'))
printHtmlPart(4)
expressionOut.print(assetPath(src: 'apple-touch-icon-retina.png'))
printHtmlPart(5)
invokeTag('stylesheet','asset',15,['src':("application2.css")],-1)
printHtmlPart(6)
invokeTag('stylesheet','asset',16,['src':("bootstrap.css")],-1)
printHtmlPart(7)
invokeTag('layoutResources','r',20,[:],-1)
printHtmlPart(8)
invokeTag('javascript','asset',21,['src':("application.js")],-1)
printHtmlPart(8)
invokeTag('javascript','asset',22,['src':("jquery.metadata.js")],-1)
printHtmlPart(8)
invokeTag('javascript','asset',23,['src':("jquery.ui.writetable.js")],-1)
printHtmlPart(1)
invokeTag('layoutHead','g',24,[:],-1)
printHtmlPart(9)
})
invokeTag('captureHead','sitemesh',26,[:],1)
printHtmlPart(10)
createTagBody(1, {->
printHtmlPart(11)
if(true && (request.getSession(false) && session.user)) {
printHtmlPart(12)
expressionOut.print(session.user)
printHtmlPart(13)
expressionOut.print(createLink(controller:'User', action:'logout'))
printHtmlPart(14)
}
else {
printHtmlPart(15)
expressionOut.print(cName)
printHtmlPart(16)
expressionOut.print(aName)
printHtmlPart(17)
}
printHtmlPart(18)
invokeTag('layoutBody','g',64,[:],-1)
printHtmlPart(19)
invokeTag('message','g',71,['code':("spinner.alt"),'default':("Loading&hellip;")],-1)
printHtmlPart(20)
invokeTag('layoutResources','r',71,[:],-1)
printHtmlPart(21)
})
invokeTag('captureBody','sitemesh',72,[:],1)
printHtmlPart(22)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1449552553000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
