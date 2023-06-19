package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.model.Order;
import com.thanhh.java5shop.model.OrderDetail;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.service.CheckOutService;
import com.thanhh.java5shop.service.ShoppingCartService;
import com.thanhh.java5shop.utils.ParamService;
import com.thanhh.java5shop.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("home")
public class OrderController {

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    SessionService sessionService;

    @Autowired
    ParamService paramService;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Autowired
    CheckOutService checkOutService;

    @GetMapping("checkout")
    public String checkout(Model model) {
        model.addAttribute("cart", shoppingCartService);
        return "user/checkout";
    }

    @RequestMapping("order-detail")
    public String orderDetail(Model model) {
        String address = paramService.getString("address","");
        if (!shoppingCartService.getItems().isEmpty()) {//gio hang khon rong
            if (address.equals("")) {
                return "redirect: home/checkout";
            }
            Account user = sessionService.get(SessionAttr.CURRENT_USER);
            Order order = checkOutService.order(user,address);
            List<OrderDetail> items = orderDetailDao.findByOrderId(order.getId());
            model.addAttribute("order",order);
            model.addAttribute("items",items);
            return "user/checkout-detail";
        }
        return "redirect:/home/index";
    }

}
