package com.thanhh.java5shop.controller.admin;

import com.thanhh.java5shop.model.Category;
import com.thanhh.java5shop.model.Product;
import com.thanhh.java5shop.repository.CategoryDao;
import com.thanhh.java5shop.repository.ProductDao;
import com.thanhh.java5shop.utils.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class ProductAdminController {

    @Autowired
    ProductDao productDao;

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    ParamService paramService;

    @GetMapping("product")
    public String showProduct(Model model) {
        List<Product> products = productDao.findAll();
        model.addAttribute("products",products);
        return "admin/product";
    }

    @RequestMapping("/product-form")
    public String productForm(Model model) {
        Product item = new Product();
        model.addAttribute("item", item);
        return "admin/product-form";
    }

    @RequestMapping("/product/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Product item = productDao.findById(id).get();
        model.addAttribute("item",item);
        List<Product> items = productDao.findAll();
        model.addAttribute("items",items);
        return "admin/product-form";
    }

    @RequestMapping("/product/create")
    public String create(Product item, BindingResult result, Model model,
                         @RequestParam("image") MultipartFile multipartFile) throws IOException {
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "template/admin/dist/img/products/";
        item.setImage(fileName);
        item.setCreateDate(new Date());
        productDao.save(item);
        paramService.save(multipartFile,uploadDir);
        model.addAttribute("message","Insert successfully");
        return "redirect:/admin/product-form";
    }

    @RequestMapping("/product/delete/{id}")
    public String create(@PathVariable("id") Integer id) {
        productDao.deleteById(id);
        return "redirect:/admin/product";
    }

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryDao.findAll();
    }

    @ModelAttribute("availables")
    public Map<Boolean, String>getAdmins(){
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Stocking");
        map.put(false, "Out of Stock");
        return map;
    }
}
