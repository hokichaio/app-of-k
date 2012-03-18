package app.of.k.controller;

import java.text.ParseException;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import app.of.k.service.FacebookService;
import app.of.k.social.SecurityContext;

@Controller
@RequestMapping(value = "/friends")
public class AsyncController {
	
	private static final Logger log = Logger.getLogger(AsyncController.class.getName());
	
	@Autowired
	private FacebookService facebookService;
	
	private final Facebook facebook;
	
	@Inject
	public AsyncController(Facebook facebook) {
		this.facebook = facebook;
	}

	@RequestMapping(value = "/facebook")
	public ModelAndView friends(Model model) throws ParseException {

		ModelAndView modelAndView = new ModelAndView();
		
		if(SecurityContext.userSignedIn()) {
			modelAndView.addObject("friends", facebookService.getFriends(SecurityContext.getCurrentUser().getId()));
			modelAndView.setViewName("async/friends");
			return modelAndView;
		}
		
		return null;
	}
	
}
