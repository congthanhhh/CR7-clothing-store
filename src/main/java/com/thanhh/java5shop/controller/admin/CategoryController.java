package com.thanhh.java5shop.controller.admin;

import com.thanhh.java5shop.model.Category;
import com.thanhh.java5shop.repository.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("admin")
public class CategoryController {

    @Autowired
    CategoryDao categoryDao;

    @GetMapping("category")
    public String showCategory(Model model) {
        List<Category> categories = categoryDao.findAll();
        model.addAttribute("categories",categories);
        return "admin/category";
    }
//==========================================
    @RequestMapping("/category-form")
    public String control(Model model) {
        Category item = new Category();
        model.addAttribute("item", item);
        return "admin/category-form";
    }


    @RequestMapping("/category/edit/{id}")
    public String edit(Model model, @PathVariable("id") String id) {
        Category item = categoryDao.findById(id).get();
        model.addAttribute("item", item);
        List<Category> items = categoryDao.findAll();
        model.addAttribute("items", items);
        return "admin/category-form";
    }

    @RequestMapping("/category/create")
    public String create(Model model, Category item) {
        categoryDao.save(item);
        model.addAttribute("message", "Insert successfully");
        return "redirect:/admin/category-form";
    }

    @RequestMapping("/category/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        categoryDao.deleteById(id);
        return "redirect:/admin/category";
    }

    @RequestMapping("/category/update")
    public String update(Model model, Category item) {
        categoryDao.save(item);
        model.addAttribute("message", "Update successfully");
        return "redirect:/admin/category/edit/" + item.getId();
    }

}
