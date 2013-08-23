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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boventech.demo.dao.CombinedQuestionDao;
import com.boventech.demo.entity.KnowledgePoint;
import com.boventech.demo.entity.CombinedQuestion;
import com.boventech.demo.service.KnowledgePointService;
import com.boventech.demo.service.CombinedQuestionService;
import com.boventech.demo.util.Paging;

/**
 * @author Administrator
 * 
 */
@Service
@Transactional
public class CombinedQuestionServiceImpl implements CombinedQuestionService {

    @Autowired
    private CombinedQuestionDao testQuestionDao;

    @Autowired
    private KnowledgePointService knowledgePointService;

    @Override
    public void save(CombinedQuestion testQuestion) {
        this.testQuestionDao.save(testQuestion);
    }

    @Override
    public KnowledgePoint findKnowledgePointById(String id) {
        return this.knowledgePointService.getById(id);
    }

    @Override
    public List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, Paging paging) {
        return this.testQuestionDao.search(testQuestion, difficultyOrder, knowledgePoints, paging.getPage());
    }
    
    @Override
    public CombinedQuestion findById(String id) {
        return this.testQuestionDao.findByID(id);
    }

    @Override
    public void update(CombinedQuestion combinedQuestion) {
        this.testQuestionDao.update(combinedQuestion);
    }

    @Override
    public void delete(CombinedQuestion combinedQuestion) {
        this.testQuestionDao.delete(combinedQuestion);
    }

    @Override
    public int getTotal(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, Paging paging) {
        return this.testQuestionDao
                .getTotal(testQuestion, difficultyOrder, knowledgePoints, paging.getPage());
    }

    @Override
    public List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, String id, Paging paging) {
        return this.testQuestionDao.search(testQuestion, difficultyOrder, knowledgePoints, paging.getPage(),
                id);
    }

    @Override
    public List<CombinedQuestion> findSimilarByKnowledge(CombinedQuestion combinedQuestion) {
        return this.testQuestionDao.findSimilarByKnowledge(combinedQuestion);
    }

}
