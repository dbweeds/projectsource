package com.company.domain;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class InfoPageVO {
	private int startPage;
	private int endPage;
	private int total;
	private boolean prev;
	private boolean next;
	private InfoCriateria cri;
	
	
	public InfoPageVO(InfoCriateria cri, int total) {
		this.total = total;
		this.cri=cri;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)*10);
		this.startPage = endPage-9;
		
		int realEnd=(int)(Math.ceil((total/1.0)/cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage =realEnd;
		}
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
		
	}
}
