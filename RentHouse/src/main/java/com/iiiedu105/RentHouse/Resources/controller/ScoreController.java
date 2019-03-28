package com.iiiedu105.RentHouse.Resources.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.iiiedu105.RentHouse.Resources.service.ResourcesService;

@Controller
public class ScoreController {
	@Autowired
	ResourcesService service;
	@Autowired
	ServletContext context;

}
