/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: 90 $
 * $Author: peng.xia $
 * $LastChangedDate: 2013-03-18 17:07:03 +0800 (周一, 18 三月 2013) $
 *
 */

package com.boventech.demo.service;

import java.util.Date;
import java.util.List;

import com.boventech.demo.entity.Answer;
import com.boventech.demo.entity.AnswerRecord;
import com.boventech.demo.util.RecordAnalysis;
import com.boventech.demo.util.RecordStatistics;

/**
 * 答题记录业务
 * 
 * @author Blue
 * 
 */
public interface AnswerRecordService {
    AnswerRecord getAnswerRecord(String examId, String[] questionIds, String[] answerIds);

    Double getAccuracy(List<Answer> standerAnswer, List<Answer> answers);

    void save(AnswerRecord answerRecord);

    AnswerRecord findById(String id);

    List<AnswerRecord> findAll(int page, Date startDate, Date endDate, String content);

    RecordStatistics getStatistics(AnswerRecord answerRecord);

    RecordAnalysis getAnalysis(AnswerRecord answerRecord);
}
