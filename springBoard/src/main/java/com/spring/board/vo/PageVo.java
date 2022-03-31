package com.spring.board.vo;

import java.util.ArrayList;
import java.util.List;

public class PageVo {
	List<String> checkBoxSelect;
	public int pageNo = 0;
	
	public List<String> getCheckBoxSelect() {
		return checkBoxSelect;
	}

	public void setCheckBoxSelect(List<String> checkBoxSelect) {
		this.checkBoxSelect = checkBoxSelect;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
