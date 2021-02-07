package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class BenefitVO {
	private int bno;
	private String carname;
	private int rowprice;
	private int highprice;
	private int support;	
}
