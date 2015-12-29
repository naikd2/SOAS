package com.thinksoas

class Profile {
	
	String firstName
	String lastName
	String email
	// 1 to 1 unidirectional relationship with User
	static belongsTo = [user: User]

    static constraints = {
    	firstName(nullable: true)
    	lastName(nullable: true)
    	email(email:true, nullable:true)
    }

    String toString() {
        "$firstName, $lastName"
    }
}
