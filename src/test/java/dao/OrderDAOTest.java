package dao;

import com.company.permgen.webapp.model.Order;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.OrderRepository;
import com.company.permgen.webapp.repository.UsersRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by 802140 on 02.07.2014.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class OrderDAOTest extends BaseTest {

    @Autowired
    protected OrderRepository repository;

    @Test
    public void testCreateOrder() throws Exception{
        int sizeBefore = repository.getOrders().size();
        createUserDefault();
        int sizeAfter = repository.getOrders().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateOrder() {
        createUserDefault();
        List<Order> users = repository.getOrders();
        Order user = users.get(0);
        user.setFashion(1);
        repository.updateOrder(user);
        Order userAfter = repository.getOrders().get(0);
        assertEquals(1, userAfter.getFashion());
    }

    @Test
    public void testListOrders() {
        createUserDefault();
        createUserDefault();
        List<Order> userList = repository.getOrders();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Order user = new Order(1,3,4,1,0,8,"#343434","07/07/14","08/08/14");

        repository.createOrder(user);
    }
}
