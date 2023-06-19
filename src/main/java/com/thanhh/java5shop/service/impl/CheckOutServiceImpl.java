package com.thanhh.java5shop.service.impl;

import com.thanhh.java5shop.model.*;
import com.thanhh.java5shop.repository.OrderDao;
import com.thanhh.java5shop.repository.OrderDetailDao;
import com.thanhh.java5shop.service.CheckOutService;
import com.thanhh.java5shop.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CheckOutServiceImpl implements CheckOutService {

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    OrderDao orderDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Override
    public Order order(Account user, String address) {
        Order order = new Order();
        order.setAccount(user);
        order.setAddress(address);
        orderDao.save(order);

        for (CartItem item : shoppingCartService.getItems()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setPrice(item.getPrice());
            orderDetail.setQuantity(item.getQty());

            Product product = new Product();
            product.setId(item.getId());
            product.setName(item.getName());
            orderDetail.setProduct(product);
            orderDetailDao.save(orderDetail);
        }
        shoppingCartService.clear();//clear cart sau khi order
        return order;
    }



}
