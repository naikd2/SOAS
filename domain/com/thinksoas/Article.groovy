package com.thinksoas

class Article {

	String title
	ArticleType type	
	boolean deleted
				
	static transients = [ 'deleted' ]
	
	static constraints = {
		title(size: 3..12, nullabe: false)		
	}
	
	String toString() {
		title
	}
	
    
}

enum ArticleType {
	
	NEWS,
	STORY
	
} 
