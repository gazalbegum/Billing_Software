package com.billingsoftware.beans;

public class CustomerBean {

	private Long customerId;

	private String customerName;
	
	private String provisionID;

	private String customerAddress;

	private String customerPhone;

	private String customerEmailId;

	private String customerPaymentMode;

	private String customerCompanyName;

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	
	// provision ID Number getter and setter
	
		public String getProvisionID() {
			return provisionID;
		}

		public void setProvisionID(String provisionID) {
			this.provisionID = provisionID;
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

	public String getCustomerPaymentMode() {
		return customerPaymentMode;
	}

	public void setCustomerPaymentMode(String customerPaymentMode) {
		this.customerPaymentMode = customerPaymentMode;
	}

	public String getCustomerCompanyName() {
		return customerCompanyName;
	}

	public void setCustomerCompanyName(String customerCompanyName) {
		this.customerCompanyName = customerCompanyName;
	}

	@Override
	public String toString() {
		return "CustomerBean [customerId=" + customerId + ", customerName=" + customerName + ", provisionID="
				+ provisionID + ", customerAddress=" + customerAddress + ", customerPhone=" + customerPhone
				+ ", customerEmailId=" + customerEmailId + ", customerPaymentMode=" + customerPaymentMode
				+ ", customerCompanyName=" + customerCompanyName + "]";
	}

	
	
}
