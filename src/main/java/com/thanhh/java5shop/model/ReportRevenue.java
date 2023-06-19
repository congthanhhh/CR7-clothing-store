package com.thanhh.java5shop.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ReportRevenue implements Serializable {
    @Id
    private Category category;
    private double sum;
    private long count;
}
