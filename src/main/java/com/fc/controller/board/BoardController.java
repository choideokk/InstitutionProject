
package com.fc.controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.dto.board.ArticlePage;
import com.fc.dto.board.BoardDto;
import com.fc.dto.board.ReplyDto;
import com.fc.dto.facility.SearchDto;
import com.fc.service.board.BoardService;
import com.fc.service.board.ReplyService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;

	// 게시글 작성
	@GetMapping("/write")
	public String insertContents() {
		return "board/write";
	}

	@PostMapping("/write")
	public String insertContents_process(@ModelAttribute BoardDto boardDto,HttpSession session) {
		
		String currentUser = (String)session.getAttribute("loginId");
		
		boardDto.setWriter(currentUser);
		
		boardService.boardInsert(boardDto);
		

		return "redirect:/boardlist?pageNo=1";
	}

	// 전체 글 목록
	@GetMapping("/boardlist")
	public String boardList(Model model, @RequestParam (defaultValue = "1") int pageNo, @ModelAttribute SearchDto searchObj) {
		// public String boardList(Model model, @RequestParam(name = "postNo", required
		// = false) String postNo, @ModelAttribute SearchDto searchObj) {
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		System.out.println(searchObj.toString());
		int totalPage = 0;
		
		if (searchObj.getSearchTxt() == "" || searchObj.getSearchTxt() == null) {
			boardList = boardService.getBoardList();
			totalPage = boardService.getTotalPage();
		} else {
			boardList = boardService.findBoardListBySearchDto(searchObj);
			totalPage = boardList.size();
		}
		
		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int) pageNo, 7, 5, boardList);
		
		model.addAttribute("currentPageInfo", currentPageInfo);

		if (totalPage != 0 && pageNo > (int)Math.ceil(totalPage / 7.0)) {
			return "redirect:/boardlist";
		}
		
		return "board/boardlist";
	}
	
	@PostMapping("/boardlist") // 1
	public String postSearchedList(SearchDto searchDto, @RequestParam int pageNo, Model model) {
		// checkbox 체크되면 on, 아니면 null값으로 들어옴
		List<BoardDto> searchedList = boardService.findBoardListBySearchDto(searchDto);
		int totalPage = searchedList.size();
		
		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int) pageNo, 7, 5, searchedList);
		model.addAttribute("currentPageInfo", currentPageInfo);
		model.addAttribute("searchObj", searchDto);
		
		if (totalPage != 0 && pageNo > (int)Math.ceil(totalPage / 7.0)) {
			return "redirect:/boardlist";
		}
		
		return "board/boardlist";
	}
	
	
	@PostMapping("/searchBoard")
	public String postSearchedList2(SearchDto searchDto, @RequestParam int pageNo, Model model) {
		// checkbox 체크되면 on, 아니면 null값으로 들어옴
		List<BoardDto> searchedList = boardService.findBoardListBySearchDto(searchDto);
		int totalPage = boardService.getSearchedTotalPage();

		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int) pageNo, 7, 5, searchedList);

		model.addAttribute("currentPageInfo", currentPageInfo);
		model.addAttribute("searchObj", searchDto);
		return "board/boardlist";
	}
	
	// 게시판 상세보기 페이지
	@GetMapping("/detail")
	public String getdetail(@RequestParam("postno") int postno, Model model) {

		List<ReplyDto> list = replyService.list(postno);

		model.addAttribute("list", list);

		model.addAttribute("viewPage", boardService.getdetail(postno));

		BoardDto dto = boardService.getdetail(postno);
		boardService.viewCount(postno);

		return "board/viewPage";
	}

	// 신고 or 추천
	// 기존에 신고한적이 있는지 결과값을 리턴받아서 ajax로 전달..
	@ResponseBody
	@PostMapping("/action_proc")
	public int like_proc(@RequestParam("postno") int postno, @RequestParam("type") String type, HttpSession session) {
		Map<String, String> commonInfo = new HashMap<String, String>();
		commonInfo.put("sendUserId", (String) session.getAttribute("loginId"));
		commonInfo.put("type", type);
		commonInfo.put("targetPostNo", Integer.toString(postno));
		int result = boardService.controlBoardInfo(commonInfo);
		return result;
	}

	// 게시글 수정
	@GetMapping("/update")
	public String updateView(BoardDto boardDto, Model model) {
		System.out.println("여기니?");
		model.addAttribute("viewPage", boardDto);
		return "board/updateView";
	}

	@PostMapping("/update")
	public String update2(BoardDto boardDto, Model model) {
		BoardDto dto = boardService.getdetail(boardDto.getPostno());
		model.addAttribute("viewPage", dto);
		//boardService.boardUpdate(boardDto);
		return "board/updateView";
	}
	
	// 게시글 수정
	@PostMapping("/updateView")
	public String update(BoardDto boardDto) {
		int postno = boardDto.getPostno();
		boardService.boardUpdate(boardDto);
		return "redirect:/detail?postno=" + postno;
	}

	// 게시물 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam int postno, Model model) {

		boardService.boardDelte(postno);
		// model.addAttribute("deleteviewPage",postno);

		System.out.println("삭제 삭제 ");
		return "redirect:/boardlist?pageNo=1";

	}
}
