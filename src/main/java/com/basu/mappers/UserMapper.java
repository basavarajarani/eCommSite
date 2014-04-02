package com.basu.mappers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.basu.response.UserDto;
import com.basu.schemas.User;

public class UserMapper {

	public static UserDto map(User user){
		UserDto userDto = new UserDto();
		userDto.setId(user.getHjid());
		userDto.setUserName(user.getUserName());
		userDto.setFirstName(user.getUserFirstName());
		userDto.setLastName(user.getUserLastName());
		userDto.setPhone(user.getUserPhone());
		userDto.setFax(user.getUserFax());
		userDto.setEmail(user.getUserEmail());
		userDto.setAddress1(user.getUserAddress());
		userDto.setAddress2(user.getUserAddress2());
		userDto.setCity(user.getUserCity());
		userDto.setState(user.getUserState());
		userDto.setCountry(user.getUserCountry());
		if (user.isEnabled())
			userDto.setEnabled("Yes");
		else
			userDto.setEnabled("No");
		
		if (user.getAuthority() != null)
			userDto.setRole(user.getAuthority().getAuthority());
		return userDto;
	}
	
	public static List<UserDto> map(Page<User> userList){
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		for (User user : userList){
			userDtoList.add(map(user));
		}
		return userDtoList;
		
	}
}
