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

import com.boventech.demo.entity.KnowledgePoint;

/**
 * @author Administrator
 * 
 */
public interface KnowledgePointService {
    void save(KnowledgePoint knowledgePoint);

    List<KnowledgePoint> findChild(String expression);

    List<KnowledgePoint> findAllParents();

    KnowledgePoint getById(String id);

    int findMaxSortCode(String coede);
}
