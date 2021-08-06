package com.pro.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pro.entity.Order;
import com.pro.entity.OrderDetail;
import com.pro.entity.Report;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

	@Query("SELECT od \r\n"
			+ "FROM OrderDetail od \r\n"
			+ "WHERE od.order.id = ?1 \r\n")
	List<OrderDetail> findHistoryOrderDetails(Integer id);
	
	@Query("SELECT new Report(d.product.category, sum(d.price * d.quantity), sum(d.quantity)) "
			+ "FROM OrderDetail d GROUP BY d.product.category")
	List<Report> revenueByCategory();
}
