/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: 59 $
 * $Author: peng.xia $
 * $LastChangedDate: 2013-01-30 16:12:40 +0800 (星期三, 30 一月 2013) $
 *
 */

package com.boventech.demo.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "singleQuestion")
@PrimaryKeyJoinColumn(name = "questionId")
public class SingleQuestion extends BaseQuestion implements Serializable {

    private static final long serialVersionUID = 1L;

    // 选项答案
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "singleQuestion_id")
    private List<Answer> answers;

    // 所包含的知识点
    @ManyToMany(cascade = CascadeType.REFRESH)
    @JoinTable(name = "singleQuestion_knowledgePoint", inverseJoinColumns = @JoinColumn(name = "knowledgePoint_id", referencedColumnName = "id"), joinColumns = @JoinColumn(name = "singleQuestion_id", referencedColumnName = "id"))
    private List<KnowledgePoint> knowledgePoints;

    // 对应的用户答案
    @OneToMany(mappedBy="question")
    private List<UserAnswer> userAnswers;

    /**
     * @return the answers
     */
    public List<Answer> getAnswers() {
        return answers;
    }

    /**
     * @param answers
     *            the answers to set
     */
    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    /**
     * @return the knowledgePoint
     */
    public List<KnowledgePoint> getKnowledgePoints() {
        return knowledgePoints;
    }

    /**
     * @param knowledgePoint
     *            the knowledgePoint to set
     */
    public void setKnowledgePoints(List<KnowledgePoint> knowledgePoints) {
        this.knowledgePoints = knowledgePoints;
    }

    /**
     * @return the userAnswers
     */
    public List<UserAnswer> getUserAnswers() {
        return userAnswers;
    }

    /**
     * @param userAnswers
     *            the userAnswers to set
     */
    public void setUserAnswers(List<UserAnswer> userAnswers) {
        this.userAnswers = userAnswers;
    }

    /**
     * 用户答题的总次数
     */
    public int countAnswer() {
        return this.userAnswers.size();
    }

    /**
     * 用户答对的次数
     */
    public int countRight() {
        return count(1);
    }

    /**
     * 用户答半对的次数
     */
    public int countHalfRight() {
        return count(1/2);
    }

    /**
     * 用户答错的次数
     */
    public int countWrong() {
        return count(0);
    }

    private int count(double percent) {
        int count = 0;
        for (UserAnswer userAnswer : userAnswers) {
            if (userAnswer.getAccuracy() == percent) {
                count++;
            }
        }
        return count;
    }

}
