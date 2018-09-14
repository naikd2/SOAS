package com.thinksoas.report.viewmodel

import grails.converters.JSON

class ChartModel {

    List<Dataset> datasets

    List<String> labels

    ChartModel() {
        this.datasets = new ArrayList<>()
        this.labels = new ArrayList<>()
    }

    def addToDataSet(String method, String value, ChartColor color) {
        Optional<Dataset> optionalDataset = datasets.stream().filter { s -> s.label.equals(method) }.findAny()
        if (optionalDataset.isPresent()) {
            Dataset dataset = optionalDataset.get()
            dataset.pushData(value)
        } else {
            Dataset dataset = new Dataset(borderColor: color.getValue(), backgroundColor: color.getValue(), borderWidth: 1, label: method)
            this.datasets.add(dataset)
            dataset.pushData(value)
        }


    }

    def addToLabels(String label) {
        this.labels.add(label)
    }

    def createJsonOfDataSet() {
        return datasets as JSON
    }

}
