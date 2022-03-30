package com.spring.board.vo;

import java.util.Map;

public class CheckBox {
	public int pageNo = 0;
	public int parameterCnt = 0; // 체크박스를 몇개 선택했는지
	
	/*
	   parameterCnt가 1인경우 ===>checkBox1
	    (1) 전체조회 (2) 일반, Q&A, 익명, 자유
	    
	   parameterCnt가 2인경우 ===>checkBox2
	    (1) 일반, Q&A
	    
	    parameterCnt가 3인경우 ===>checkBox3
	    일반, Q&A, 익명
	    
	    parameterCnt가 4인경우 ===> 따라서 checkBox4는 없다.
	     전체 조회 이므로 없음!!!
	 */
	
	
	
	public Map<String, String> selectCheckBox;

	public int getParameterCnt() {
		return parameterCnt;
	}

	public void setParameterCnt(int parameterCnt) {
		this.parameterCnt = parameterCnt;
	}

	public Map<String, String> getSelectCheckBox() {
		return selectCheckBox;
	}

	public void setSelectCheckBox(Map<String, String> selectCheckBox) {
		this.selectCheckBox = selectCheckBox;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
