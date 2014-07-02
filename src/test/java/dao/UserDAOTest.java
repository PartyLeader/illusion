package dao;

import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.UsersRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

/**
* Created by 802140 on 02.07.2014.
*/
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class UserDAOTest extends BaseTest {

    @Autowired
    protected UsersRepository repository;

    private String DEFAULT_NAME = "Name0";
    private String DEFAULT_LOGIN = "Login0";
    private String DEFAULT_ROLE = "ROLE_USER";
    private int DEFAULT_ROLE_ID = 1;
    private String DEFAULT_EMAIL = "email@mail.com";

    @Test
    public void testCreateUser() throws Exception{
        int sizeBefore = repository.getUsers().size();
        createUserDefault();
        int sizeAfter = repository.getUsers().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateUser() {
        createUserDefault();
        List<User> users = repository.getUsers();
        User user = users.get(0);
        checkUserById(user);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateUser(user);
        User userAfter = repository.getUsers().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListUser() {
        createUserDefault();
        createUserDefault();
        List<User> userList = repository.getUsers();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        User user = new User(DEFAULT_NAME,DEFAULT_LOGIN,DEFAULT_EMAIL,DEFAULT_ROLE_ID,true);

        repository.createUser(user);
    }

    private void checkUserById(User user) {
        assertEquals(user.getName(), DEFAULT_NAME);
        assertEquals(user.getPassword(), DEFAULT_LOGIN);
    }
}
