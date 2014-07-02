package dao;

import com.company.permgen.webapp.model.Product;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.ProductRepository;
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
public class ProductDAOTest extends BaseTest {

    @Autowired
    protected ProductRepository repository;

    @Test
    public void testCreateProduct() throws Exception{
        int sizeBefore = repository.getProduct().size();
        createUserDefault();
        int sizeAfter = repository.getProduct().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateProduct() {
        createUserDefault();
        List<Product> users = repository.getProduct();
        Product user = users.get(0);
        String newName = "quality";
        user.setQuality(newName);
        repository.updateProduct(user);
        Product userAfter = repository.getProduct().get(0);
        assertEquals("quality", userAfter.getQuality());
    }

    @Test
    public void testListProducts() {
        createUserDefault();
        createUserDefault();
        List<Product> userList = repository.getProduct();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Product user = new Product(1,"speca","quality1",1,5,1,"#232323");

        repository.createProduct(user);
    }
}
