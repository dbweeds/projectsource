package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarSearchVO {
	private String brand;
	private String type;
	private String chargetype;
	private String keyword;
	private InfoCriateria cri;
	
	public CarSearchVO() {
		this.brand = "";
		this.type = "";
		this.chargetype = "";
		this.keyword = "";	
	}
}
