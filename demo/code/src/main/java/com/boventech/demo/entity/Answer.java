/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: 90 $
 * $Author: peng.xia $
 * $LastChangedDate: 2013-03-18 17:07:03 +0800 (星期一, 18 三月 2013) $
 *
 */

package com.boventech.demo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "answer")
public class Answer {

    @Id
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
    @GeneratedValue(generator = "hibernate-uuid")
    private String id;

    // 选项
    private String content;

    // 是否为正确答案
    private boolean isRight;
    
    //对应的用户答题记录
    @ManyToMany(cascade = {CascadeType.ALL},mappedBy="answers")
    private List<UserAnswer> userAnswers;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     *            the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content
     *            the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the isRight
     */
    public boolean isRight() {
        return isRight;
    }

    /**
     * @param isRight
     *            the isRight to set
     */
    public void setRight(boolean isRight) {
        this.isRight = isRight;
    }

    /**
     * @return the userAnswers
     */
    public List<UserAnswer> getUserAnswers() {
        return userAnswers;
    }

    /**
     * @param userAnswers the userAnswers to set
     */
    public void setUserAnswers(List<UserAnswer> userAnswers) {
        this.userAnswers = userAnswers;
    }

    
}
