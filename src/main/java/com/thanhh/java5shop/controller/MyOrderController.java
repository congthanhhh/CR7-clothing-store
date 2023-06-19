package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.model.Order;
import com.thanhh.java5shop.model.OrderDetail;
import com.thanhh.java5shop.model.Product;
import com.thanhh.java5shop.repository.OrderDao;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.utils.ParamService;
import com.thanhh.java5shop.utils.SessionService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("home")
public class MyOrderController {
    @Autowired
    ParamService paramService;

    @Autowired
    OrderDao orderDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Autowired
    SessionService sessionService;

    @RequestMapping("/myOrder")
    public String myOrder(Model model) {
//        bo sau khi co lam interceptor
        Account account = sessionService.get(SessionAttr.CURRENT_USER);
        String username = account.getUsername();
//        --------------------------------------
        List<Order> items = orderDao.findOrderByUsername(username);
        model.addAttribute("items",items);
        System.out.println(username);
        return "user/my-order";
    }

    @GetMapping("/myOrder/deleteConfirm/{id}")
    public String deleteConfirm(@PathVariable("id") long id, Model model) {
        Order orderId = new Order();
        List<Order> orderList = orderDao.findAll();
        for (Order ordId : orderList) {
            if (ordId.getId() == id) {
                orderId = ordId;
                break;
            }
        }
        model.addAttribute("ordId",orderId);
        return "user/my-order-delete";
    }
    @RequestMapping("/myOrder/delete/{id}")
    public String myOrderDelete(@PathVariable("id") long id, Model model) {
        orderDao.deleteById(id);
        return "redirect:/home/myOrder";
    }
//    @RequestMapping("/myOrder/delete")
//    public String myOrderDelete(@RequestParam("id") long id, Model model) {
//        orderDao.deleteById(id);
//        return "user/my-order";
//    }

    @RequestMapping("/myOrderDetail")
    public String myOrderDetail(@RequestParam("id") long id, Model model) {
        List<OrderDetail> orderDetails = orderDetailDao.findByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "user/my-order-detail";
    }
}
