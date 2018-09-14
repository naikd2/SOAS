package com.thinksoas.report.viewmodel

enum ChartColor {

    BLUE('rgb(54, 162, 235)'), RED('rgb(255, 99, 132)'), YELLOW('rgb(255, 205, 86)')

    ChartColor(String value) {
        this.value = value
    }

    private final String value

    String getValue() {
        value
    }
}

//orange: 'rgb(255, 159, 64)',
//yellow: 'rgb()',
//green: 'rgb(75, 192, 192)',
//
//purple: 'rgb(153, 102, 255)',
//grey: 'rgb(201, 203, 207)'