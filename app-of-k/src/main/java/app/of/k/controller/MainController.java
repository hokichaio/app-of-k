package app.of.k.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.Page;
import org.springframework.social.facebook.api.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import app.of.k.dto.RankingModel;

@Controller
public class MainController {

	private final Facebook facebook;
	
	@Inject
	public MainController(Facebook facebook) {
		this.facebook = facebook;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		List<Reference> friends = facebook.friendOperations().getFriends();
		List<RankingModel> ranking = new ArrayList<RankingModel>();
		
		List<Page> likes = facebook.likeOperations().getActivities();

		
		for(int i=5; i>0; i--) {
			RankingModel rm = new RankingModel();
			rm.setUser(friends.get(i));
			rm.setScore(i*15);
			ranking.add(rm);
		}
		
		int hearts = 35;
		
		model.addAttribute("heart", hearts);
		model.addAttribute("ranking", ranking);
		model.addAttribute("likes", likes);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/home");
		return modelAndView;
	}
	
	@RequestMapping(value = "/top")
	public ModelAndView top(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/top");
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
		
//		facebook.feedOperations().updateStatus(postContent);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/postComplete");
		return modelAndView;
		
	}
}
