package com.studentcrm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentcrm.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	
	// that it .... no need to write any code
	// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.query-methods.details
	
	public List<Customer> findAllByOrderByLastNameAsc();
	
}
