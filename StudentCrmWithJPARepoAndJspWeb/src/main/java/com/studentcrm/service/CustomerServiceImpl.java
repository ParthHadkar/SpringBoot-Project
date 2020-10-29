package com.studentcrm.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studentcrm.dao.CustomerRepository;
import com.studentcrm.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	// Inject CustomerDAO
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public List<Customer> findAll() {
		List<Customer> customers = customerRepository.findAllByOrderByLastNameAsc();//.findAll();
		return customers;
	}

	@Override
	public void saveOrUpdate(Customer customer) {
		customerRepository.save(customer);
	}

	@Override
	public Customer findById(int id) {
		Optional<Customer> findById = customerRepository.findById(id);
		Customer customer = null;
		if(findById.isPresent()) {
			customer = findById.get();
		}
		return customer;
	}

	@Override
	public void deleteById(int id) {
		customerRepository.deleteById(id);
	}


}
