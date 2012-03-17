package app.of.k.controller;

import java.text.ParseException;
import java.util.ArrayList;
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
import app.of.k.service.FacebookService;
import app.of.k.social.SecurityContext;

@Controller
public class HomeController {
	
	private static final Logger log = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	private FacebookService facebookService;
	
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

		ModelAndView modelAndView = new ModelAndView();
		
		if(SecurityContext.userSignedIn()) {
			List<FacebookProfile> friends = facebook.friendOperations().getFriendProfiles(0, Integer.MAX_VALUE);
			modelAndView.addObject("bdayList", facebookService.getRecentBdayList(friends));
		}
		
		modelAndView.setViewName("main/home");
		return modelAndView;
	}
	
	
	
	
}
