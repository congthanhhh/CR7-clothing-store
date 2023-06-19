package com.thanhh.java5shop.repository;

import com.thanhh.java5shop.model.OrderDetail;
import com.thanhh.java5shop.model.ReportRevenue;
import com.thanhh.java5shop.model.TopProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailDao extends JpaRepository<OrderDetail, Long>{

    @Query("SELECT o FROM OrderDetail o WHERE o.order.id = ?1")
    List<OrderDetail> findByOrderId(Long orderId);

    @Query("SELECT new TopProduct(o.product, SUM (o.quantity)) FROM OrderDetail " +
            "o GROUP BY o.product ORDER BY SUM (o.quantity) DESC LIMIT 10")
    List<TopProduct> getTopProduct();

    @Query("SELECT new TopProduct(o.product, SUM(o.quantity)) FROM OrderDetail o " +
            "GROUP BY o.product ORDER BY SUM(o.quantity) DESC ")
    List<TopProduct> getBestSeller();

    @Query("SELECT new ReportRevenue(o.product.category, SUM(o.product.price * o.quantity), SUM(o.quantity)) FROM OrderDetail o " +
            "GROUP BY o.product.category ORDER BY SUM(o.product.price * o.quantity) DESC")
    List<ReportRevenue> getRevenueByCateGory();

}
