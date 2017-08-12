<div>
    <g:textArea id="descriptionText" class="form-control" rows="5" name="description" required="" value="${desc}"/>

    <div class="col-xs-6">
        <h5 class="text-center">Method One</h5>
        <select class="form-control" name="objMethodOne">
            <g:each in="${methods}" var="m" status="i">
                <option>${m}</option>
            </g:each>
        </select>
    </div>
    <div class="col-xs-6">
        <h5 class="text-center">Method Two</h5>
        <select class="form-control" name="objMethodTwo">
            <g:each in="${methods}" var="m" status="i">
                <option>${m}</option>
            </g:each>
        </select>
    </div>
</div>
