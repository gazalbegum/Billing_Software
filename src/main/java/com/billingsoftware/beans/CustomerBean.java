package com.billingsoftware.beans;

public class CustomerBean {

	private Long customerId;

	private String customerName;
	
	private String customerGstIn;

	private String customerAddress;

	private String customerPhone;

	private String customerEmailId;

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	
	// provision ID Number getter and setter
	
		public String getcustomerGstIn() {
			return customerGstIn;
		}

		public void setcustomerGstIn(String customerGstIn) {
			this.customerGstIn = customerGstIn;
		}


	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmailId() {
		return customerEmailId;
	}

	public void setCustomerEmailId(String customerEmailId) {
		this.customerEmailId = customerEmailId;
	}

	@Override
	public String toString() {
		return "CustomerBean [customerId=" + customerId + ", customerName=" + customerName + ", customerGstIn="
				+ customerGstIn + ", customerAddress=" + customerAddress + ", customerPhone=" + customerPhone
				+ ", customerEmailId=" + customerEmailId + "]";
	}

	
	
}
