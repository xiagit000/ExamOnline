package com.boventech.demo.entity.testpaper;

import java.util.List;

import com.boventech.demo.entity.SingleQuestion;
import com.google.common.collect.Lists;

public class TestPaper {
	
	private String id;

	private String name;
	
	private List<SingleQuestion> questions=Lists.newArrayList();
	
	private List<PaperRule> paperRules=Lists.newArrayList();
	
	public String addQuestion(SingleQuestion question){
		for(PaperRule paperRule:this.getPaperRules()){
			if(!paperRule.isConFormToRule(this,question)){
				return paperRule.getName();
			}
		}
		this.getQuestions().add(question);
		return "";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SingleQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(List<SingleQuestion> questions) {
		this.questions = questions;
	}

	public List<PaperRule> getPaperRules() {
		return paperRules;
	}

	public void setPaperRules(List<PaperRule> paperRules) {
		this.paperRules = paperRules;
	}
	

}
