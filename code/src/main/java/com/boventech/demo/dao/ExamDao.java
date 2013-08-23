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

package com.boventech.demo.dao;

import java.util.List;

import com.boventech.demo.entity.Exam;

/**
 * @author Administrator
 *
 */
public interface ExamDao extends BaseDao<Exam, String>{

    List<Exam> search(Exam exam, int page);
}
