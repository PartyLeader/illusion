package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.*;
import com.company.permgen.webapp.repository.StateRepository;
import com.company.permgen.webapp.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.text.SimpleDateFormat;


/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:18
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class UserController {
    @Autowired
    protected OrderService orderService;
    @Autowired
    protected SizeService sizeService;
    @Autowired
    protected StateRepository stateService;
    @Autowired
    protected GoodTypeService goodTypeService;
    @Autowired
    protected FashionService fashionService;
    @Autowired
    protected MagicService magicService;
    @Autowired
    protected UsersService usersService;
    @Autowired
    protected RoleService roleService;
    @Autowired
    protected RecipeService recipeService;
    @Autowired
    protected ImageService imageService;

    private List<Size> sizeList;
    private List<State> stateList;
    private List<GoodType> goodTypeList;
    private List<Fashion> fashionList;
    private List<Recipe> recipeList;
    private List<Magic> magicList;

    @RequestMapping("/index")
    public String listContacts(Model model) {
        List<Role> roleList =  roleService.getRole();
        List<Image> imageList = imageService.getImage();
        model.addAttribute("sliderImg", imageList);
        model.addAttribute("rolelist",roleList);
        setModel(model);
        return "index";
    }

    @RequestMapping("/controlUsers")
    public String getControlUsers(Model model) {
        model.addAttribute("users", new User());
        model.addAttribute("userslist", usersService.getUsers());
        List<Role> roleList =  roleService.getRole();
        model.addAttribute("rolelist",roleList);
        model.addAttribute("roleservice", roleService);
        setModel(model);

        return "controlUsers";
    }
    @RequestMapping(value = "/controlUsers", method = RequestMethod.POST)
    public String createUserPost(@ModelAttribute("users") User item) {
        // Size size = new Size(sizeName);
        item.setEnabled(true);
        usersService.createUsers(item);
        System.out.println(item.getId());
        return "redirect:/controlUsers";
    }

    @RequestMapping("/first-load")
    public String getFirstLoadPage(Model model) {
        sizeService.createSize(new Size("S (40)"));
        sizeService.createSize(new Size("M (44)"));
        sizeService.createSize(new Size("L (48)"));
        sizeService.createSize(new Size("XL (50)"));
        sizeService.createSize(new Size("XXL (52)"));
        sizeService.createSize(new Size("XXXL (54)"));
        sizeService.createSize(new Size("X (100)"));
        sizeList = sizeService.getSize();
        model.addAttribute("sizeName", sizeList.get(0).getName());
        model.addAttribute("sizeList", sizeList);
        setModel(model);

        List<Fashion> fashionList1 = new ArrayList<Fashion>();
        fashionList1.add(new Fashion("Модная дамская рубаха"));
        fashionList1.add(new Fashion("Крестьянская размахайка"));
        fashionList1.add(new Fashion("Зеленая праздничная рубаха"));
        fashionList1.add(new Fashion("Платьице"));
        fashionList1.add(new Fashion("Школьник-стиль"));
        fashionList1.add(new Fashion("Бесформенная дамская рубашенька"));
        fashionList1.add(new Fashion("Бесформенная мужская рубашенька"));
        fashionList1.add(new Fashion("Дарк-сайд"));
        fashionList1.add(new Fashion("Летняя венская рубашка"));

        for(int i =0; i< fashionList1.size();i++)
        {
            fashionService.createFashion(fashionList1.get(i));
            imageService.createImage(new Image(fashionList1.get(i).getName(), i +".jpg","BL" + i));
        }

        stateService.createState(new State("Отправлен"));
        stateService.createState(new State("Обработка"));
        stateService.createState(new State("Сбор травы"));
        stateService.createState(new State("Обработка травы"));
        stateService.createState(new State("Изготовление"));
        stateService.createState(new State("Магия"));
        stateService.createState(new State("Готово"));

        recipeService.createRecipe(new Recipe("Восполение хитрости", "Восполение хитрости не лечится никак, так что можно наказать проказника - Рубаха с чесоточным эффектом!"));
        recipeService.createRecipe(new Recipe("Курение", "Никотиновые рубахи. Такой рубахи хватает на 1,5 месяца"));
        recipeService.createRecipe(new Recipe("Простуда", "Теплая рубаха с высоким воротом"));
        recipeService.createRecipe(new Recipe("Клаустрофобия", "Необъятных размеров рубашка без рукавов"));
        recipeService.createRecipe(new Recipe("Троллинг", "Рубаха с затычкой для рта"));
        recipeService.createRecipe(new Recipe("Невосприятие сарказма", "Рубашка с невидимой подсказкой сарказм, появляющейся в самый нужный момент"));
        recipeService.createRecipe(new Recipe("Бадун", "Рубаха, пропитанная огуречным рассольчиком"));
        recipeService.createRecipe(new Recipe("Лентяйство", "Рубаха-пендель"));
        recipeService.createRecipe(new Recipe("Капракод", "Рубаха с божественным провидением"));
        recipeService.createRecipe(new Recipe("Кривые руки", "Рубаха с прямыми несгибаемыми рукавами"));
        recipeService.createRecipe(new Recipe("Розовые очки", "Рубаха некроманта"));
        recipeService.createRecipe(new Recipe("Ветер в голове", "Уютная утепленная рубашечка с большим капюшоном"));
        recipeService.createRecipe(new Recipe("Бессоница", "Укутывающая пижамка со снотворным"));

        Role guestRole = new Role("ROLE_ANONYMOUS");
        Role adminRole = new Role("ROLE_ADMIN");
        Role userRole = new Role("ROLE_USER");
        Role taylorRole = new Role("ROLE_TAILOR");
        Role vahtangRole = new Role("ROLE_VAHTANG");
        Role handlerRole = new Role("ROLE_HANDLER");
        Role magicRole = new Role("ROLE_MAGIC");

        roleService.createRole(guestRole);
        roleService.createRole(adminRole);
        roleService.createRole(userRole);
        roleService.createRole(taylorRole);
        roleService.createRole(vahtangRole);
        roleService.createRole(handlerRole);
        roleService.createRole(magicRole);

        usersService.createUsers(new User("user@user.com","121","user@user.com",userRole.getId(),true));
        usersService.createUsers(new User("admin@admin.com","121","admin@admin.com",adminRole.getId(),true));
        usersService.createUsers(new User("taylor@taylor.com","121","taylor@taylor.com",taylorRole.getId(),true));
        usersService.createUsers(new User("vahtang@vahtang.com","121","vahtang@vahtang.com",vahtangRole.getId(),true));
        usersService.createUsers(new User("handler@handler.com","121","handler@handler.com",handlerRole.getId(),true));
        usersService.createUsers(new User("magic@magic.com","121","magic@magic.com",magicRole.getId(),true));

        return "first-load";
    }

    @RequestMapping("/adminPageSize")
    public String getAdminPageSize(Model model) {
        model.addAttribute("size", new Size());
        model.addAttribute("sizeList", sizeService.getSize());
        setModel(model);
        return "adminPageSize";
    }

    @RequestMapping(value = "/adminPageSize", method = RequestMethod.POST)
    public String createSizePost(@ModelAttribute("size") Size size) {
       // Size size = new Size(sizeName);
        sizeService.createSize(size);
        return "redirect:/adminPageSize";
    }

    @RequestMapping(value = "/create-size")
    public String getCreateSizes(Model model) {
        model.addAttribute("size", new Size());
        model.addAttribute("sizeList", sizeService.getSize());
        setModel(model);
        return "create-size";
    }

    @RequestMapping(value = "/adminPage/goodType", method = RequestMethod.POST)
    public String createGoodTypePost(@ModelAttribute("goodType") GoodType item) {
        // Size size = new Size(sizeName);
        goodTypeService.createGoodType(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/fashion", method = RequestMethod.POST)
         public String createFashionPost(@ModelAttribute("fashion") Fashion item) {
        // Size size = new Size(sizeName);
        fashionService.createFashion(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/magic", method = RequestMethod.POST)
    public String createFashionPost(@ModelAttribute("magic") Magic item) {
        magicService.createMagic(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/recipe", method = RequestMethod.POST)
    public String createRecipePost(@ModelAttribute("recipe") Recipe item) {
        // Size size = new Size(sizeName);
        recipeService.createRecipe(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/adminPageMagic")
    public String getAdminPageMagic(Model model) {

        setModel(model);
        return "adminPageMagic";
    }

    @RequestMapping(value = "/analyticView")
    public String getAdminPageView(Model model) {

        setModel(model);
        return "analyticView";
    }

    @RequestMapping(value = "/create-user")
    public String getCreateUsers(Model model) {
        model.addAttribute("users", new User());
        model.addAttribute("rolelist", roleService.getRole());
        setModel(model);
        return "create-user";
    }

    @RequestMapping(value = "/orders")
    public String getOrders(Model model) {
        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        setModel(model);
        return "orders";
    }
    @RequestMapping(value = "create-order")
    public String createRequestGet(Model model) {
        model.addAttribute("order", new Order());

        LoadLists();
        model.addAttribute("fashionList", fashionList);
        model.addAttribute("sizeList", sizeList);
        model.addAttribute("stateList", stateList);
        model.addAttribute("recipeList", recipeList);

        setModel(model);
        return "create-order";
    }

    @RequestMapping(value = "create-order", method = RequestMethod.POST)
    public String createRequestPost(@ModelAttribute("order") Order order) {
        Date createdate = new Date();
       // Date enddate = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse();

        order.setCreatedate(createdate.toString());
         order.setState(0);//send
        order.setBlock(0);//unblock
        orderService.createOrder(order);
        System.out.println(order.getId());
        Random rand = new Random();

        return "redirect:/orders";//что за бред? а если я админ, который создает заказ, я попаду в бездну 404?
    }
//
//    @RequestMapping(value = "requestfilters")
//    public String createRequestGetFilters(Model model) {
//        Request request =new Request();
//        model.addAttribute("request", request);
//        model.addAttribute("listUrgency", requestService.getUrgency());
//        System.out.println(requestService.getUrgency());
//        setModel(model);
//        return "requestfilters";
//    }
//
//    @RequestMapping(value ="requestfilters", method = RequestMethod.POST)
//    public String getRequesrsFilter(@ModelAttribute("request") Request request,Model model) {
//        List<Request> requests = requestService.getRequests(request.getUrgency()) ;
//        model.addAttribute("requests", requests);
//        setModel(model);
//        return "requests";
//    }
//    @RequestMapping("/delete-request/{requestId}")
//    public String deleteRequest(@PathVariable("requestId") int requestId) {
//        requestService.getRequests(requestId);
//        return "redirect:/requests";
//    }
//    @RequestMapping("/order/{requestId}")
//    public String getOrder(@PathVariable("requestId") int requestId,Model model){
//        List<Order> requests = requestService.getRequests((int)requestId) ;
//        model.addAttribute("requests",requests);
//        List<Order> orders = orderService.getOrders(requestId);
//        model.addAttribute("orders",orders);
//        setModel(model);
//        return "order";
//    }

    @RequestMapping("/task/{orderId}")
    public String taskGet(@PathVariable("orderId") int orderId,Model model) {
       List<Order> list =  orderService.getOrder(orderId);
        if (list.size() > 0)
            model.addAttribute("order",list.get(0));
        setModel(model);
        return "task";
    }

    @RequestMapping(value = "task", method = RequestMethod.POST)
    public String taskPost(@ModelAttribute("order") Order order, Model model) {
       // orderService.updateOrder(order);
        System.out.println("createTaskPost");
        return "redirect:/requests";
    }

    private Model setModel(Model model) {
        model.addAttribute("role",SecurityContextHolder.getContext().getAuthentication().getName());
        return model;
    }
    private void LoadLists()
    {
        fashionList =   fashionService.getFashion();
        goodTypeList = goodTypeService.getGoodType();
        //    goodList = goodService.getType();
        sizeList =   sizeService.getSize();
        stateList =  stateService.getState();
        recipeList =  recipeService.getRecipe();
     //   magicList =  magicService.getMagic();
    }

    public class UserDTO {
        private User user;
        private Role role;

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public Role getRole() {
            return role;
        }

        public void setRole(Role role) {
            this.role = role;
        }
    }
}
