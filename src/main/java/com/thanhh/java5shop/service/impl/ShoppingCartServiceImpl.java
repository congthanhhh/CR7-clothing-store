package com.thanhh.java5shop.service.impl;

import com.thanhh.java5shop.model.CartItem;
import com.thanhh.java5shop.model.Product;
import com.thanhh.java5shop.repository.ProductDao;
import com.thanhh.java5shop.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
    Map<Integer, CartItem> map = new HashMap<>();// gio hang, hien thi gio hang
    @Autowired
    ProductDao productDao;

    @Override
    public double getTotal() {//cach tinh tong 1
        double total = 0;
        for (CartItem item : map.values()) {
            total += (item.getPrice() * item.getQty());
        }
        return total;
    }

    @Override
    public CartItem add(Integer id) {
        CartItem item = map.get(id);
        if (item == null) {//khong co trong gio thi add vao
            Product product = productDao.findById(id).get();
            item = new CartItem();
            item.setId(product.getId());
            item.setName(product.getName());
            item.setPrice(product.getPrice());
            item.setImage(product.getImage());
            item.setQty(1);
            map.put(id,item);
        } else {
            item.setQty(item.getQty() + 1);
        }
        return item;
    }
    @Override
    public CartItem sub(Integer id) {
        CartItem item = map.get(id);
        if (item == null) {
            Product product = productDao.findById(id).get();
            item = new CartItem();
            item.setId(product.getId());
            item.setImage(product.getImage());
            item.setName(product.getName());
            item.setPrice(product.getPrice());
            item.setQty(1);
            map.put(id, item);
        } else {
            if (item.getQty() > 1) {
                item.setQty(item.getQty() - 1);
            } else {
                item.setQty(1);
            }
        }
        return item;
    }

    @Override
    public void remove(Integer id) {
        map.remove(id);
    }

    @Override
    public CartItem update(Integer id, int qty) {
        CartItem item = map.get(id);
        item.setQty(qty);
        return item;
    }

    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public Collection<CartItem> getItems() {
        return map.values();
    }

    @Override
    public int getCount() {
//        return map.values().stream().mapToInt(CartItem::getQty).sum();
        return map.values().stream().mapToInt(item -> item.getQty()).sum();
    }

    @Override
    public double getAmount() { //cach tinh tong 2
        return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
    }

}
