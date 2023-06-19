package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.service.ShoppingCartService;
import com.thanhh.java5shop.utils.ParamService;
import com.thanhh.java5shop.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("home")
public class CartController {
    @Autowired
    ShoppingCartService cartService;
    @Autowired
    ParamService paramService;
    @Autowired
    SessionService sessionService;

    @GetMapping("cart")
    public String index (Model model) {
        model.addAttribute("cart", cartService);
        return "user/cart";
    }

    @RequestMapping("/cart/add/{id}")
    public String add(@PathVariable("id") Integer id) {
        Account currentUser = sessionService.get(SessionAttr.CURRENT_USER);
        if (currentUser != null) {
            cartService.add(id);
        }
        return "redirect:/home/cart";
    }

    @RequestMapping("/cart/sub/{id}")
    public String sub (@PathVariable("id") Integer id) {
        cartService.sub(id);
        return "redirect:/home/cart";
    }

    @RequestMapping("/cart/remove/{id}")
    public String remove (@PathVariable("id") Integer id) {
        cartService.remove(id);
        return "redirect:/home/cart";
    }

    @RequestMapping("/cart/update")
    public String update() {
        Integer id = paramService.getInt("id", 0 );
        int qty = paramService.getInt("qty",0);
        cartService.update(id, qty);
        return "redirect:/home/cart";
    }

    @RequestMapping("/cart/clear")
    public String clear() {
        cartService.clear();
        return "redirect:/home/cart";
    }

}
