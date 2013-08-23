package com.boventech.demo.entity.testpaper;

import com.boventech.demo.entity.SingleQuestion;

public abstract class PaperRule {

	private String id;
	
	private String name;
	
	public abstract boolean isConFormToRule(TestPaper testPaper,SingleQuestion question);

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
	
	
	

}
