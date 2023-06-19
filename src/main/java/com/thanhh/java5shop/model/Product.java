package com.thanhh.java5shop.model;

import lombok.Data;
import lombok.ToString;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "products")

public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	
	String name;
	String image;
	Double price;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	Date createDate = new Date();
	
	Boolean available;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "categoryid")
	Category category;
	
	
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;

}
