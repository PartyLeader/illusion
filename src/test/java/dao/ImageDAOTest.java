package dao;

import com.company.permgen.webapp.model.Image;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.ImageRepository;
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
public class ImageDAOTest extends BaseTest {

    @Autowired
    protected ImageRepository repository;

    @Test
    public void testCreateImage() throws Exception{
        int sizeBefore = repository.getImage().size();
        createUserDefault();
        int sizeAfter = repository.getImage().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateImage() {
        createUserDefault();
        List<Image> users = repository.getImage();
        Image user = users.get(0);
        String newName = "NEW NAME";
        user.setCaption(newName);
        repository.updateImage(user);
        Image userAfter = repository.getImage().get(0);
        assertEquals("NEW NAME", userAfter.getCaption());
    }

    @Test
    public void testListImages() {
        createUserDefault();
        createUserDefault();
        List<Image> userList = repository.getImage();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Image user = new Image("Caption","25.jpg","BL100");

        repository.createImage(user);
    }
}
