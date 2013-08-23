/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: 83 $
 * $Author: peng.xia $
 * $LastChangedDate: 2013-03-06 17:06:02 +0800 (星期三, 06 三月 2013) $
 *
 */

package com.boventech.demo.service;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.boventech.demo.entity.AnswerRecord;
import com.boventech.demo.entity.Exam;
import com.google.common.collect.Lists;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:**/*Context.xml" })
public class ExamServiceTest {

    @Autowired
    private ExamService examService;
    
    @Test
    public void saveExam(){
        List<AnswerRecord> answerRecords = Lists.newArrayList();
        AnswerRecord answerRecord = new AnswerRecord();
        answerRecord.setCreateDate(new Date());
        answerRecords.add(answerRecord);
        
        Exam exam = new Exam();
        answerRecord.setExam(exam);
        exam.setContent("lzn");
        
        this.examService.save(exam);
    }
    
    @Test
    public void deleteExam(){
        Exam exam = this.examService.findById("4028d8ad3c0f2807013c0f280a9a0000");
        this.examService.delete(exam);
    }
}
