package com.studentcrm.service;

import java.util.List;

import com.studentcrm.entity.Customer;

public interface CustomerService {

	public List<Customer> findAll();
	
	public void saveOrUpdate(Customer customer);
	
	public Customer findById(int id);
	
	public void deleteById(int id);
	
}
