package com.thanhh.java5shop.controller.admin;

import com.thanhh.java5shop.model.ReportRevenue;
import com.thanhh.java5shop.model.TopCustomer;
import com.thanhh.java5shop.model.TopProduct;
import com.thanhh.java5shop.repository.AccountDao;
import com.thanhh.java5shop.repository.OrderDao;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.repository.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("admin")
public class StatisticController {

    @Autowired
    AccountDao accountDao;

    @Autowired
    ProductDao productDao;

    @Autowired
    OrderDao orderDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    @RequestMapping("topCustomer")
    public String topCustomer(Model model) {
        List<TopCustomer> topCustomers = accountDao.getTopAccount();
        model.addAttribute("topCustomers", topCustomers);
        return "admin/top-customer";
    }

    @RequestMapping("bestSeller")
    public String bestSeller(Model model) {
        List<TopProduct> bestSeller = orderDetailDao.getBestSeller();
        model.addAttribute("bestSeller", bestSeller);
        return "admin/best-seller";
    }

    @RequestMapping("revenueStatistic")
    public String categoryStatistics(Model model) {
        List<ReportRevenue> revenue = orderDetailDao.getRevenueByCateGory();
        model.addAttribute("revenue", revenue);
        return "admin/revenue-statistics";
    }
}
