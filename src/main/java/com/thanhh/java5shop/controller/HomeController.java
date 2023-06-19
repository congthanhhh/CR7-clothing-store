package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Category;
import com.thanhh.java5shop.model.TopProduct;
import com.thanhh.java5shop.repository.CategoryDao;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.repository.ProductDao;
import com.thanhh.java5shop.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("home")
public class HomeController {

    @Autowired
    ProductDao productDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Autowired
    SessionService sessionService;

    @Autowired
    CategoryDao categoryDao;

    @GetMapping("index")
    public String topProduct(Model model) {
        List<TopProduct> topProducts = orderDetailDao.getTopProduct();

        //Show category o index
        List<Category> categorySession = categoryDao.findAll();
        sessionService.set(SessionAttr.CATEGORY_LIST,categorySession); // khong co session van hien va tim dc category

        model.addAttribute("topProducts",topProducts);
        return "user/index";
    }
}
