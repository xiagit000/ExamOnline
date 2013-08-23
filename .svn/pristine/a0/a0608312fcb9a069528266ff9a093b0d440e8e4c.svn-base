/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: Rev $
 * $Author: Author $
 * $LastChangedDate: LastChangedDate $
 *
 */

package com.boventech.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boventech.demo.dao.AnswerDao;
import com.boventech.demo.entity.Answer;
import com.boventech.demo.service.AnswerService;

/**
 * @author peng.xia
 * 
 */
@Service
@Transactional
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerDao answerDao;

    @Override
    public Answer findById(String id) {

        return this.answerDao.findByID(id);
    }
}
