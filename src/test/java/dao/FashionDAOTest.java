package dao;

import com.company.permgen.webapp.model.Fashion;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.FashionRepository;
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
public class FashionDAOTest extends BaseTest {

    @Autowired
    protected FashionRepository repository;

    @Test
    public void testCreateFashion() throws Exception{
        int sizeBefore = repository.getFashion().size();
        createUserDefault();
        int sizeAfter = repository.getFashion().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateFashion() {
        createUserDefault();
        List<Fashion> users = repository.getFashion();
        Fashion user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateFashion(user);
        Fashion userAfter = repository.getFashion().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListFashion() {
        createUserDefault();
        createUserDefault();
        List<Fashion> userList = repository.getFashion();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Fashion user = new Fashion("new fash");

        repository.createFashion(user);
    }

}
