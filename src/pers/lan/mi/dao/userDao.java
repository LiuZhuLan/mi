package pers.lan.mi.dao;

import java.util.List;

import pers.lan.mi.bean.User;

public interface userDao {

	User getUserByUsername(String username) throws Exception;
	
	void add(User user) throws Exception;
	
	List<User> findAll() throws Exception;
	
	User getByCode(String code) throws Exception;
	
	User getUserById(String uid) throws Exception;
	
	void updateState(User user)throws Exception;

	void update2(User user) throws Exception;
	
	void delete(String uid) throws Exception;

	User getByUsernameAndPwd(String username, String password) throws Exception;
	
	
	void changePassword(String oldPassword,String password)throws Exception;

	void update1(User user) throws Exception;

}
