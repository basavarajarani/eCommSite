package com.basu.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.basu.common.GooglePhotoAccessor;
import com.basu.common.JqgridFilter;
import com.basu.common.JqgridObjectMapper;
import com.basu.common.ProductCategoryUtil;
import com.basu.mappers.ProductCategoryMapper;
import com.basu.mappers.UserMapper;
import com.basu.response.JqgridResponse;
import com.basu.response.ProductCategoryDto;
import com.basu.response.SideTreeNode;
import com.basu.response.StatusResponse;
import com.basu.response.UserDto;
import com.basu.schemas.Authorities;
import com.basu.schemas.Countries;
import com.basu.schemas.ProductCategory;
import com.basu.schemas.User;
import com.basu.service.ECommService;
import com.google.gdata.util.ServiceException;



@Controller
@SessionAttributes("myRequestObject")
public class ECommerceSiteController {

	@Autowired
	public ECommService eCommService;

	@ModelAttribute("myRequestObject")
	public MyCommandBean addStuffToRequestScope() {
		System.out.println("Inside of addStuffToRequestScope");
		MyCommandBean bean = new MyCommandBean("Hello World",42);
		return bean;
	}

	public ECommerceSiteController () {
		System.out.println("Controller constructor invoked");
	}


	@RequestMapping("/")
	public ModelAndView welcomePage(Model model, HttpServletRequest request, HttpSession session) throws IOException, ServiceException {

		String message = "Hello World, Spring 3.0!";


		//	

		ModelAndView modelAndView = new ModelAndView();
		UserDetails userDetails = null;
		String userFullName = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = null;
		if (!(auth instanceof AnonymousAuthenticationToken))
		{
			userDetails = (UserDetails) auth.getPrincipal();
			String userName = userDetails.getUsername();

			user = this.eCommService.getUserByUserName(userName);

			userFullName = user.getUserFirstName()+" "+user.getUserLastName();
		}



		if(user!=null && user.getAuthority().getAuthority().contains("ADMIN"))
		{
			modelAndView.setViewName("AdminView");
			modelAndView.addObject("module","Dashboard");
		} else {
			modelAndView.setViewName("index");
			modelAndView.addObject("module","WelcomePage");
		}

		modelAndView.addObject("userFullName",userFullName);
		//modelAndView.addObject("menudata", generateMenu()); 

		return modelAndView;
	}

	@Secured ("ROLE_ADMIN")
	@RequestMapping(value="getAlbumList", method=RequestMethod.GET)
	public @ResponseBody Map<String,String> getAlbumList() throws IOException, ServiceException
	{
		System.out.println("Retrieving google Albums");
		Map<String,String> googleAlbumList = GooglePhotoAccessor.retrieveAlbumNames();
		System.out.println(googleAlbumList);
		return googleAlbumList;
	}

	@Secured ("ROLE_ADMIN")
	@RequestMapping(value="getAlbumImages", method=RequestMethod.GET)
	public @ResponseBody Set<String> getProductImages(@RequestParam(value="albumId")String albumId) throws IOException, ServiceException {

		System.out.println("Retreiving google photos");
		Set<String> googlePhotoList = GooglePhotoAccessor.retreiveGooglePics(albumId);
		System.out.println("PhotoList:"+googlePhotoList);
		return googlePhotoList;
	}

	@RequestMapping(value="generateSideMenu", method=RequestMethod.GET)
	public @ResponseBody Set<SideTreeNode> generateSideMenu() {

		Set<ProductCategory> productCategoryListFromDb = eCommService.getAllTopLevelProductCategories();
		Set<SideTreeNode> sideTreeNodeList = new HashSet<SideTreeNode>();
		for (ProductCategory pc:productCategoryListFromDb){
			SideTreeNode sideTreeNode = new SideTreeNode();
			sideTreeNode.setId(pc.getHjid().intValue());
			sideTreeNode.setName(pc.getCategoryName());
			sideTreeNodeList.add(sideTreeNode);
			ProductCategoryUtil.allProductCategoryBuildSideTree(pc,sideTreeNodeList);
		}
		System.out.println("sideTreeNodeList:"+sideTreeNodeList);

		return sideTreeNodeList;

	}

	@RequestMapping(value="generateMenu", method=RequestMethod.GET)
	public @ResponseBody Set<String> generateMenu() {
		// TODO Auto-generated method stub
		Set<String> productCategoryListToJson = new HashSet<String>();
		System.out.println("Entering generateMenu");
		//		Set<ProductCategory> prodCatList =  this.eCommService.getProductCategoryDao().getUniqueProductCategories();
		if (eCommService==null)
			System.out.println("eCommService is null");
		Set<ProductCategory> productCategoryListFromDb = eCommService.getAllTopLevelProductCategories();

		for (ProductCategory productCategory:productCategoryListFromDb)
		{
			ProductCategoryUtil.allProductCategoryBuildTree(productCategory.getSubCategories(), 

					productCategoryListToJson,productCategory.getCategoryName()+"::"+productCategory.getHjid(),true);

		}
		System.out.println(productCategoryListToJson);
		return productCategoryListToJson;
	}


	@RequestMapping(value="retrieveCountries", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody String retrieveAllCountries() {

		System.out.println("Invoking retrieveCountries");
		return this.eCommService.retrieveAllCountries();
	}

	@RequestMapping(value="retrieveRoles", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody String retrieveRoles() {
		String rolesSelectString = "<select>";
		rolesSelectString += "<option value='ROLE_USER'>ROLE_USER</option>";
		rolesSelectString += "<option value='ROLE_ADMIN'>ROLE_ADMIN</option>";
		return rolesSelectString;
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		System.out.println("Invoking loginPage");
		return "loginPage";
	}

	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {

		System.out.println("Invoked loginerror");
		model.addAttribute("error", "true");
		return "loginPage";

	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {

		System.out.println("Invoked Logout");
		return "MainView";

	}
}
