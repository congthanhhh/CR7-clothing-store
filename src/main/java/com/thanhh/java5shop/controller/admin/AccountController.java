package com.thanhh.java5shop.controller.admin;

import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.repository.AccountDao;
import com.thanhh.java5shop.utils.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AccountController {
    @Autowired
    AccountDao accountDao;

    @Autowired
    ParamService paramService;

    @GetMapping("account")
    public String showListAccount(Model model) {
        List<Account> accounts = accountDao.findAll();
        model.addAttribute("accounts",accounts);
        return "admin/account";
    }

    @RequestMapping("/account-form")
    public String control(Model model) {
        Account item = new Account();
        model.addAttribute("item", item);
        return "admin/account-form";
    }

    @RequestMapping("/account/edit/{username}")
    public String edit(Model model, @PathVariable("username") String username) {
        Account item = accountDao.findById(username).get();
        model.addAttribute("item", item);
        List<Account> items = accountDao.findAll();
        model.addAttribute("items", items);
        return "admin/account-form";
    }

    @RequestMapping("/account/create")
    public String create(Account item, BindingResult result,
                         Model model, @RequestParam("photo") MultipartFile multipartFile) throws IOException {

        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "template/admin/dist/img/users/";
        item.setPhoto(fileName);
        accountDao.save(item);
        paramService.save(multipartFile,uploadDir);
        return "redirect:/admin/account-form";
    }

    @RequestMapping("/account/delete/{username}")
    public String delete(@PathVariable("username") String username) {
        accountDao.deleteById(username);
        return "redirect:/admin/account";
    }

    @ModelAttribute("activatedItem")
    public Map<Boolean, String>getActivated() {
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Active");
        map.put(false, "Un active");
        return map;
    }

    @ModelAttribute("adminItem")
    public Map<Boolean, String>getAdmin(){
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Admin");
        map.put(false, "Customer");
        return map;
    }

}
