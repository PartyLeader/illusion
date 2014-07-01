package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.*;
import com.company.permgen.webapp.repository.StateRepository;
import com.company.permgen.webapp.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    protected GoodService goodService;
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
    @Autowired
    protected WarehouseService warehouseService;


    private List<Size> sizeList;
    private List<State> stateList;
    private List<GoodType> goodTypeList;
    private List<Good> goodList;
    private List<Fashion> fashionList;
    private List<Recipe> recipeList;
    private List<Magic> magicList;
    private  Authentication _userSession;

    @RequestMapping("/index")
    public String listContacts(Model model) {
        List<Role> roleList =  roleService.getRole();
        List<Image> imageList = imageService.getImage();
        model.addAttribute("sliderImg", imageList);
        model.addAttribute("rolelist",roleList);
        setModel(model);
        return "index";
    }

    @RequestMapping("/aboutUs")
    public String getAboutUs(Model model) {
        setModel(model);
        return "aboutUs";
    }

    @RequestMapping("/controlUsers")
    public String getControlUsers(Model model) {
        model.addAttribute("users", new User());
        model.addAttribute("userslist", usersService.getUsers());
        List<Role> roleList =  roleService.getRole();
        model.addAttribute("rolelist",roleList);
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

    @RequestMapping(value = "/create-user")
    public String getCreateUsers(Model model) {
        model.addAttribute("users", new User());
        model.addAttribute("rolelist", roleService.getRole());
        setModel(model);
        return "create-user";
    }

    @RequestMapping("/controlUsersCustomers")
    public String getControlUsersCustomers(Model model) {
        setModel(model);
        model.addAttribute("users", new User());
        return "controlUsersCustomers";
    }

    @RequestMapping(value = "/controlUsersCustomers", method = RequestMethod.POST)
    public String createUserCustomersPost(@ModelAttribute("users") User item) {
        // Size size = new Size(sizeName);
        item.setRole(3);
        item.setEnabled(true);
        usersService.createUsers(item);
        System.out.println(item.getId());
        return "redirect:/";
    }

    @RequestMapping("/first-load")
    public String getFirstLoadPage(Model model) {
        Random rand = new Random();
        List<Size> list = sizeService.getSize();
        if(list.size() > 0){
            return "redirect:/";
        }
        List<GoodType> _goodTypeList = new ArrayList<GoodType>();
        _goodTypeList.add(new GoodType("Крапива"));
        _goodTypeList.add(new GoodType("Нити"));
        _goodTypeList.add(new GoodType("Изделия"));
        for(int i =0; i< _goodTypeList.size();i++) {
            goodTypeService.createGoodType(_goodTypeList.get(i));
        }

        List<Good> _goodList = new ArrayList<Good>();
        _goodList.add(new Good("Трава отборная", true, _goodTypeList.get(0).getId() ));                         //0
        _goodList.add(new Good("Крапива простая", false, _goodTypeList.get(0).getId() ));                       //1
        _goodList.add(new Good("Горная крапива", false, _goodTypeList.get(0).getId() ));                        //2
        _goodList.add(new Good("Постапокаллиптическая крапива", false, _goodTypeList.get(0).getId() ));         //3
        _goodList.add(new Good("Крапива, которой нет", false, _goodTypeList.get(0).getId() ));                  //4
        _goodList.add(new Good("Влажная крапива", false, _goodTypeList.get(0).getId() ));                       //5
        _goodList.add(new Good("Крапивница азиатская", false, _goodTypeList.get(0).getId() ));                  //6
        _goodList.add(new Good("Вареная крапива", false, _goodTypeList.get(0).getId() ));                       //7
        _goodList.add(new Good("Крапивы весны 1985", false, _goodTypeList.get(0).getId() ));                    //8
        _goodList.add(new Good("Шелковая крапива", false, _goodTypeList.get(0).getId() ));                      //9
        _goodList.add(new Good("Коноплянная нить", true, _goodTypeList.get(1).getId() ));                       //10
        _goodList.add(new Good("Пачесей", false, _goodTypeList.get(1).getId() ));                               //11
        _goodList.add(new Good("Вычесок", false, _goodTypeList.get(1).getId() ));                               //12
        _goodList.add(new Good("Поурет", true, _goodTypeList.get(1).getId() ));                                 //13
        _goodList.add(new Good("Крапивный канат", true, _goodTypeList.get(1).getId() ));                        //14
        _goodList.add(new Good("Нитки на веселе", true, _goodTypeList.get(1).getId() ));                        //15
        _goodList.add(new Good("Шерстяные крапивные нитки", true, _goodTypeList.get(1).getId() ));              //16
        _goodList.add(new Good("Тонкая крапивная ниточка", false, _goodTypeList.get(1).getId() ));               //17
        _goodList.add(new Good("Стебель-нитка", false, _goodTypeList.get(1).getId() ));                          //19
        _goodList.add(new Good("Рубаха", false, _goodTypeList.get(2).getId()));                                  //20
        _goodList.add(new Good("Поло", true, _goodTypeList.get(2).getId()));                                     //21
        _goodList.add(new Good("Плащ", true, _goodTypeList.get(2).getId()));                                 //22
        _goodList.add(new Good("Бесшовная рубаха", true, _goodTypeList.get(2).getId()));                                 //23
        _goodList.add(new Good("Рубаха-топор", true, _goodTypeList.get(2).getId()));                                 //24
        _goodList.add(new Good("Рубаха-макарена", true, _goodTypeList.get(2).getId()));                                 //25
        _goodList.add(new Good("Футболка", true, _goodTypeList.get(2).getId()));                                 //26
        _goodList.add(new Good("Платьице неженское", true, _goodTypeList.get(2).getId()));                                 //27
        _goodList.add(new Good("Парашют", true, _goodTypeList.get(2).getId()));                                 //28
        _goodList.add(new Good("Скафандр", true, _goodTypeList.get(2).getId()));                                 //2а8щк
        for(int i =0; i< _goodList.size();i++) {
            goodService.createGood(_goodList.get(i));
        }

for(int i=0;i< _goodList.size();i++) {
    warehouseService.createWarehouse(new Warehouse(_goodList.get(i).getName(), _goodList.get(i).getId(), 0));
}

        sizeService.createSize(new Size("S (40)",40));
        sizeService.createSize(new Size("M (44)",44));
        sizeService.createSize(new Size("L (48)",48));
        sizeService.createSize(new Size("XL (50)",50));
        sizeService.createSize(new Size("XXL (52)",52));
        sizeService.createSize(new Size("XXXL (54)",54));
        sizeService.createSize(new Size("X (100)",100));
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
        fashionList1.add(new Fashion("Крутая рубашка"));

        for(int i =0; i< fashionList1.size();i++)
        {
            fashionService.createFashion(fashionList1.get(i));
            imageService.createImage(new Image(fashionList1.get(i).getName(), i +".jpg","BL" + i));
            goodService.createGood(new Good(fashionList1.get(i).getName(), true, _goodTypeList.get(2).getId()));
        }

        stateService.createState(new State("Отправлен"));
        stateService.createState(new State("Обработка"));
        stateService.createState(new State("Сбор травы"));
        stateService.createState(new State("Обработка травы"));
        stateService.createState(new State("Изготовление"));
        stateService.createState(new State("Магия"));
        stateService.createState(new State("Готово"));


        recipeService.createRecipe(new Recipe("Восполение хитрости","Восполение хитрости не лечится никак, так что можно наказать проказника - Рубаха с чесоточным эффектом!",_goodList.get(4).getId(),21,_goodList.get(11).getId(),15,_goodList.get(28).getId(),1));
        recipeService.createRecipe(new Recipe(
                "Курение",
                "Никотиновые рубахи. Такой рубахи хватает на 1,5 месяца",
                _goodList.get(0).getId(),
                rand.nextInt(42),
                _goodList.get(15).getId(),
                rand.nextInt(42),
                _goodList.get(23).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Простуда",
                "Теплая рубаха с высоким воротом",
                _goodList.get(2).getId(),
                rand.nextInt(42),
                _goodList.get(16).getId(),
                rand.nextInt(42),
                _goodList.get(21).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Клаустрофобия",
                "Необъятных размеров рубашка без рукавов",
                _goodList.get(7).getId(),
                rand.nextInt(42),
                _goodList.get(17).getId(),
                rand.nextInt(42),
                _goodList.get(27).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Троллинг",
                "Рубаха с затычкой для рта",
                _goodList.get(8).getId(),
                rand.nextInt(42),
                _goodList.get(11).getId(),
                rand.nextInt(42),
                _goodList.get(24).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Невосприятие сарказма",
                "Рубашка с невидимой подсказкой сарказм, появляющейся в самый нужный момент",
                _goodList.get(7).getId(),
                rand.nextInt(42),
                _goodList.get(18).getId(),
                rand.nextInt(42),
                _goodList.get(26).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Бадун",
                "Рубаха, пропитанная огуречным рассольчиком",
                _goodList.get(5).getId(),
                rand.nextInt(42),
                _goodList.get(12).getId(),
                rand.nextInt(42),
                _goodList.get(19).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Лентяйство",
                "Рубаха-пендель",
                _goodList.get(0).getId(),
                rand.nextInt(42),
                _goodList.get(14).getId(),
                rand.nextInt(42),
                _goodList.get(25).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Капракод",
                "Рубаха с божественным провидением",
                _goodList.get(0).getId(),
                rand.nextInt(42),
                _goodList.get(13).getId(),
                rand.nextInt(42),
                _goodList.get(28).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Кривые руки",
                "Рубаха с прямыми несгибаемыми рукавами",
                _goodList.get(6).getId(),
                rand.nextInt(42),
                _goodList.get(10).getId(),
                rand.nextInt(42),
                _goodList.get(28).getId(),
                 1
        ));
        recipeService.createRecipe(new Recipe(
                "Розовые очки",
                "Рубаха некроманта",
                _goodList.get(3).getId(),
                rand.nextInt(42),
                _goodList.get(17).getId(),
                rand.nextInt(42),
                _goodList.get(21).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Ветер в голове",
                "Уютная утепленная рубашечка с большим капюшоном",
                _goodList.get(6).getId(),
                rand.nextInt(42),
                _goodList.get(16).getId(),
                rand.nextInt(42),
                _goodList.get(27).getId(),
                1
        ));
        recipeService.createRecipe(new Recipe(
                "Бессоница",
                "Укутывающая пижамка со снотворным",
                _goodList.get(9).getId(),
                rand.nextInt(42),
                _goodList.get(16).getId(),
                rand.nextInt(42),
                _goodList.get(26).getId(),
                1
        ));

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

    @RequestMapping("/adminPageMagic")
    public String getAdminPageMagic(Model model) {
        model.addAttribute("magic", new Magic());
        model.addAttribute("magicList", magicService.getMagic());
        setModel(model);
        return "adminPageMagic";
    }

    @RequestMapping(value = "/adminPageMagic", method = RequestMethod.POST)
    public String createMagicPost(@ModelAttribute("magic") Magic magic) {
        // Size size = new Size(sizeName);
        magicService.createMagic(magic);
        return "redirect:/adminPageMagic";
    }

    @RequestMapping(value = "/create-magic")
    public String getCreateMagic(Model model) {
        model.addAttribute("magic", new Magic());
        model.addAttribute("magicList", magicService.getMagic());
        setModel(model);
        return "create-magic";
    }

    @RequestMapping("/adminPageFashion")
    public String getAdminPageFashion(Model model) {
        model.addAttribute("fashion", new Fashion());
        model.addAttribute("fashionList", fashionService.getFashion());
        List<Image> imageList = imageService.getImage();
        model.addAttribute("images", imageList);
        setModel(model);
        return "adminPageFashion";
    }

    @RequestMapping("/adminPageRecipe")
    public String getAdminPageRecipe(Model model) {
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("recipeList", recipeService.getRecipe());
        model.addAttribute("goodsList", goodService.getGood());
        setModel(model);
        return "adminPageRecipe";
    }

    @RequestMapping(value = "/adminPageRecipe", method = RequestMethod.POST)
    public String createRecipePost(@ModelAttribute("recipe") Recipe recipe) {
        // Size size = new Size(sizeName);
        recipeService.createRecipe(recipe);
        return "redirect:/adminPageRecipe";
    }

    @RequestMapping(value = "/create-recipe")
    public String getCreateRecipe(Model model) {
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("recipeList", recipeService.getRecipe());
        setModel(model);
        return "create-recipe";
    }

    @RequestMapping("/")
    public String home(Model model) {
        getFirstLoadPage(model);
        return "redirect:/index";
    }

    @ResponseStatus(value = org.springframework.http.HttpStatus.NOT_FOUND)
    public final class ResourceNotFoundException extends RuntimeException {
        //need to be empty
    }

    @RequestMapping(value = "/op")
    public void methodWithRequestParams(@RequestParam(value = "param1", required = false) String param1,
                                        @RequestParam(value = "param2", required = false) String param2) {
        if (param1 == null || param2 == null) {
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = "/analyticView")
    public String getAdminPageView(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("stateList", stateService.getState());
        setModel(model);
        return "analyticView";
    }

    @RequestMapping(value = "/plan-work-anal")
    public String getPlanAnalPage(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("stateList", stateService.getState());
        setModel(model);
        return "plan-work-anal";
    }

    @RequestMapping(value = "/plan-work-work")
         public String getPlanWorkPage(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("stateList", stateService.getState());
        model.addAttribute("sizeList", sizeService.getSize());
        model.addAttribute("recipes", recipeService.getRecipe());
        model.addAttribute("goodList", goodService.getGood());
        model.addAttribute("warehouse",warehouseService.getWarehouse());
        setModel(model);
        return "plan-work-work";
    }


    @RequestMapping(value = "/orders")
    public String getOrders(Model model) {
        if( _userSession.getAuthorities().toArray()[0].equals("ROLE_ADMIN"))
            return "redirect:/analyticView";
        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("stateList", stateService.getState());
        setModel(model);
        return "orders";
    }

    @RequestMapping(value = "add-good")
    public String addGoodToWarehouse(Model model) {
        LoadLists();
        List<Warehouse> list = warehouseService.getWarehouse();
        model.addAttribute("warehouse",list.get(0));
        model.addAttribute("goodList",goodService.getGood());
        model.addAttribute("goodTypeList",goodTypeService.getGoodType());
        model.addAttribute("orderList",orderService.getOrders());
        model.addAttribute("recipeList",recipeService.getRecipe());
        setModel(model);
        return "add-good";
    }

    @RequestMapping(value = "add-good", method = RequestMethod.POST)
    public String addGoodRequestPost(@ModelAttribute("warehouse") Warehouse warehouse) {
        List <Warehouse> wh = warehouseService.getWarehouse();
        int curcount = 0;
        for (int i =0; i< wh.size(); i++) {
            if(wh.get(i).getGood() == warehouse.getGood()){
                curcount = wh.get(i).getCount();
            }
        }
        warehouseService.changeCount(curcount + warehouse.getCount(),warehouse.getGood());
        return "redirect:/warehouse";
    }

    @RequestMapping(value = "down-good")
    public String getGoodFromWarehouse(Model model) {
        LoadLists();
        List<Warehouse> list = warehouseService.getWarehouse();
        model.addAttribute("warehouse",list.get(0));
        model.addAttribute("goodList",goodService.getGood());
        model.addAttribute("goodTypeList",goodTypeService.getGoodType());
        model.addAttribute("orderList",orderService.getOrders());
        model.addAttribute("recipeList",recipeService.getRecipe());
        setModel(model);
        return "down-good";
    }

    @RequestMapping(value = "down-good", method = RequestMethod.POST)
    public String downGoodRequestPOST(@ModelAttribute("warehouse") Warehouse warehouse) {
        List <Warehouse> wh = warehouseService.getWarehouse();
        int curcount = 0;
        for (int i =0; i< wh.size(); i++) {
            if(wh.get(i).getGood() == warehouse.getGood()){
                curcount = wh.get(i).getCount();
            }
        }
        if(curcount>=warehouse.getCount())
            warehouseService.changeCount(curcount-warehouse.getCount(),warehouse.getGood());
        else
            warehouseService.changeCount(curcount,warehouse.getGood());
        return "redirect:/warehouse";
    }

    @RequestMapping(value = "create-order")
    public String createRequestGet(Model model) {
        model.addAttribute("order", new Order());
        LoadLists();
        model.addAttribute("fashionList", fashionList);
        model.addAttribute("sizeList", sizeList);
        model.addAttribute("stateList", stateList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("imageList", imageService.getImage());
        setModel(model);
        return "create-order";
    }

    @RequestMapping(value = "create-order", method = RequestMethod.POST)
    public String createRequestPost(@ModelAttribute("order") Order order) {
        Date createdate = new Date();
       // Date enddate = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse();
        order.setCreatedate(createdate.toString());
        if (_userSession.getAuthorities().toArray()[0].equals("ROLE_USER"))
            order.setUser(usersService.getUserId(_userSession.getName()));
        order.setState(0);//send
        order.setBlock(0);
        orderService.createOrder(order);
        System.out.println(order.getId());
        Random rand = new Random();
       if( _userSession.getAuthorities().toArray()[0].equals("ROLE_ADMIN"))
           return "redirect:/analyticView";
        else
            return "redirect:/orders";
    }

    @RequestMapping("/change-order-state/{orderId}")
    public String changeOrderState(@PathVariable("orderId") int orderId) {
        orderService.upState(orderId);
        return "redirect:/plan-work-work";
    }

    @RequestMapping("/block-order/{orderId}")
    public String blockOrder(@PathVariable("orderId") int orderId) {
        orderService.blockOrder(orderId);
        return "redirect:/analyticView";
    }

    @RequestMapping("/delete-order/{orderId}")
    public String deleteOrder(@PathVariable("orderId") int orderId) {
        orderService.removeOrder(orderId);
        if( _userSession.getAuthorities().toArray()[0].equals("ROLE_ADMIN"))
            return "redirect:/analyticView";
        else
            return "redirect:/orders";
    }

    @RequestMapping("/stay-handler/{orderId}")
    public String stayHandler(@PathVariable("orderId") int orderId){
        orderService.stayHandler(orderId);
        return "redirect:/analyticView";
    }

    @RequestMapping("/start-order/{orderId}")
    public String startOrder(@PathVariable("orderId") int orderId) {
        orderService.startOrder(orderId);
        return "redirect:/analyticView";
    }

    @RequestMapping("/order/{orderId}")
    public String getOrder(@PathVariable("orderId") int orderId, Model model){
        List<Order> orders = orderService.getOrders();
        model.addAttribute("order", orders.get(orderId-1));
        model.addAttribute("orderID", orderId);
        LoadLists();
        model.addAttribute("fashionList", fashionList);
        model.addAttribute("sizeList", sizeList);
        model.addAttribute("stateList", stateList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("userList", usersService.getUsers());
        setModel(model);
        return "order";
    }

    @RequestMapping(value = "/order/{orderId}", method = RequestMethod.POST)
    public String editRequestPost(@ModelAttribute("order") Order order,@PathVariable("orderId") int orderId,Model model) {
        List<Order> list =  orderService.getOrders(orderId);
        Order oldOrder = list.get(0);
        if(oldOrder.getState()>=2)
        {
            oldOrder.setEnddate(order.getEnddate());
        }
        else {
            _userSession = SecurityContextHolder.getContext().getAuthentication();
            if( _userSession.getAuthorities().toArray()[0].equals("ROLE_ADMIN")) {
                oldOrder.setUser(order.getUser());
            }
            oldOrder.setBlock(1);
            oldOrder.setFashion(order.getFashion());
            oldOrder.setEnddate(order.getEnddate());
            oldOrder.setPriority(order.getPriority());
            oldOrder.setSize(order.getSize());
            oldOrder.setGen(order.getGen());
            oldOrder.setRecipe(order.getRecipe());
        }
            orderService.updateOrder(oldOrder);
        setModel(model);
        if( _userSession.getAuthorities().toArray()[0].equals("ROLE_ADMIN"))
            return "redirect:/analyticView";
        else
            return "redirect:/orders";

    }

    @RequestMapping("/orderStateView/{orderId}")
    public String getOrderState(@PathVariable("orderId") int orderId, Model model){
        model.addAttribute("ordersList", orderService.getOrders());
        model.addAttribute("orderID", orderId);
        model.addAttribute("stateList", stateService.getState());
        setModel(model);
        return "orderStateView";
    }

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
        _userSession = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("userName",_userSession.getName());
        model.addAttribute("userRole",_userSession.getAuthorities().toArray()[0]);
        return model;
    }
    private void LoadLists()
    {
        fashionList =   fashionService.getFashion();
        goodTypeList = goodTypeService.getGoodType();
        //goodList = goodService.getType();
        sizeList =   sizeService.getSize();
        stateList =  stateService.getState();
        recipeList =  recipeService.getRecipe();
        magicList =  magicService.getMagic();
     //   magicList =  magicService.getMagic();
    }

    @RequestMapping(value = "/find-order")
    public String getFindOrderPage(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("userList", usersService.getUsers());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("stateList", stateService.getState());
        setModel(model);
        return "find-order";
    }

    @RequestMapping(value = "/find-order", method = RequestMethod.POST)
    public String findOrder(@ModelAttribute("orderId") int orderId,Model model) {
        model.addAttribute("orders",orderService.getOrders(orderId));
        return "find-order";
    }
    @RequestMapping(value = "/warehouse")
    public String getWarehousePage(Model model) {
        model.addAttribute("warehouses", warehouseService.getWarehouse());
        model.addAttribute("goodList", goodService.getGood());
        model.addAttribute("goodTypeList", goodTypeService.getGoodType());
        setModel(model);
        return "warehouse";
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
}
