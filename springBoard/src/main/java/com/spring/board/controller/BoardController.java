package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeName;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	// 자바 코드에서 스크립트나 html이 들어간 것이 별로 좋은 코드가 아니다.
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// @RequestParam(value="a",required=true) List<String> as
	// List<String> checkBoxSelect
	// @RequestParam(value="checkBoxSelect",required=false),
	@RequestMapping(value = "/board/boardList.do",  method = RequestMethod.GET)
	public String boardList(Model model,PageVo pageVo,HttpServletRequest request,
			@RequestParam(value="checkBoxArray[]",required=false) List<String> checkBoxSelect) throws Exception{
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		// CODE_NAME 뿌려주기
		List<CodeName> codeName = boardService.SelectCodeName();
		
		int page = 1;
		int totalCnt = 0;
		
	
		//	pageVo.setPageNo(page);
		// 질문하기 ==> 이 if문이 안되어서 자꾸 null 오류가 난다.
		// 따라서 PageVO 파라미터에 update,Delete에 파라미터에 /board/boardList.do?pageNo=1
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
			System.out.println("pageVo.getPageNo(): "+pageVo.getPageNo());
			System.out.println("들어왔다!!!!");
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		// CODE_NAME을 중복되지 않게 뿌려주기!!!
		/*ArrayList<String> resultList = new ArrayList<String> ();
		
		for(int i=0; i<boardList.size(); i++) {
			String a = boardList.get(i).getBoardType(); 
			if(!resultList.contains(a)) {
				resultList.add(a);
				System.out.println(a);
			}
		}*/
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		model.addAttribute("codeName", codeName); //a01 a02 a03 a04 
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.POST)
	@ResponseBody
	public String CheckBoxboardList(Model model,PageVo pageVo,HttpServletRequest request,
			@RequestParam(value="checkBoxArray[]",required=false) List<String> checkBoxSelect) throws Exception{
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getCheckBoxSelect() != null) {
			List<String> PageVOcheckBoxSelect = pageVo.getCheckBoxSelect();
			for(int i=0; i<PageVOcheckBoxSelect.size(); i++){ // 체크 박스에 넘어온 것들을 출력해 주기
				System.out.println(PageVOcheckBoxSelect.get(i));
			}	
		}
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		result.put("boardList", boardList);
		result.put("totalCnt", totalCnt);
		result.put("pageNo", page);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		String result1 = commonUtil.getJsonCallBackString(" ", result);
		
		/* 
		 	{"totalCnt":10,
		 	 "pageNo":1,
		 	"boardList":[{"boardType":"a01","boardNum":3,"boardTitle":"333","boardComment":"3333","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"},{"boardType":"a01","boardNum":2,"boardTitle":"222","boardComment":"2222","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"},{"boardType":"a01","boardNum":1,"boardTitle":"111","boardComment":"1111","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"}
		 	]}
		 
		 */
		//System.out.println(result1);
		return result1;
	}
	
	
	/*
	 	HashMap<String, String> checkBoxResult = new HashMap<String, String>();
		checkBoxResult.put("pageNo", pageNo);
		checkBoxResult.put("parameterCnt", pageNo);
	*/
	
	
	
	
	
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdateView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	
	
	/*@RequestMapping(value = "/board/{boardType}/{boardNum}/boardDelete.do", method = RequestMethod.GET)
	public String boardDeleteView(Locale locale, Model model,HttpServletResponse response
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
			
		BoardVo boardVo = new BoardVo();
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		int resultCnt = boardService.deleteBoard(boardVo);
			
		String str_success= resultCnt > 0 ? "Y":"N";
		model.addAttribute("callbackMsg",str_success); //Y OR N

		//response.sendRedirect("/board/boardDelete.do?callbackMsg="+str_success);
		return "board/boardDelete";
	}*/
	
	
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo,HttpServletResponse response) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
				
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale,BoardVo boardVo,HttpServletResponse response) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
				
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/boardDeleteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDeleteAction(Locale locale,BoardVo boardVo,HttpServletResponse response) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
				
		int resultCnt = boardService.deleteBoard(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
}
