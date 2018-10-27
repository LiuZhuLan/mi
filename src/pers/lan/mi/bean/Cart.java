package pers.lan.mi.bean;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart{
	
	//存放购物车项的集合  key:商品的id  购物车项:cartitem   使用map集合便于删除单个购物车项
	private Map<String, CartItem> map=new LinkedHashMap<>();
	
	//总金额
	private Double total=0.0;
	
	
	 //获取所有的购物车项
	public Collection<CartItem> getItems(){
		return  map.values();
	}
	
	 //添加到购物车
	public void addCart(CartItem item){
		
		String pid = item.getProduct().getPid();
		
		if(map.containsKey(pid)){
			CartItem oItem = map.get(pid);
			oItem.setCount(oItem.getCount()+item.getCount());
		}else{
			map.put(pid, item);
		}
		
		//修改总金额
		total+=item.getSubtotal();
	}
	
	
	 //从购物车删除指定购物车项
	
	public void removeFromCart(String pid){
		
		//1.从集合中删除
		CartItem item = map.remove(pid);
		
		//2.修改金额
		total-=item.getSubtotal();
	}
	
	//+操作
	public void incrCart(String pid){
		
		map.get(pid).incrCount();
		total+=map.get(pid).getProduct().getShop_price();
	}
	
	//-操作
	public void decrCart(String pid){
		
		boolean result = map.get(pid).decrCount();
		total-=map.get(pid).getProduct().getShop_price();
	    if (result) {
	       map.remove(pid);
	    }
		
	}
	
	
	 //清空购物车
	 
	public void clearCart(){
		
		map.clear();
		total=0.0;
	}
	
	

	public Map<String, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
	
	
}
