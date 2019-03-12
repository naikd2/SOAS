<html>

<head>
    <title>Bar Chart</title>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:javascript src="Chart.bundle.min.js"/>
    <script src="/soas/static/plugins/jquery-1.11.1/js/jquery/jquery-1.11.1.min.js" type="text/javascript" ></script>

    <style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
</head>


<body>
<div id="container" style="width: 75%;">


    <img id="myImage"/>

    <canvas id="myChart"></canvas>
    <button onclick="Export2Doc('exportContent');">Export as .doc</button>

</div>

<script>
    var ctx = document.getElementById('myChart');
    ctx.width = 100;
    ctx.height = 15;
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["July","August","September","October","November","December","January","February","March","April"],
            datasets: [
                {
                    label: 'This year',
                    data: [340,0,450,3240,360,200,0,0,1445,350],
                    backgroundColor: 'rgba(0, 184, 208, 0.2)',
                    borderColor: 'rgb(0, 184, 208)',
                    pointBackgroundColor: 'rgb(0, 184, 208)',
                    pointBorderWidth: 1,
                    borderWidth: 1
                }
                , {
                    label: 'Last year',
                    data: [330,340,100,160,560,3600,320,0,397.5,300],
                    backgroundColor: 'rgba(255, 152, 0, 0.2)',
                    borderColor: 'rgb(255, 152, 0)',
                    pointBackgroundColor: 'rgb(255, 152, 0)',
                    pointBorderWidth: 1,
                    borderWidth: 1
                }
            ]
        },

        // Chart config
        options: {
            maintainAspectRatio: true,
            responsive: true,
            animation: {
                onComplete: function(animation){
//                    document.querySelector('#myChart').setAttribute('href', this.toBase64Image());
                    document.querySelector('#myChart').style.visibility='hidden';

                    document.querySelector('#myImage').setAttribute('src', this.toBase64Image());
                    var baseImage = document.querySelector('#myImage').getAttribute('src');
                    var data =
                        {requestId: 12456,
                            node: baseImage};


                    var URL="${createLink(controller:'courseReport',action:'checkJquery')}";

                    $.ajax({
                        url:URL,
                        data: JSON.stringify(data),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        type: 'POST',
                        success: function(resp){
                            console.log(resp);
                        }
                    });
                }
            },
            scales: {
                xAxes: [{
                    display: true,
                    gridLines: {
                        display: true,
                        color: 'rgba(0, 0, 0, 0.00)',
                        zeroLineColor: 'transparent'
                    },
                    scaleLabel: {
                        display: false,
                        labelString: 'Month'
                    }
                }],
                yAxes: [{
                    display: true,
                    gridLines: {
                        display: true,
                        color: 'rgba(0, 0, 0, 0.05)',
                        zeroLineColor: 'transparent'
                    },
                    scaleLabel: {
                        display: false,
                        labelString: 'Total'
                    }
                }]
            },
            tooltips: {
                titleFontSize: 12,
                bodyFontSize: 12,
                bodyFontStyle: 'normal',
                bodyFontColor: '#FFFFFF',
                backgroundColor: '#3f5761',
                cornerRadius: 0,
                xPadding: 12,
                yPadding: 12,
                titleMarginBottom: 10
            }
        }
    });

    function Export2Doc(element){
        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
        var postHtml = "</body></html>";
        var html = preHtml+document.getElementById(element).innerHTML+postHtml;

        var blob = new Blob(['\ufeff', html], {
            type: 'application/msword'
        });

        // Specify link url
        var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);

        // Specify file name
        filename = 'document.doc';

        // Create download link element
        var downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if(navigator.msSaveOrOpenBlob ){
            navigator.msSaveOrOpenBlob(blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = url;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }

        document.body.removeChild(downloadLink);
    }

</script>
</body>

</html>

