package com.thinksoas

class Author {
    String name

    static hasMany = [books: Book]
}
