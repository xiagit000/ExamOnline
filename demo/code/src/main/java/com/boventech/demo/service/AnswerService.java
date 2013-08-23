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

import com.boventech.demo.entity.Answer;

/**
 * @author peng.xia
 * 
 */
public interface AnswerService {
    Answer findById(String id);
}
