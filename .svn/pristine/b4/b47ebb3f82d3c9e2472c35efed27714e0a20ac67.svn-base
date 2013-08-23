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

import com.boventech.demo.entity.KnowledgePoint;
import com.boventech.demo.entity.CombinedQuestion;

/**
 * @author Administrator
 * 
 */
public interface CombinedQuestionDao extends BaseDao<CombinedQuestion, String> {
    /**
     * 组合查询
     */
    List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, int page);

    /**
     * 不包含本套试卷题目的查询
     */
    List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, int page, String id);

    int getTotal(CombinedQuestion testQuestion, String difficultyOrder, List<KnowledgePoint> knowledgePoints,
            int page);

    int getTotal(CombinedQuestion testQuestion, String difficultyOrder, List<KnowledgePoint> knowledgePoints,
            String id, int page);

    List<CombinedQuestion> findSimilarByKnowledge(CombinedQuestion combinedQuestion);
}
