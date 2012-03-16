package app.of.k.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import app.of.k.dto.Friend;
import app.of.k.dto.UserScore;
import app.of.k.mapper.UserScoreServiceMapper;

@Controller
public class HomeController {
	
	private static final Logger log = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	private UserScoreServiceMapper userScoreServiceMapper;
	
	@Autowired
	private UsersConnectionRepository usersConnectionRepository;
	
	private final Facebook facebook;
	
	@Inject
	public HomeController(Facebook facebook) {
		this.facebook = facebook;
	}

	@RequestMapping(value = "/")
	public ModelAndView home(Model model) throws ParseException {

		List<FacebookProfile> friends = facebook.friendOperations().getFriendProfiles(0, Integer.MAX_VALUE);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		List<Friend> bdayList = new ArrayList<Friend>();
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		long tomil = today.getTimeInMillis();
		int i = 0;
		for (FacebookProfile friend : friends) {
			String data = friend.getBirthday();
			if (data != null) {
				data = data.substring(0, 5);
				Calendar bday = Calendar.getInstance();
				bday.setTime(sdf.parse(data + "/" + year));
				long bmil = bday.getTimeInMillis();
				long dif = tomil-bmil;
				if(dif <= 1000000000 && dif >= -1000000000) {
					
					log.info(i + friend.getName() + dif);
				}
				

			}

		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/home");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/post-start")
	public ModelAndView postStart(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/postStart");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/post-complete", method = RequestMethod.POST)
	public ModelAndView postComplete(@ModelAttribute("postContent") String postContent, HttpServletRequest request) {
		
		log.info(facebook.userOperations().getUserProfile().getName());
		
		facebook.feedOperations().updateStatus(postContent);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/postComplete");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/send-score", method = RequestMethod.POST)
	public void sendScore(@ModelAttribute("score") long score, HttpServletRequest request) {
		
		String userId = facebook.userOperations().getUserProfile().getId();
		UserScore user = userScoreServiceMapper.getUser(userId);
		if(user == null) {
			user = new UserScore();
			user.setId(userId);
			user.setScore(score);
			userScoreServiceMapper.insert(user);
		} else {
			user.setScore(user.getScore() + score);
			userScoreServiceMapper.updateScore(user);
		}
		
	}
	
}
