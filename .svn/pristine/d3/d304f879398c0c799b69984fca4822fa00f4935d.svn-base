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

import me.donnior.rtl.paginate.PaginateSupportArray;

import org.springframework.stereotype.Repository;

import com.boventech.demo.dao.ExamDao;
import com.boventech.demo.entity.Exam;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;

/**
 * @author Administrator
 * 
 */

@Repository
public class ExamDaoImpl extends AbstractBaseDaoImpl<Exam, String> implements ExamDao {

    @Override
    public List<Exam> search(Exam exam, int page) {
        StringBuilder builder = new StringBuilder("from Exam t where 1=1");
        List<Object> list = Lists.newArrayList();
        if (!Strings.isNullOrEmpty(exam.getContent())) {
            builder.append(" and content like ?");
            list.add("%" + exam.getContent() + "%");
        }
        String queryString = builder.toString();
        int count = this.executeCountQuery("select count(*) " + queryString, list.toArray());
        List<Exam> examList = this
                .executeQueryWithPaging(queryString, page, DEFAULT_PAGESIZE, list.toArray());
        return new PaginateSupportArray<Exam>(examList, page, DEFAULT_PAGESIZE, count);
    }

}
