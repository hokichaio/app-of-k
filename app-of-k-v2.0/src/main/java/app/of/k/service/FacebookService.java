package app.of.k.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.social.facebook.api.FacebookProfile;

public interface FacebookService {

	public List<FacebookProfile> getRecentBdayList(List<FacebookProfile> friends) throws ParseException;
	
}
