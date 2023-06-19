package com.thanhh.java5shop.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@NamedQuery(name="findByUsernameAndPassword",
			query = "SELECT o FROM Account o WHERE o.username = ?1 AND o.password = ?2")
@Data
@Entity
@Table(name = "accounts")
public class Account implements Serializable{
	
	@Id
	@NotBlank
	private String username;

	@NotBlank
	private String password;

	@NotBlank
	private String fullname;

	@NotEmpty
	@Email
	private String email;

	private String photo;
	
	@Column(nullable = false, columnDefinition = "bit default 0")
	private boolean activated;
	
	private boolean admin;

	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
