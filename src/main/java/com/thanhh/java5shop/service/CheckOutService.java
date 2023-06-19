package com.thanhh.java5shop.service;

import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.model.Order;

public interface CheckOutService {
    Order order (Account user, String address);
}
