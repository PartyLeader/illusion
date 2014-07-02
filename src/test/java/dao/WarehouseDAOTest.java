package dao;

import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.model.Warehouse;
import com.company.permgen.webapp.repository.UsersRepository;
import com.company.permgen.webapp.repository.WarehouseRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class WarehouseDAOTest extends BaseTest {

    @Autowired
    protected WarehouseRepository repository;

    @Test
    public void testCreateWarehouse() throws Exception{
        int sizeBefore = repository.getWarehouse().size();
        createUserDefault();
        int sizeAfter = repository.getWarehouse().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateWarehouse() {
        createUserDefault();
        List<Warehouse> users = repository.getWarehouse();
        Warehouse user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateWarehouse(user);
        Warehouse userAfter = repository.getWarehouse().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListWarehouses() {
        createUserDefault();
        createUserDefault();
        List<Warehouse> userList = repository.getWarehouse();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Warehouse user = new Warehouse("warehouse1",1,1680);

        repository.createWarehouse(user);
    }
}
