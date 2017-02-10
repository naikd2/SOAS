import com.thinksoas.Role
import com.thinksoas.SO_Report
import com.thinksoas.StudentOutcome
import com.thinksoas.User
import com.thinksoas.UserRole
import com.thinksoas.Course
import com.thinksoas.CourseObjective

class BootStrap {
    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def testUser = new User('admin', 'password').save()
        UserRole.create testUser, adminRole, true
        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

        def report = new SO_Report(StudentOutcome.findByPrefix("a")).save()
        def report2 = new SO_Report(StudentOutcome.findByPrefix("b")).save()
        def report3 = new SO_Report(StudentOutcome.findByPrefix("c")).save()
        def report4 = new SO_Report(StudentOutcome.findByPrefix("d")).save()
        def report5 = new SO_Report(StudentOutcome.findByPrefix("e")).save()
        def report6 = new SO_Report(StudentOutcome.findByPrefix("f")).save()
        def report7 = new SO_Report(StudentOutcome.findByPrefix("g")).save()
        def report8 = new SO_Report(StudentOutcome.findByPrefix("h")).save()
        def report9 = new SO_Report(StudentOutcome.findByPrefix("i")).save()
        def report10 = new SO_Report(StudentOutcome.findByPrefix("j")).save()
        def report11 = new SO_Report(StudentOutcome.findByPrefix("k")).save()

    }
}