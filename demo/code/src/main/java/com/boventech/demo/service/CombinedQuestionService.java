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
import com.boventech.demo.entity.CombinedQuestion;
import com.boventech.demo.util.Paging;

/**
 * @author Administrator
 * 
 */
public interface CombinedQuestionService {
    void save(CombinedQuestion testQuestion);

    KnowledgePoint findKnowledgePointById(String id);

    /**
     * 组合查询
     * 
     * @param type
     * @param difficulty
     * @param knowledgePointId
     * @param content
     * @param paging
     * @return
     */
    List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, Paging paging);

    List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, String id, Paging paging);

    CombinedQuestion findById(String id);

    void update(CombinedQuestion combinedQuestion);

    void delete(CombinedQuestion combinedQuestion);

    int getTotal(CombinedQuestion testQuestion, String difficultyOrder, List<KnowledgePoint> knowledgePoints,
            Paging paging);

    List<CombinedQuestion> findSimilarByKnowledge(CombinedQuestion combinedQuestion);
}
