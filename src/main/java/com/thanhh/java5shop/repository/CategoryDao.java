package com.thanhh.java5shop.repository;

import com.thanhh.java5shop.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao extends JpaRepository<Category, String>{

}
