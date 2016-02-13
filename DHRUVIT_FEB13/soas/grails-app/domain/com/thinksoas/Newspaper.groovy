package com.thinksoas

class Newspaper {

	String name
	List<Article> articles = []
				
	static hasMany = [articles: Article]
	
	static mapping = {
		articles cascade:"all-delete-orphan"	
	  }
	
    static constraints = {
		name(nullable: false, blank: false, size: 3..16)		
    }
	
	String toString() {
		name
	}
}
