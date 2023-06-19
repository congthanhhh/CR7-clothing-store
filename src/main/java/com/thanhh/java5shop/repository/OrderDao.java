package com.thanhh.java5shop.repository;

import com.thanhh.java5shop.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDao extends JpaRepository<Order, Long>{

    @Query("SELECT o FROM Order o WHERE o.account.username = ?1")
    List<Order> findOrderByUsername(String username);


}
