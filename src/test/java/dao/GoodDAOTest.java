package dao;

import com.company.permgen.webapp.model.Good;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.GoodRepository;
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
public class GoodDAOTest extends BaseTest {

    @Autowired
    protected GoodRepository repository;

    @Test
    public void testCreateGood() throws Exception{
        int sizeBefore = repository.getGood().size();
        createUserDefault();
        int sizeAfter = repository.getGood().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateGood() {
        createUserDefault();
        List<Good> users = repository.getGood();
        Good user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateGood(user);
        Good userAfter = repository.getGood().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListUser() {
        createUserDefault();
        createUserDefault();
        List<Good> userList = repository.getGood();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Good user = new Good("Good_Def", true, 1);

        repository.createGood(user);
    }

}
