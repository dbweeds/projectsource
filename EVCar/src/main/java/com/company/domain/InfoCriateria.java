package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InfoCriateria {

	  private int pageNum; //6개씩
	  private int amount;
	  
	  public InfoCriateria() {
		  this(1,6);
	  }

 	 public InfoCriateria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	  
}
