package app.of.k.controller;

import java.text.ParseException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import app.of.k.dto.Gift;
import app.of.k.dto.Send;
import app.of.k.service.FacebookService;
import app.of.k.service.GiftService;
import app.of.k.service.UserUtilityService;
import app.of.k.social.SecurityContext;

@Controller
public class HomeController {
	
	private static final Logger log = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	private GiftService giftService;
	
	@Autowired
	private UserUtilityService userUtilityService;
	
	@Autowired
	private FacebookService facebookService;
	
	@RequestMapping(value = "/")
	public ModelAndView home(Model model) throws ParseException {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/top");
		return modelAndView;
	}
	
	@RequestMapping(value = "/gift")
	public ModelAndView gift(Gift searchForm) throws ParseException {

		ModelAndView modelAndView = new ModelAndView();
		if(!searchForm.isEmpty()) {
			modelAndView.addObject("gifts", giftService.getGifts(searchForm));
		}
		modelAndView.addObject("searchForm", searchForm);
		modelAndView.setViewName("main/gift");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/gift_detail")
	public ModelAndView giftDetail(@RequestParam("id") String id, Gift searchForm) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gift", giftService.getGift(id));
		modelAndView.addObject("searchForm", searchForm);
		modelAndView.addObject("sendForm", facebookService.buildSendForm());
		modelAndView.setViewName("main/gift_detail");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/sendp1")
	public ModelAndView sendP1(Send sendForm) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("sendForm", sendForm);
		modelAndView.setViewName("main/sendp1");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/sendp2")
	public ModelAndView sendP2(Send sendForm) {
		facebookService.initPayList(sendForm);
		sendForm.setGift(giftService.getGift(sendForm.getGiftId()));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userFbId", userUtilityService.getUserFacebookIdByUserId(SecurityContext.getCurrentUser().getId()));
		modelAndView.addObject("sendForm", sendForm);
		modelAndView.setViewName("main/sendp2");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/sendp3", params = "pay")
	public ModelAndView sendP3(Send sendForm) {
		String currentUserId = userUtilityService.getUserFacebookIdByUserId(SecurityContext.getCurrentUser().getId());
		sendForm.setCurrentUserPayment(currentUserId);
		sendForm.setGift(giftService.getGift(sendForm.getGiftId()));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userFbId", userUtilityService.getUserFacebookIdByUserId(SecurityContext.getCurrentUser().getId()));
		modelAndView.addObject("sendForm", sendForm);
		modelAndView.setViewName("main/sendp2");
		return modelAndView;
	}
	
	
	
}
