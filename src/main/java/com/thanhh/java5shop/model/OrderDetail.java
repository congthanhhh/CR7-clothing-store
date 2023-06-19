package com.thanhh.java5shop.model;

import lombok.Data;
import lombok.ToString;

import jakarta.persistence.*;
import java.io.Serializable;
@Data
@Entity
@Table(name = "orderdetails")
public class OrderDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	Double price;
	Integer quantity;
	
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "productid")
	Product product;
	
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "orderid")
	Order order;
}
