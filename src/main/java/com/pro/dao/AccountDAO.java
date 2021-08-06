package com.pro.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pro.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {

	@Query("SELECT acc FROM Account acc WHERE username = ?1 AND password = ?2")
	Account findByUsernameAndPassword(String username, String password);
	
	Account findByUsername(String username);
}
