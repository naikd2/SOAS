<%@ page import="com.thinksoas.Semester" %>

<g:form url="[resource:semesterId, action:'changeSemesterAction']" >
        <div class="newSemester">
            <label for="semster">
                <g:message default="Semesters" />
            </label>
            <g:select id="semesterId" name="semesterId" from="${Semester.list()}" value="" optionKey="id" />

            <g:submitButton name="changeSemester" class="changeSemesterAction" value="Change" />
        </div>
</g:form>
