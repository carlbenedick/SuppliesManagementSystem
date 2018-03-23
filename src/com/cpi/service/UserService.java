package com.cpi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.User;

public interface UserService {

	boolean login(HttpServletRequest request);

	void addToSession(HttpServletRequest request);

	List<User> getUsers(HttpServletRequest request);
}
