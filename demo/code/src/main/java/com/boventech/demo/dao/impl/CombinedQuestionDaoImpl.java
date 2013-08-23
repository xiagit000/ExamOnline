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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boventech.demo.dao.CombinedQuestionDao;
import com.boventech.demo.dao.ExamDao;
import com.boventech.demo.entity.Exam;
import com.boventech.demo.entity.KnowledgePoint;
import com.boventech.demo.entity.CombinedQuestion;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;

@Repository
public class CombinedQuestionDaoImpl extends AbstractBaseDaoImpl<CombinedQuestion, String> implements
        CombinedQuestionDao {

    @Autowired
    private ExamDao examDao;
    private String search="search";
    private String arg0=" or k.id=?";
    private String arg1=" and t.type = ?";
    private String arg2=" and t.content LIKE ?";
    private String arg3=" order by t.difficulty desc";
    private String arg4=" order by t.difficulty asc";

    /**
     * 查询所有
     */
    @Override
    public List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, int page) {
        String queryString = this.getQueryString(testQuestion, difficultyOrder, knowledgePoints, search);
        int count = this.getTotal(testQuestion, difficultyOrder, knowledgePoints, page);
        Object[] objects = this.getParameters(testQuestion, knowledgePoints);
        List<CombinedQuestion> questionList = this.executeQueryWithPaging(queryString, page,
                DEFAULT_PAGESIZE, objects);
        return new PaginateSupportArray<CombinedQuestion>(questionList, page, DEFAULT_PAGESIZE, count);
    }

    /**
     * 不包含此id的查询
     */
    @Override
    public List<CombinedQuestion> search(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, int page, String id) {
        String queryString = this
                .getQueryString(testQuestion, difficultyOrder, knowledgePoints, id, search);
        Object[] objects = this.getParameters(testQuestion, knowledgePoints, id);
        List<CombinedQuestion> questionList = this.executeQueryWithPaging(queryString, page,
                DEFAULT_PAGESIZE, objects);
        int count = this.getTotal(testQuestion, difficultyOrder, knowledgePoints, id, page);
        return new PaginateSupportArray<CombinedQuestion>(questionList, page, DEFAULT_PAGESIZE, count);
    }

    @Override
    public int getTotal(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, int page) {
        String queryString = this.getQueryString(testQuestion, difficultyOrder, knowledgePoints, "count");
        Object[] objects = this.getParameters(testQuestion, knowledgePoints);
        return this.executeCountQuery(queryString, objects);
    }

    @Override
    public int getTotal(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, String id, int page) {
        String queryString = this.getQueryString(testQuestion, difficultyOrder, knowledgePoints, id, "count");
        Object[] objects = this.getParameters(testQuestion, knowledgePoints, id);
        return this.executeCountQuery(queryString, objects);
    }

    /**
     * 根据参数拼凑查询语句
     */
    private String getQueryString(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, String action) {
        StringBuilder builder = null;
        StringBuilder builder2 = null;
        if (knowledgePoints.size() > 0) {
            builder = new StringBuilder(
                    "SELECT DISTINCT t from CombinedQuestion t join t.knowledgePoints k where (k.id=?");
            builder2 = new StringBuilder(
                    "select count(*) from CombinedQuestion t join t.knowledgePoints k where (k.id=?");
            for (int i = 1; i < knowledgePoints.size(); i++) {
                builder.append(arg0);
                builder2.append(arg0);
            }
            builder.append(")");
            builder2.append(")");

        } else {
            builder = new StringBuilder("from CombinedQuestion t where 1=1");
            builder2 = new StringBuilder("select count(*) from CombinedQuestion t where 1=1");
        }
        if (testQuestion.getType() != null) {
            builder.append(arg1);
            builder2.append(arg1);
        }
        if (!Strings.isNullOrEmpty(testQuestion.getContent())) {
            builder.append(arg2);
            builder2.append(arg2);
        }
        if (difficultyOrder.equals("desc")) {
            builder.append(arg3);
            builder2.append(arg3);
        } else {
            builder.append(arg4);
            builder2.append(arg4);
        }

        String queryString = builder.toString();
        String queryString2 = builder2.toString();

        return action.equals(search) ? queryString : queryString2;
    }

    private Object[] getParameters(CombinedQuestion testQuestion,
            List<KnowledgePoint> knowledgePoints) {
        List<Object> objects = Lists.newArrayList();
        if (knowledgePoints.size() > 0) {
            for (int i = 0; i < knowledgePoints.size(); i++) {
                objects.add(knowledgePoints.get(i).getId());
            }
        }
        if (testQuestion.getType() != null) {
            objects.add(testQuestion.getType());
        }
        if (!Strings.isNullOrEmpty(testQuestion.getContent())) {
            objects.add("%" + testQuestion.getContent() + "%");
        }
        return objects.toArray();
    }

    private Object[] getParameters(CombinedQuestion testQuestion,
            List<KnowledgePoint> knowledgePoints, String id) {
        List<Object> objects = Lists.newArrayList();
        if (knowledgePoints.size() > 0) {
            for (int i = 0; i < knowledgePoints.size(); i++) {
                objects.add(knowledgePoints.get(i).getId());
            }
            objects.add(id);
        } else {
            objects.add(id);
        }
        if (testQuestion.getType() != null) {
            objects.add(testQuestion.getType());
        }
        if (!Strings.isNullOrEmpty(testQuestion.getContent())) {
            objects.add("%" + testQuestion.getContent() + "%");
        }
        return objects.toArray();
    }

    private String getQueryString(CombinedQuestion testQuestion, String difficultyOrder,
            List<KnowledgePoint> knowledgePoints, String id, String action) {
        StringBuilder builder = null;
        StringBuilder builder2 = null;
        Exam exam = examDao.findByID(id);
        List<Exam> list = Lists.newArrayList();
        list.add(exam);
        if (knowledgePoints.size() > 0) {
            builder = new StringBuilder(
                    "SELECT DISTINCT t from CombinedQuestion t  join t.knowledgePoints k where (k.id=?");
            builder2 = new StringBuilder(
                    "select count(*) from CombinedQuestion t join t.knowledgePoints k where (k.id=?");
            for (int i = 1; i < knowledgePoints.size(); i++) {
                builder.append(arg0);
                builder2.append(arg0);
            }
            builder.append(") and ? not in elements(t.exams)");
            builder2.append(") and ? not in elements(t.exams)");
        } else {
            builder = new StringBuilder(
                    "SELECT DISTINCT t from CombinedQuestion t where ? not in elements(t.exams)");
            builder2 = new StringBuilder(
                    "select count(*) from CombinedQuestion t where ? not in elements(t.exams)");
        }

        if (testQuestion.getType() != null) {
            builder.append(arg1);
            builder2.append(arg1);
        }

        if (!Strings.isNullOrEmpty(testQuestion.getContent())) {
            builder.append(arg2);
            builder2.append(arg2);
        }
        if (difficultyOrder.equals("desc")) {
            builder.append(arg3);
            builder2.append(arg3);
        } else {
            builder.append(arg4);
            builder2.append(arg4);
        }

        String queryString = builder.toString();
        String queryString2 = builder2.toString();

        return action.equals(search) ? queryString : queryString2;
    }

    @Override
    public List<CombinedQuestion> findSimilarByKnowledge(CombinedQuestion combinedQuestion) {
        StringBuilder builder = null;
        List<Object> objects = Lists.newArrayList();
        builder= new StringBuilder("from CombinedQuestion t where t.id!=?");
        objects.add(combinedQuestion.getId());
        for (KnowledgePoint knowledgePoint : combinedQuestion.getKnowledgePoints()) {
            builder.append(" and ? MEMBER OF t.knowledgePoints");
            objects.add(knowledgePoint);
        }
        builder.append(" order by rand()");
        List<CombinedQuestion> questionList = this.executeQueryWithPaging(builder.toString(), 1, DEFAULT_PAGESIZE,
                objects.toArray());
        return questionList;
    }

}
