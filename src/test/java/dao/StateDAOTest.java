package dao;

import com.company.permgen.webapp.model.State;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.StateRepository;
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
public class StateDAOTest extends BaseTest {

    @Autowired
    protected StateRepository repository;

    @Test
    public void testCreateState() throws Exception{
        int sizeBefore = repository.getState().size();
        createUserDefault();
        int sizeAfter = repository.getState().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateState() {
        createUserDefault();
        List<State> users = repository.getState();
        State user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateState(user);
        State userAfter = repository.getState().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListStates() {
        createUserDefault();
        createUserDefault();
        List<State> userList = repository.getState();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        State user = new State("YXYXY");

        repository.createState(user);
    }
}
