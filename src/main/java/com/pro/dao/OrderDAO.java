package com.pro.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.pro.entity.Account;
import com.pro.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {
	
	Page<Order> findByAccount(Account account, Pageable pageable);

	
}
