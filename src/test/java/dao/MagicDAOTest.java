package dao;

import com.company.permgen.webapp.model.Magic;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.MagikRepository;
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
public class MagicDAOTest extends BaseTest {

    @Autowired
    protected MagikRepository repository;

    @Test
    public void testCreateMagic() throws Exception{
        int sizeBefore = repository.getMagic().size();
        createUserDefault();
        int sizeAfter = repository.getMagic().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateMagic() {
        createUserDefault();
        List<Magic> users = repository.getMagic();
        Magic user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateMagic(user);
        Magic userAfter = repository.getMagic().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListMagic() {
        createUserDefault();
        createUserDefault();
        List<Magic> userList = repository.getMagic();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Magic user = new Magic("magic","magic speca");

        repository.createMagic(user);
    }
}
