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

package com.boventech.demo.service;

import java.util.List;

import com.boventech.demo.entity.Exam;
import com.boventech.demo.util.Paging;

/**
 * @author Administrator
 * 
 */
public interface ExamService {

    void save(Exam exam);
    
    Exam findById(String id);
    
    void delete(Exam exam);
    
    List<Exam> search(Exam exam, Paging paging);
    
    void update(Exam exam);
    
    int[] getExamInfo(Exam exam);
}
