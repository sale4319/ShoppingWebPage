package com.sale.webshopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sale.webshoppingbackend.dao.CategoryDAO;

@Controller
public class PageController {
	
	@Autowired //Spring dependency
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickHome", true);
		return mv;

	}

	@RequestMapping(value =  "/about" )
	public ModelAndView about() {

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;

	}
	@RequestMapping(value =  "/contact" )
	public ModelAndView contact() {

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;

	}
	// Demonstration of how to use @RequestParam and @PathVariable
	/*
	 * @RequestMapping(value = "/test") public ModelAndView test(@RequestParam(value
	 * = "greeting", required = false) String greeting) { if(greeting == null) {
	 * greeting = "hello there"; } ModelAndView mv = new ModelAndView("page");
	 * mv.addObject("greeting", greeting); return mv; }
	 * 
	 * @RequestMapping(value = "/test/{greeting}") public ModelAndView
	 * test(@PathVariable("greeting") String greeting) { if(greeting == null) {
	 * greeting = "hello there"; } ModelAndView mv = new ModelAndView("page");
	 * mv.addObject("greeting", greeting); return mv; }
	 */
}
