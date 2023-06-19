package com.thanhh.java5shop.controller.admin;

import com.thanhh.java5shop.model.Order;
import com.thanhh.java5shop.model.OrderDetail;
import com.thanhh.java5shop.repository.OrderDao;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.utils.CookieService;
import com.thanhh.java5shop.utils.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("admin")
public class OrderAdminController {

    @Autowired
    OrderDao orderDao;

    @Autowired
    CookieService cookieService;

    @Autowired
    ParamService paramService;

    @Autowired
    OrderDetailDao orderDetailDao;

    @GetMapping("order")
    public String showOrder(Model model) {
        List<Order> orders = orderDao.findAll();
        model.addAttribute("orders", orders);
        return "admin/order";
    }

    @RequestMapping("/order/delete/{id}")
    public String delete(@PathVariable("id") long id) {
        orderDao.deleteById(id);
        return "redirect:/admin/order";
    }
//   ============ OrderDetail ===============
    @RequestMapping(value = "orderDetail")
    public String orderDetail(Model model, @RequestParam("id") long id) {
        Order order = new Order();
        List<Order> orders = orderDao.findAll();
        for (Order ord : orders) {
            if (ord.getId() == id){
                order = ord;
                break;
            }
        }
        model.addAttribute("ord", order);

        List<OrderDetail> orderDetails = orderDetailDao.findByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/orderDetail";
    }
}
