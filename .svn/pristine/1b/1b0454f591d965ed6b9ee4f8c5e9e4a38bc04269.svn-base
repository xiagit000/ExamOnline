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

package com.boventech.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boventech.demo.entity.CombinedQuestion;
import com.boventech.demo.entity.Exam;
import com.boventech.demo.entity.KnowledgePoint;
import com.boventech.demo.service.CombinedQuestionService;
import com.boventech.demo.service.ExamService;
import com.boventech.demo.util.Paging;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = "/exam")
public class ExamController {

    @Autowired
    private ExamService examService;

    @Autowired
    private CombinedQuestionService combinedQuestionService;

    /**
     * 返回到题库设置页面
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(Exam exam, Paging paging, ModelMap model) {
        List<Exam> examList = this.examService.search(exam, paging);
        model.addAttribute("examList", examList);
        return "/exam/index";
    }

    /**
     * 添加试卷
     */
    @RequestMapping(method = RequestMethod.POST)
    public String save(Exam exam) {
        this.examService.save(exam);
        return "redirect:/exam";
    }

    /**
     * 到试卷添加页面
     * 
     * @param exam
     * @return
     */
    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String editNew() {
        return "/exam/add";
    }

    /**
     * 管理页面
     * 
     * @return
     */
    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String edit(ModelMap model, @PathVariable String id) {
        Exam exam = this.examService.findById(id);
        model.addAttribute("exam", exam);
        return "/exam/edit";
    }
    
    /**
     * 预览试卷
     */
    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public String show(ModelMap model, @PathVariable String id) {
        Exam exam = this.examService.findById(id);
        int [] examInfo=this.examService.getExamInfo(exam);
        model.addAttribute("exam", exam);
        model.addAttribute("choices", examInfo[0]);
        model.addAttribute("rightOrWrongs", examInfo[1]);
        model.addAttribute("combinations", examInfo[2]);
        return "/exam/show";
    }
    
    /**
     * 删除试卷
     */
    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public String destory(ModelMap model, @PathVariable String id) {
        Exam exam = this.examService.findById(id);
        this.examService.delete(exam);
        return "redirect:/exam";
    }

    /**
     * 向试卷添加试题（更新操作）
     */
    @RequestMapping(value = "{id}", method = RequestMethod.PUT)
    public String update(ModelMap model, @PathVariable String id, String questionId) {
        String url="";
        Exam exam = this.examService.findById(id);
        CombinedQuestion combinedQuestion = this.combinedQuestionService.findById(questionId);
        if (exam.getCombinedQuestions().contains(combinedQuestion)) {
            exam.getCombinedQuestions().remove(combinedQuestion);
            url="/exam/{id}/edit";
        } else {
            exam.getCombinedQuestions().add(combinedQuestion);
            url="/exam/{id}/questionBank";
        }
        this.examService.update(exam);
        return "redirect:"+url;
    }

    /**
     * 遍历没有添加到试卷中的所有题目
     */
    @RequestMapping(value = "{id}/questionBank", method = RequestMethod.GET)
    public String bank(CombinedQuestion combinedQuestion, String order, String knowledgePointId,
            String knowledgePointContent, Paging paging, Model model, @PathVariable String id) {
        String difficultyOrder=order;
        if (difficultyOrder == null) {
            difficultyOrder = "desc";
        }

        // 知识点集合
        List<KnowledgePoint> knowledgePoints = Lists.newArrayList();
        KnowledgePoint knowledgePoint = null;
        if (!Strings.isNullOrEmpty(knowledgePointId)) {
            String[] ids = knowledgePointId.split(";");
            for (String sid : ids) {
                knowledgePoint = this.combinedQuestionService.findKnowledgePointById(sid);
                knowledgePoints.add(knowledgePoint);
            }
        }

        List<CombinedQuestion> questionList = this.combinedQuestionService.search(combinedQuestion,
                difficultyOrder, knowledgePoints, id, paging);
        Exam exam = this.examService.findById(id);
        model.addAttribute("questionList", questionList);
        model.addAttribute("exam", exam);
        return "/exam/questionBank/index";
    }

}
