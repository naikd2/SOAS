
<%@ page %>
<!DOCTYPE html>

<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<div class="container-fluid">
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <a class="btn btn-primary" href="${createLink(controller:'Message', action:'index')}" role="button">Go To Your Messages &raquo;</a>
                </div>
            </div>
        </div>
    </div>
</div>
</html>