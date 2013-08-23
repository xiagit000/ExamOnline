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

import com.boventech.demo.dao.ExamDao;
import com.boventech.demo.entity.CombinedQuestion;
import com.boventech.demo.entity.Exam;
import com.boventech.demo.entity.BaseQuestion.Type;
import com.boventech.demo.service.ExamService;
import com.boventech.demo.util.Paging;

@Service
@Transactional
public class ExamServiceImpl implements ExamService {

    @Autowired
    private ExamDao examDao;

    @Override
    public void save(Exam exam) {
        this.examDao.save(exam);
    }

    @Override
    public Exam findById(String id) {
        return this.examDao.findByID(id);
    }

    @Override
    public void delete(Exam exam) {
        this.examDao.delete(exam);

    }

    @Override
    public List<Exam> search(Exam exam, Paging paging) {
        return this.examDao.search(exam, paging.getPage());
    }

    @Override
    public void update(Exam exam) {
        this.examDao.update(exam);
    }

    @Override
    public int[] getExamInfo(Exam exam) {
        int countChoice = 0;
        int countROW = 0;
        int countCombination = 0;
        for (CombinedQuestion question : exam.getCombinedQuestions()) {
            if (question.getType() == Type.COMBINATION_QUESTION) {
                countCombination++;
            }
            if (question.getType() == Type.MULTIPLE_CHOICE || question.getType() == Type.SINGLE_CHOICE) {
                countChoice++;
            }
            if (question.getType() == Type.RIGHT_OR_WRONG) {
                countROW++;
            }
        }
        return new int[]{ countChoice, countROW, countCombination };
    }

}
