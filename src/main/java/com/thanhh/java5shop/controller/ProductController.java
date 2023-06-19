package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Category;
import com.thanhh.java5shop.model.Product;
import com.thanhh.java5shop.repository.CategoryDao;
import com.thanhh.java5shop.repository.ProductDao;
import com.thanhh.java5shop.utils.ParamService;
import com.thanhh.java5shop.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("home")
public class ProductController {
    @Autowired
    ProductDao productDao;

    @Autowired
    ParamService paramService;

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    SessionService sessionService;

    @GetMapping("shop")
    public String showProduct(Model model, @RequestParam("p") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0),9);
        Page<Product> page = productDao.findAll(pageable);
        int currentPage = 1;
        int totalItems = page.getNumberOfElements();
        int totalPages = page.getTotalPages();

        List<Category> categorySession = categoryDao.findAll();
        sessionService.set(SessionAttr.CATEGORY_LIST,categorySession);

        model.addAttribute("totalItems", totalItems);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("page", page);
        return "user/shop";
    }

    @GetMapping("detail/{id}")
    public String showProductDetail(@PathVariable("id") int id, ModelMap model) {
        Product product = new Product();
        List<Product> products = productDao.findAll();
        for (Product pr : products) {
            if (pr.getId() == id) {
                product = pr;
                break;
            }
        }
        model.addAttribute("products", products);
        model.addAttribute("pr", product);
        return "user/detail";
    }

    @RequestMapping("category")
    public String category(@RequestParam("cateId1") Optional<String> cateId1,
                           Model model, @RequestParam("p") Optional<Integer> p) {

        String cateId = cateId1.orElse(sessionService.get(SessionAttr.PRODUCT_BY_CATEGORY));
        sessionService.set(SessionAttr.PRODUCT_BY_CATEGORY, cateId);

        Pageable pageable = PageRequest.of(p.orElse(0),9);
        Page<Product> page = productDao.findByCategory(cateId, pageable);
        model.addAttribute("page", page);
        return"user/category-shop";
    }

    @RequestMapping("price")
    public String finByPrice(@RequestParam("min") Optional<Integer> min, Model model,
                             @RequestParam("max") Optional<Integer> max, @RequestParam("p") Optional<Integer> p) {

        Integer minPrice = min.orElse(Integer.MIN_VALUE);
        Integer maxPrice = max.orElse(Integer.MAX_VALUE);
//        sessionService.set("max", maxPrice);
//        sessionService.set("min", minPrice);
        Pageable pageable = PageRequest.of(p.orElse(0),9);
        Page<Product> page = productDao.findByPrice(minPrice,maxPrice,pageable);
        model.addAttribute("page",page);
//        chua xu ly chuyen trang
        return "user/search-price";
    }

    @RequestMapping("search")
    public String searchProduct(@RequestParam("keywords")Optional<String> keywords,
                                @RequestParam("p") Optional<Integer> p, Model model) {

        String key = keywords.orElse(sessionService.get("keywords"));
        sessionService.set("keywords",key);
        Pageable pageable = PageRequest.of(p.orElse(0),9);
        Page<Product> page = productDao.findByKeywords("%"+ key +"%",pageable);
        model.addAttribute("page",page);
        return "user/search-keyword";
    }

}
