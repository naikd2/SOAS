package com.thinksoas

class SOASTagLib {


 //static encodeAsForTags = [tagName: 'raw']
	//static defaultEncodeAs = 'html'
    def loginToggle = {
			out << "<div style='margin: 15px 0 40px;'>"
			if (request.getSession(false) && session.user){
			out << "<span style='float:left; margin-left: 15px'>"
			out << "Welcome ${session.user}"
			out << "</span><span style='float:right;margin-right:15px'>"
			out << "<a href='${createLink(controller:'User', action:'logout')}'>" 
			out << "Logout </a></span>"
			} else{
			out << "<span style='float:right;margin-right:10px'>"
			out << "<a href='${createLink(controller:'User', action:'login')}'>" 
			out << "Login </a></span>"
			}
			out << "</div><br/>"
		}
		
}