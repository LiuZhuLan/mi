package pers.lan.mi.service;

import java.util.List;

import pers.lan.mi.bean.User;

public interface userService {

	User checkUsername(String username) throws Exception;
	
	void register(User user) throws Exception;
	
	void adminRegister(User user)  throws Exception;
	
	List<User> findAll() throws Exception;
	
	User getUser(String uid) throws Exception;
	
	void updateState(String uid)throws Exception;

	User active(String code) throws Exception;
	
	void delete(String uid) throws Exception;

	User login(String username, String password) throws Exception;
	
	void changePrivate(User user)throws Exception;
	
	int changePassword(String uid,String oldPassword,String password)throws Exception;
	

}
