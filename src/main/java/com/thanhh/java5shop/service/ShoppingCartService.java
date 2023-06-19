package com.thanhh.java5shop.service;

import com.thanhh.java5shop.model.CartItem;

import java.util.Collection;

public interface ShoppingCartService {
    double getTotal();

    CartItem add(Integer id);

    CartItem sub(Integer id);

    void remove(Integer id);

    CartItem update(Integer id, int qty);

    void clear();

    Collection<CartItem> getItems();

    int getCount();

    double getAmount();
}
