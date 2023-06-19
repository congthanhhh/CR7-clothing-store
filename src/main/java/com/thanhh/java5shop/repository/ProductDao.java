package com.thanhh.java5shop.repository;

import com.thanhh.java5shop.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDao extends JpaRepository<Product, Integer>{

    @Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
    Page<Product> findByPrice(Integer minPrice, Integer maxPrice, Pageable pageable);

    Page<Product> findAllByNameLike(String keywords, Pageable pageable);
    @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findByKeywords(String keywords, Pageable pageable);

    @Query("SELECT o FROM Product o WHERE o.category.id = ?1")
    Page<Product> findByCategory(String id, Pageable pageable);


}
