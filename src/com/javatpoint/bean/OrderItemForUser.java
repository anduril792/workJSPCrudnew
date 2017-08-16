package com.javatpoint.bean;

import java.util.Date;

public class OrderItemForUser
{
	private String order_id;
	private String product_id;
	private int buynum;
	private String id;
	private String name;
	private int price;
	private String category;
	private int pnum;
	private String img_url;
	private String description;
	private String pid;
	private double money;
	private String receiverAddress;
	private String receiverName;
	private String receiverPhone;
	private int paystate;
	private Date ordertime;
	private int user_id;
	
	public OrderItemForUser(String order_id, String product_id, int buynum, String id, String name, int price, String category,
			int pnum,String img_url, String description, String pid, double money, String receiverAddress, String receiverName, String receiverPhone,
			int paystate, Date ordertime, int user_id)
	{
		this.order_id = order_id;
		this.product_id = product_id;
		this.buynum = buynum;
		this.id = id;
		this.name = name;
		this.price = price;
		this.category = category;
		this.pnum = pnum;
		this.img_url = img_url;
		this.description = description;
		this.pid = pid;
		this.money = money;
		this.receiverAddress = receiverAddress;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.paystate = paystate;
		this.ordertime = ordertime;
		this.user_id = user_id;
	}
	
	public String getOrderId()
	{
		return order_id;
	}
	public String getProductId()
	{
		return product_id;
	}
	public int getBuynum()
	{
		return buynum;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getUserId() {
		return user_id;
	}
	public void setUserId(int user_id) {
		this.user_id = user_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
}
