package app.of.k.dto;

import java.util.LinkedHashMap;
import java.util.Map;

public class Send {
	
	private Long seqId;
	
	private String senderMainId;
	
	private String senderMainName;
	
	private String receiverId;
	
	private String receiverName;
	
	private String receiverAddress;
	
	private Map<String, String> senderList = new LinkedHashMap<String, String>();
	
	private Map<String, Integer> payList = new LinkedHashMap<String, Integer>();
	
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

	public Map<String, String> getSenderList() {
		return senderList;
	}

	public void setSenderList(Map<String, String> senderList) {
		this.senderList = senderList;
	}

	public Map<String, Integer> getPayList() {
		return payList;
	}

	public void setPayList(Map<String, Integer> payList) {
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
	
	
}
