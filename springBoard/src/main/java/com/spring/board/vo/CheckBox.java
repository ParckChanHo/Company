package com.spring.board.vo;

import java.util.Map;

public class CheckBox {
	public int pageNo = 0;
	public int parameterCnt = 0; // üũ�ڽ��� � �����ߴ���
	
	/*
	   parameterCnt�� 1�ΰ�� ===>checkBox1
	    (1) ��ü��ȸ (2) �Ϲ�, Q&A, �͸�, ����
	    
	   parameterCnt�� 2�ΰ�� ===>checkBox2
	    (1) �Ϲ�, Q&A
	    
	    parameterCnt�� 3�ΰ�� ===>checkBox3
	    �Ϲ�, Q&A, �͸�
	    
	    parameterCnt�� 4�ΰ�� ===> ���� checkBox4�� ����.
	     ��ü ��ȸ �̹Ƿ� ����!!!
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
