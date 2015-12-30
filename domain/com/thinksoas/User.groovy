package com.thinksoas

class User {


	String userId
	String password
	
    
	static hasOne = [profile: Profile]
    static hasMany = [classes: Class]

   
    static constraints = {
    	userId(size:3..20, unique: true)
    	password(size: 3..20, validator: 
    			{passwd, user -> passwd != user.userId })

    	profile(nullable:true)
    }
       String toString() {
        "$userId"
    }
    
}
