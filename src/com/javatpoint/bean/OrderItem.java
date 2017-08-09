package com.javatpoint.bean;

public class OrderItem {
	private Order order;// 訂單
	private Product p; // 商品
	private int buynum; // 購物數量
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	
}