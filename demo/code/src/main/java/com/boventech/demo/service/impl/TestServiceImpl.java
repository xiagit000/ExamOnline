package com.boventech.demo.service.impl;

import org.springframework.stereotype.Service;

import com.boventech.demo.entity.Answer;
import com.boventech.demo.service.TestService;

@Service("answerService")
public class TestServiceImpl implements TestService {


    @Override
    public void save(Answer answer) {

    }

    @Override
    public Answer update(Answer answer) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

}
