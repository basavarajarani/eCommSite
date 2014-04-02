package com.basu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.basu.mappers.UserMapper;
import com.basu.response.JqgridResponse;
import com.basu.response.StatusResponse;
import com.basu.response.UserDto;
import com.basu.schemas.Authorities;
import com.basu.schemas.User;
import com.basu.service.ECommService;

@Controller
public class UserController {

	@Autowired
	public ECommService eCommService;

	@RequestMapping(value="createUser", method=RequestMethod.GET)
	public ModelAndView getCreateAccountForm()
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module","AccountCreationForm");
		modelAndView.addObject("user",new User());
		return modelAndView;
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="useroperations", method=RequestMethod.GET)
	public ModelAndView getUserOperationsForm()
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module","UserOperationsForm");
		return modelAndView;
	}



	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("user") User user, 
			ModelMap model) throws Exception {

		Authorities authorities = new Authorities();
		authorities.setUserName(user.getUserName());
		authorities.setAuthority("ROLE_USER");
		user.setEnabled(true);
		System.out.println("Name:"+user.getUserFirstName()+" "+user.getUserLastName()+" email:"+user.getUserEmail()+" phone:"+user.getUserPhone());
		String result = this.eCommService.createNewUserSignup(user,authorities);

		model.addAttribute("result", result);

		model.addAttribute("module","useradd");
		// return "UserAddResult";
		return "UserAddResult";
	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="addUserRecords", method=RequestMethod.POST)
	public @ResponseBody StatusResponse addUserRecords(
			@RequestParam(value="userName") String userName,
			@RequestParam(value="role") String role,
			@RequestParam(value="enabled") String enabled,
			@RequestParam(value="firstName")String firstName,
			@RequestParam(value="lastName")String lastName,
			@RequestParam(value="phone")String phone,
			@RequestParam(value="fax")String fax,
			@RequestParam(value="email") String email,
			@RequestParam(value="address1") String address1,
			@RequestParam(value="address2") String address2,
			@RequestParam(value="city") String city,
			@RequestParam(value="zipcode") String zipcode,
			@RequestParam(value="state") String state,
			@RequestParam(value="country") String country) throws Exception {
		System.out.println("Invoked addUserRecords");

		User user = new User();
		user.setUserName(userName);
		user.setUserFirstName(firstName);
		user.setUserLastName(lastName);
		user.setUserPhone(phone);
		user.setUserFax(fax);
		user.setUserEmail(email);
		user.setUserAddress(address1);
		user.setUserAddress2(address2);
		user.setUserCity(city);
		user.setUserState(state);
		user.setUserZip(zipcode);
		user.setUserCountry(country);
		if (enabled.equals("Yes"))
			user.setEnabled(true);
		else
			user.setEnabled(false);

		Authorities authority = new Authorities();
		authority.setAuthority(role);
		authority.setUserName(userName);
		user.setAuthority(authority);

		String result = this.eCommService.addUserFromAdmin(user);

		return new StatusResponse(true,result);
	}

	@Secured ("ROLE_ADMIN")
	@RequestMapping(value="getuserrecords", produces="application/json")
	public @ResponseBody JqgridResponse<UserDto> getUserRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value="filters", required=false) String filters,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="rows", required=false) Integer rows,
			@RequestParam(value="sidx", required=false) String sidx,
			@RequestParam(value="sord", required=false) String sord)

			{
		Pageable pageRequest = new PageRequest(page-1, rows);

		if (search==true) {
			return getFilteredUserRecords(filters, pageRequest);
		}

		Page<User> users = this.eCommService.getAllUsers(pageRequest);
		List<UserDto> userDtoList = UserMapper.map(users);
		JqgridResponse<UserDto> jqGridResponse = new JqgridResponse<UserDto>();
		jqGridResponse.setRows(userDtoList);
		jqGridResponse.setRecords(Long.valueOf(users.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(users.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(users.getNumber()+1).toString());
		return jqGridResponse;



			}



	private JqgridResponse<UserDto> getFilteredUserRecords(String filters,
			Pageable pageRequest) {
		// TODO Auto-generated method stub
		return null;
	}


}
