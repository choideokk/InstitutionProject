
package com.fc.controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	private static final Logger log = LogManager.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;


	@GetMapping("/test")
	public String test() {
		return "test";
	}

	@PostMapping("/test")
	public String test2() {


		return "test";
	}

	
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

		List<BoardDto> boardList;

		boardList = boardService.getBoardList();

		int totalPage = boardService.getTotalPage();
		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int) pageNo, 7, 5, boardList);

		model.addAttribute("currentPageInfo", currentPageInfo);
		model.addAttribute("totalPage", totalPage);

		return "board/boardlist";
	}

	// 게시글 검색 (수정중..)
	@PostMapping("/searchBoard")
	public String getSearchedList(SearchDto searchDto, @RequestParam int pageNo, Model model) {
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
		System.out.println(boardDto.toString());
		BoardDto dto = boardService.getdetail(boardDto.getPostno());
		model.addAttribute("viewPage", dto);
		boardService.boardUpdate(boardDto);
		return "board/updateView";
	}

	@PostMapping("/updateView")
	public String update(BoardDto boardDto) {
		int postno = boardDto.getPostno();
		System.out.println("여기로!!");
		log.info("게시물 수정 컨트롤러 시작");
		boardService.boardUpdate(boardDto);
		System.out.println("보드값 확인 " + boardDto.getTitle());
		System.out.println("보드값 확인 " + boardDto.getContent());
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
