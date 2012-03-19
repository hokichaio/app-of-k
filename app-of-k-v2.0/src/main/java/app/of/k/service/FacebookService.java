package app.of.k.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.social.facebook.api.FacebookProfile;

import app.of.k.dto.Send;

public interface FacebookService {
	
	public Send buildSendForm();

	public List<FacebookProfile> getRecentBdayList(List<FacebookProfile> friends) throws ParseException;
	
	public List<FacebookProfile> getFriends(String userId);
	
	public FacebookProfile getProfileById(String id);
	
	public void initPayList(Send sendForm);
	
}
