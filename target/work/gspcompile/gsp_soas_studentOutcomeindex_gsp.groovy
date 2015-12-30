import com.thinksoas.StudentOutcome
import com.thinksoas.Programs
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
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'studentOutcome.label', default: 'StudentOutcome'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
expressionOut.print(createLink(controller:'Programs', action:'show', params:[id:session.currentProgram]))
printHtmlPart(5)
expressionOut.print(createLink(controller:'StudentOutcome', action:'create'))
printHtmlPart(6)
expressionOut.print(createLink(controller:'StudentOutcome', action:'index'))
printHtmlPart(7)
invokeTag('set','g',33,['var':("programList"),'value':(Programs.getAll())],-1)
printHtmlPart(8)
for( program in (programList) ) {
printHtmlPart(9)
if(true && (program.id =~ session.currentProgram)) {
expressionOut.print(program.programName)
}
}
printHtmlPart(10)
invokeTag('sortableColumn','g',45,['property':("prefix"),'title':(message(code: 'studentOutcome.prefix.label', default: 'Prefix'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',45,['property':("description"),'title':(message(code: 'studentOutcome.description.label', default: 'Description'))],-1)
printHtmlPart(12)
loop:{
int i = 0
for( studentOutcomeInstance in (studentOutcomeInstanceList) ) {
printHtmlPart(13)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(14)
if(true && (studentOutcomeInstance.program =~ session.currentProgram)) {
printHtmlPart(15)
createTagBody(4, {->
expressionOut.print(fieldValue(bean: studentOutcomeInstance, field: "prefix"))
})
invokeTag('link','g',54,['action':("edit"),'id':(studentOutcomeInstance.id)],4)
printHtmlPart(16)
expressionOut.print(fieldValue(bean: studentOutcomeInstance, field: "description"))
printHtmlPart(17)
}
printHtmlPart(18)
i++
}
}
printHtmlPart(19)
invokeTag('paginate','g',61,['total':(courseInstanceCount ?: 0)],-1)
printHtmlPart(20)
})
invokeTag('captureBody','sitemesh',62,[:],1)
printHtmlPart(21)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451503909000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
