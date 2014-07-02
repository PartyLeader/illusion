package dao;

import com.company.permgen.webapp.model.Recipe;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.RecipeRepository;
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
public class RecipeDAOTest extends BaseTest {

    @Autowired
    protected RecipeRepository repository;

    @Test
    public void testCreateRecipe() throws Exception{
        int sizeBefore = repository.getRecipe().size();
        createUserDefault();
        int sizeAfter = repository.getRecipe().size();
        assertEquals(sizeBefore+1,sizeAfter);
    }
    @Test
    public void testUpdateRecipe() {
        createUserDefault();
        List<Recipe> users = repository.getRecipe();
        Recipe user = users.get(0);
        String newName = "NEW NAME";
        user.setName(newName);
        repository.updateRecipe(user);
        Recipe userAfter = repository.getRecipe().get(0);
        assertEquals("NEW NAME", userAfter.getName());
    }

    @Test
    public void testListRecipes() {
        createUserDefault();
        createUserDefault();
        List<Recipe> userList = repository.getRecipe();
        assertEquals(2, userList.size());
    }


    private void createUserDefault() {
        Recipe user = new Recipe("name","speca");

        repository.createRecipe(user);
    }
}
