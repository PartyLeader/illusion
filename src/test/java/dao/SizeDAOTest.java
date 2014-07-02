package dao;

import com.company.permgen.webapp.model.Size;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.SizeRepository;
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
public class SizeDAOTest extends BaseTest {

    @Autowired
    protected SizeRepository repository;

    @Test
    public void testCreateSize() throws Exception{
        int sizeBefore = repository.getSize().size();
        createUserDefault();
        int sizeAfter = repository.getSize().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateSize() {
        createUserDefault();
        List<Size> users = repository.getSize();
        Size user = users.get(0);
        String newName = "38";
        user.setName(newName);
        repository.updateSize(user);
        Size userAfter = repository.getSize().get(0);
        assertEquals("38", userAfter.getName());
    }

    @Test
    public void testListSizes() {
        createUserDefault();
        createUserDefault();
        List<Size> userList = repository.getSize();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Size user = new Size("XXXX");

        repository.createSize(user);
    }
}
