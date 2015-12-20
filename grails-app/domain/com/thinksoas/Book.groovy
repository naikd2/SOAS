package com.thinksoas


class Book {
    String title
    int year
    String isbn

    static hasMany = [authors: Author]
    static belongsTo = Author
}