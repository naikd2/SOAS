import com.thinksoas.Role
import com.thinksoas.User
import com.thinksoas.UserRole

class BootStrap {
    def init = { servletContext ->
        def userRole = new Role('ROLE_USER').save()
        def faculty = new User('faculty', 'password').save()
        UserRole.create faculty, userRole, true
    }
}