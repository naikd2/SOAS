import com.thinksoas.Role
import com.thinksoas.User
import com.thinksoas.UserRole

class BootStrap {
    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def testUser = new User('admin', 'password').save()
        UserRole.create testUser, adminRole, true
        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
    }
}