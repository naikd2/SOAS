package com.thinksoas.report.viewmodel

class Dataset {

    String borderColor

    String backgroundColor

    String borderWidth

    List<String> data = new ArrayList<>()

    String label

    Dataset() {
    }

    Dataset(String borderColor, String backgroundColor, String borderWidth, String label) {
        this.borderColor = borderColor
        this.backgroundColor = backgroundColor
        this.borderWidth = borderWidth
        this.label = label
    }

    def pushData(String d) {
        this.data.add(d)
    }

}
