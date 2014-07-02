package dao;

import com.company.permgen.webapp.model.Role;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.RoleRepository;
import com.company.permgen.webapp.repository.UsersRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class RoleDAOTest extends BaseTest {

    @Autowired
    protected RoleRepository repository;

    @Test
    public void testCreateRole() throws Exception{
        int sizeBefore = repository.getRole().size();
        createUserDefault();
        int sizeAfter = repository.getRole().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateRole() {
        createUserDefault();
        List<Role> users = repository.getRole();
        Role user = users.get(0);
        String newName = "NEW_NAME";
        user.setRole(newName);
        repository.updateRole(user);
        Role userAfter = repository.getRole().get(0);
        assertEquals("NEW_NAME", userAfter.getRole());
    }

    @Test
    public void testListRoles() {
        createUserDefault();
        createUserDefault();
        List<Role> userList = repository.getRole();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Role user = new Role("ROLE_DEF");

        repository.createRole(user);
    }
}
