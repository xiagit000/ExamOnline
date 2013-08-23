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

import java.util.Date;
import java.util.List;

import me.donnior.rtl.paginate.PaginateSupportArray;

import org.springframework.stereotype.Repository;

import com.boventech.demo.dao.AnswerRecordDao;
import com.boventech.demo.entity.AnswerRecord;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;

/**
 * @author peng.xia
 * 
 */
@Repository
public class AnswerRecordDaoImpl extends AbstractBaseDaoImpl<AnswerRecord, String> implements AnswerRecordDao {

    @Override
    public List<AnswerRecord> find(int page, Date startDate, Date endDate, String content) {
        StringBuilder builder = new StringBuilder("from AnswerRecord t where 1=1");
        List<Object> list = Lists.newArrayList();
        if (startDate != null) {
            builder.append(" and t.createDate BETWEEN ? and ?");
            list.add(startDate);
            list.add(endDate);
        }
        if (!Strings.isNullOrEmpty(content)) {
            builder.append(" and t.exam.content like ?");
            list.add("%" + content + "%");
        }
        builder.append(" order by t.createDate desc");
        String queryString = builder.toString();
        int count = this.executeCountQuery("select count(*) " + queryString, list.toArray());
        List<AnswerRecord> answerRecords = this.executeQueryWithPaging(queryString, page, DEFAULT_PAGESIZE,
                list.toArray());
        return new PaginateSupportArray<AnswerRecord>(answerRecords, page, DEFAULT_PAGESIZE, count);
    }

}
