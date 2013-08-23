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

package com.boventech.demo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boventech.demo.dao.KnowledgePointsDao;
import com.boventech.demo.entity.KnowledgePoint;

/**
 * @author Administrator
 * 
 */
@Repository
public class KnowledgePointsDaoImpl extends AbstractBaseDaoImpl<KnowledgePoint, String> implements
        KnowledgePointsDao {

    /*
     * 查询节点所属的子知识点
     */
    @Override
    public List<KnowledgePoint> findChild(String expression) {
        String queryString = "from KnowledgePoint where regexp(sortCode,?)=1";
        Object[] objects = { "^" + expression + "-[0-9]*$" };
        return executeQueryWithoutPaging(queryString, objects);
    }

    @Override
    public List<KnowledgePoint> findAllParents() {
        String queryString = "from KnowledgePoint where regexp(sortCode,'^[0-9]*$')=1";
        return executeQueryWithoutPaging(queryString);
    }
}
