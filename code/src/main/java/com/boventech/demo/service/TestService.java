package com.boventech.demo.service;

import com.boventech.demo.entity.Answer;

public interface TestService {
	
	void save(Answer answer);
	
	Answer update(Answer answer);
	 
	void delete(String id);

}
