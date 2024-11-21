package com.example.model;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class MyPurchasedPlan {

	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	 private String username;
	 private String planname;
	 private int price;
	 private int days;
	 private long mobile;
	 private Timestamp purchase_date = new Timestamp(System.currentTimeMillis());
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long l) {
		this.mobile = l;
	}
	public Timestamp getPurchaseDate() {
		return purchase_date;
	}
	public void setPurchaseDate(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}
	@Override
	public String toString() {
		return "MyPurchasedPlan [id=" + id + ", username=" + username + ", planname=" + planname + ", price=" + price
				+ ", days=" + days + ", mobile=" + mobile + ", purchase_date=" + purchase_date + "]";
	}


}

