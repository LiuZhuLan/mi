package pers.lan.mi.bean;

public class CartItem {
	
	private Product product;//商品对象
	private Integer	count;//购买数量
	private Double	subtotal=0.0;//小计
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return product.getShop_price()*count;
	}
	
	public CartItem(Product product, Integer count) {
		this.product = product;
		this.count = count;
	}
	public CartItem() { }
	
	public void incrCount() {
        count++;
        this.subtotal = product.getShop_price()*count;
    }

    public boolean decrCount() {
        count--;
        this.subtotal = product.getShop_price()*count;
        if (0 == count) {
            return true;
        }
        return false;
    }
	
	
}
