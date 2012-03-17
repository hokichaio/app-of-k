package app.of.k.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.ResourceBundle;

import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Service;

import app.of.k.service.FacebookService;

@Service("FacebookService")
public class FacebookServiceImpl implements FacebookService {
	
	private static final int DAYS = Integer.parseInt(ResourceBundle.getBundle("k").getString("days_as_recent_bday"));
	
	private static final int DAYS_IN_MILLISECOND = 1000*60*60*24*DAYS;

	public List<FacebookProfile> getRecentBdayList(List<FacebookProfile> friends) throws ParseException {
		
		List<FacebookProfile> bdayList = new ArrayList<FacebookProfile>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		long tomil = today.getTimeInMillis();
		for (FacebookProfile friend : friends) {
			String data = friend.getBirthday();
			if (data != null) {
				data = data.substring(0, 5);
				Calendar bday = Calendar.getInstance();
				bday.setTime(sdf.parse(data + "/" + year));
				long bmil = bday.getTimeInMillis();
				long dif = tomil-bmil;
				if(dif <= DAYS_IN_MILLISECOND && dif >= -DAYS_IN_MILLISECOND) {
					bdayList.add(friend);
				}
			}
		}
		
		return bdayList;
		
	}
	
}
