import com.thinksoas.system.*
import com.thinksoas.data.*

class BootStrap {
    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def admin = new User('admin', 'password').save()
        def user = new User('user', 'password').save()
        UserRole.create admin, adminRole, true
        UserRole.create user, userRole, true

        if (Program.list().isEmpty()) {
            def program = new Program()
            program.performanceTarget = 0.0
            program.assessmentPeriod = 0.0
            program.performanceThreshold = 0.0
            program.deltaValue = 0.0
            program.save()
        }
    }
}