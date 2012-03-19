package app.of.k.dto;

import java.util.ArrayList;
import java.util.List;

public class Send {

	private Gift gift;
	
	private Long seqId;
	
	private String senderMainId;
	
	private String senderMainName;
	
	private String receiverId;
	
	private String receiverName;
	
	private String receiverAddress;
	
	private List<String> senderList = new ArrayList<String>();
	
	private List<Pay> payList;
	
	private Integer tempPayment;
	
	private String giftId;
	
	private boolean noAddress;
	
	private boolean noSponsor;

	public Long getSeqId() {
		return seqId;
	}

	public void setSeqId(Long seqId) {
		this.seqId = seqId;
	}

	public String getSenderMainId() {
		return senderMainId;
	}

	public void setSenderMainId(String senderMainId) {
		this.senderMainId = senderMainId;
	}

	public String getSenderMainName() {
		return senderMainName;
	}

	public void setSenderMainName(String senderMainName) {
		this.senderMainName = senderMainName;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public List<Pay> getPayList() {
		return payList;
	}

	public void setPayList(List<Pay> payList) {
		this.payList = payList;
	}

	public String getGiftId() {
		return giftId;
	}

	public void setGiftId(String giftId) {
		this.giftId = giftId;
	}

	public boolean isNoAddress() {
		return noAddress;
	}

	public void setNoAddress(boolean noAddress) {
		this.noAddress = noAddress;
	}

	public boolean isNoSponsor() {
		return noSponsor;
	}

	public void setNoSponsor(boolean noSponsor) {
		this.noSponsor = noSponsor;
	}
	
	public List<String> getSenderList() {
		return senderList;
	}

	public void setSenderList(List<String> senderList) {
		this.senderList = senderList;
	}
	
	public Gift getGift() {
		return gift;
	}

	public void setGift(Gift gift) {
		this.gift = gift;
	}

	public Integer getTempPayment() {
		return tempPayment;
	}

	public void setTempPayment(Integer tempPayment) {
		this.tempPayment = tempPayment;
	}
	
	public void setCurrentUserPayment(String currentUserId) {
		for(Pay payer : payList) {
			if(payer.getId().equals(currentUserId)) {
				payer.setPayment(payer.getPayment() + tempPayment);
				tempPayment = null;
				return;
			}
		}
	}
	
	public Integer getRemainingBill() {
		Integer remainingBill;
		if(this.gift != null) {
			remainingBill = gift.getPrice();
		} else {
			return null;
		}
		for(Pay payer : payList) {
			if(payer.getPayment() != null) {
				remainingBill -= payer.getPayment();
			}
		}
		return remainingBill;
	}
}
