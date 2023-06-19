package com.thanhh.java5shop.repository;

import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.model.TopCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AccountDao extends JpaRepository<Account, String>{

    @Query(name = "findByUsernameAndPassword")
    Account login(String username, String password);

    @Query("SELECT new TopCustomer(o.account, COUNT(o.account.username)) FROM Order o " +
            "GROUP BY o.account ORDER BY COUNT (o.account.username) DESC ")
    List<TopCustomer> getTopAccount();

}
