package dao;

import com.company.permgen.webapp.model.GoodType;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.GoodRepository;
import com.company.permgen.webapp.repository.GoodTypeRepository;
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
public class GoodTypeDAOTest extends BaseTest {

    @Autowired
    protected GoodTypeRepository repository;

    @Test
    public void testCreateGoodType() throws Exception{
        int sizeBefore = repository.getGoodType().size();
        createUserDefault();
        int sizeAfter = repository.getGoodType().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateGoodType() {
        createUserDefault();
        List<GoodType> users = repository.getGoodType();
        GoodType user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateGoodType(user);
        GoodType userAfter = repository.getGoodType().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListUser() {
        createUserDefault();
        createUserDefault();
        List<GoodType> userList = repository.getGoodType();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        GoodType user = new GoodType("Ментальность");

        repository.createGoodType(user);
    }
}
