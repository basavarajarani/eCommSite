package com.basu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.basu.service.ECommService;

@Controller
public class FeaturedProductsController {

	@Autowired
	private ECommService eCommService;
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="FeaturedProductsPage", method=RequestMethod.GET)
	public ModelAndView getFeaturedProductsPage(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("AdminView");
		modelAndView.addObject("module","FeaturedProductsPage");
		return modelAndView;
	}
	
	
}
