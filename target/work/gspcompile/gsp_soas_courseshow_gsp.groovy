import com.thinksoas.Course
import com.thinksoas.Class
import com.thinksoas.Programs
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_soas_courseshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/course/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',10,['var':("entityName"),'value':(message(code: 'course.label', default: 'Course'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',11,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',11,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',11,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',12,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
expressionOut.print(createLink(controller:'Course', action:'index'))
printHtmlPart(5)
expressionOut.print(createLink(controller:'Course', action:'edit', params:[id:courseInstance.id]))
printHtmlPart(6)
createTagBody(2, {->
invokeTag('message','g',22,['code':("course.button.delete.label"),'default':("Delete Course")],-1)
printHtmlPart(7)
})
invokeTag('link','g',22,['controller':("Course"),'action':("delete"),'params':([id:courseInstance.id]),'onclick':("return confirm('${message(code: 'course.button.delete.confirm.message', default: 'Are you sure? All class sections of this course will be deleted as well.')}');")],2)
printHtmlPart(8)
expressionOut.print(createLink(controller:'Class', action:'create'))
printHtmlPart(9)
invokeTag('set','g',38,['var':("programList"),'value':(Programs.getAll())],-1)
printHtmlPart(10)
for( program in (programList) ) {
if(true && (program.id =~ session.currentProgram)) {
expressionOut.print(program.programName)
}
}
printHtmlPart(11)
invokeTag('fieldValue','g',42,['bean':(courseInstance),'field':("subject")],-1)
printHtmlPart(12)
invokeTag('fieldValue','g',42,['bean':(courseInstance),'field':("name")],-1)
printHtmlPart(13)
invokeTag('fieldValue','g',43,['bean':(courseInstance),'field':("number")],-1)
printHtmlPart(14)
invokeTag('fieldValue','g',47,['bean':(courseInstance),'field':("offered")],-1)
printHtmlPart(12)
invokeTag('fieldValue','g',47,['bean':(courseInstance),'field':("units")],-1)
printHtmlPart(15)
invokeTag('fieldValue','g',50,['bean':(courseInstance),'field':("description")],-1)
printHtmlPart(16)
for( o in (courseInstance.objectives) ) {
printHtmlPart(17)
expressionOut.print(o?.encodeAsHTML())
printHtmlPart(18)
}
printHtmlPart(19)
invokeTag('sortableColumn','g',64,['property':("classSections"),'title':(message(code: 'programs.classes.label', default: 'Class Sections'))],-1)
printHtmlPart(20)
invokeTag('set','g',70,['var':("classList"),'value':(Class.getAll())],-1)
printHtmlPart(21)
loop:{
int i = 0
for( section in (classList) ) {
printHtmlPart(22)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(23)
if(true && (section.course =~ courseInstance)) {
printHtmlPart(24)
expressionOut.print(createLink(controller:'Class', action:'show', params:[id:section.id]))
printHtmlPart(25)
expressionOut.print(fieldValue(bean: section, field: "section"))
printHtmlPart(26)
}
printHtmlPart(27)
i++
}
}
printHtmlPart(28)
})
invokeTag('captureBody','sitemesh',85,[:],1)
printHtmlPart(29)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1451507076000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
