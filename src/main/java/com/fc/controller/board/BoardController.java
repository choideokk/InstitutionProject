
package com.fc.controller.board;

import java.sql.Date;
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

	
	@RequestMapping("/test")
	public String index() {

		return "board/test";
	}

	@RequestMapping("/testboard")
	public String index2() {

		return "board/testboard";
	}

	
	
	
	@GetMapping("/write")
	public String insertContents() {

		log.info(" 글쓰기 페이지 진입했음");

		return "board/write";	

	}

	@PostMapping("/write")
	public String insertContents_process(@ModelAttribute BoardDto boardDto) {
		System.out.println(boardDto);
		int result = boardService.boardInsert(boardDto);
		System.out.println(result);
		return "redirect:/boardlist";
	}

		
	@GetMapping("/boardlist")
	public String boardList(Model model, @ModelAttribute SearchDto searchObj) {
	// public String boardList(Model model, @RequestParam(name = "postNo", required = false) String postNo, @ModelAttribute SearchDto searchObj) {

		//Integer 받는 경우 : 숫자형이 아닌경우에 바로 오류
		
		//String 받는 경우 : 일단 받고, 숫자형 체크 -> 이후 분기 처리 조절
		//String pt;
		List<BoardDto> boardList;
		
		if (searchObj.getSearchTxt() == "") {
			boardList = boardService.getBoardList();
		} else {
			boardList = boardService.findBoardListBySearchDto(searchObj);
		}
		
		model.addAttribute("boardList", boardList);
		
//		if (postNo == null) {
//			List<BoardDto> boardList = boardService.getBoardList();
//			model.addAttribute("boardList", boardList);
//		} else {
//	        int postNoInt = Integer.parseInt(postNo);
//	        
//			BoardDto boardDto = new BoardDto();
//			boardDto.setPostno(postNoInt);
//			List<BoardDto> boardList = boardService.getBoardListbyBoardNumber(boardDto);
//			model.addAttribute("boardList", boardList);
//	
//		}
		
		return "board/boardlist";
	}
	
	@PostMapping("/searchBoard")
	public String getSearchedList(SearchDto searchDto, Model model) {
		// checkbox 체크되면 on, 아니면 null값으로 들어옴
		List<BoardDto> searchedList = boardService.findBoardListBySearchDto(searchDto);
		model.addAttribute("boardList", searchedList);
		model.addAttribute("searchObj", searchDto);
		for (BoardDto l : searchedList) {
			System.out.println(l.toString());
		}
		return "board/boardlist";
	}
	
	
	//게시판 상세보기 페이지
	@GetMapping("/detail")
	public String getdetail(@RequestParam("postno") int postno , Model model) {
		
		List<ReplyDto> list = replyService.list(postno);

		model.addAttribute("list", list);
		
		model.addAttribute("viewPage",boardService.getdetail(postno));
		
		
		BoardDto dto =boardService.getdetail(postno);
		boardService.viewCount(postno);
		
		return "board/viewPage";
	}
	
	@PostMapping("/likes")
	public String likesUp(@RequestParam("postno") int postno , Model model, HttpSession session) {
		Map<String, String> likeInfo = new HashMap<String, String>();
		likeInfo.put("likeUserId", (String)session.getAttribute("loginId"));
		likeInfo.put("likePostNo", Integer.toString(postno));
//		model.addAttribute("viewPage",boardService.getdetail(postno));
		
		int result = boardService.likeBoard(likeInfo);
		if (result == 0) {
			System.out.println("추천 중복!");
		} else {
			System.out.println("정상 처리!");
		}
		// 좋아요 취소 기능..쩝
		return "redirect:/detail?postno=" + postno;
	}
	
	
	@GetMapping("/update")
	public String updateView(BoardDto boardDto, Model model) {
		model.addAttribute("viewPage", boardDto);
		return "board/updateView";
	}
	
	@PostMapping("/update")
	public String update2(@ModelAttribute BoardDto boardDto, Model model) {
		BoardDto dto =boardService.getdetail(boardDto.getPostno());
		model.addAttribute("viewPage", dto);
		boardService.boardUpdate(boardDto);
		return "board/updateView";
	}
	
	@PostMapping("/updateView")
	 public String update(BoardDto boardDto) {
		System.out.println("여기로!!");
        log.info("게시물 수정 컨트롤러 시작");
        boardService.boardUpdate(boardDto);
        System.out.println("보드값 확인 " + boardDto.getTitle());
        System.out.println("보드값 확인 " + boardDto.getContent());
        return "redirect:/boardlist";
    }
	
	//게시물 삭제
	
	@PostMapping("/delete")
	public String delete(@RequestParam int postno, Model model) {
	
		boardService.boardDelte(postno);
		
		System.out.println("삭제 삭제 ");		
		return "redirect:/boardlist";
	
	}
	
//	//페이징 처리 + 게시글 목록
//		@GetMapping("/listPage")
//		public String getArticlePage(HttpSession session, Model model, @RequestParam(defaultValue = "1", required = false) int num) throws Exception {
//			
//			//세션에 userId 에 admin을 넣고 테스트하기 위한 부분
//			//session.setAttribute("userId", "admin");
//			session.setAttribute("userId", "user1");
//			
//			//테스트 끝
//			
//			System.out.println("num : " + num);
//			
//			//게시물 총 갯수
//			int count = boardService.getArticleCount();
//			
//			//한 페이지에 출력할 게시물 갯수
//			int articleNum = 10;
//			
//			//하단 페이징 번호( 
//			int pageNum = (int) Math.ceil((double)count/articleNum);
//			
//			//출력할 게시물
//			int displayArticle = (num -1) * articleNum;
//			
//			// 한번에 출력할 페이징 번호의 갯수
//			int pageNumCnt = 10;
//			
//			// 표시되는 페이지 번호 중 마지막 번호
//			int endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
//
//			// 표시되는 페이지 번호 중 첫번째 번호
//			int startPageNum = endPageNum - (pageNumCnt - 1);
//			
//			//마지막 페이지 번호 = (올림)(현재 페이지 번호 / 한번에 표시할 페이지 갯수) * 한번에 표시할 페이지 갯수 
//			//시작 페이지 = 마지막 페이지 번호 - 한번에 표시할 페이지 갯수 + 1
//			
//			// 마지막 번호 재계산
//			int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
//			 
//			if(endPageNum > endPageNum_tmp) {
//			 endPageNum = endPageNum_tmp;
//			}
//			
//			boolean prev = startPageNum == 1 ? false : true;
//			boolean next = endPageNum * pageNumCnt >= count ? false : true;
//			
//			// 시작 및 끝 번호
//			model.addAttribute("startPageNum", startPageNum);
//			model.addAttribute("endPageNum", endPageNum);
//
//			// 이전 및 다음 
//			model.addAttribute("prev", prev);
//			model.addAttribute("next", next);
//			
//			//현재 페이지
//			model.addAttribute("select", num);
//																
//			List<BoardDto> articleList = null;		
//			articleList = boardService.getListPage(displayArticle, articleNum);
//			model.addAttribute("articleList", articleList);
//			model.addAttribute("pageNum", pageNum);
//			
//			return "listPage";
//		}
//	
	

	
	
	
//	@PostMapping("/detail")
//	public String detailProject(@ModelAttribute("boardDto") BoardDto boardDto, Model model,int postno) {
//
//		// 조회수 증가 하는 중
//		boardService.viewCount(boardDto.getViewcnt());
//		BoardDto dto = boardService.getdetail(postno);
//	    model.addAttribute("viewCnt", postno);	    
//	    
//		return "boardlist";
//		
//	}

//		@RequestMapping(value="/updateView",method=RequestMethod.POST)
//		public String board_update(@ModelAttribute("boardboard")BoardDto boardDto) {
//				
//				try {
//					boardService.updateBoard(boardDto);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				return "redirect:boardlist";
//			}
//			
//		
//		@RequestMapping(value="/updateView",method=RequestMethod.POST)
//		public String board_delete(@PathVariable("seq")int seq)
//		{
//			try {
//				boardService.deleteBoard(seq);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			return "redierct:boardlist";
//		}
//		
//		
//		}
	


	
	
			//1번 안됨 
	 /* @GetMapping("/updateView/{postno}")
	    public String updateView(@PathVariable int postno, Model model) {
	        log.info("게시물 수정 시작");
	        BoardDto dto = boardService.getdetail(postno);
	        model.addAttribute("update", dto);
	        return "updateView";
	    }
	  */

	/*
	    @PostMapping("/update")
	    public String update(BoardDto boardDto) {
	        log.info("게시물 수정 컨트롤러 시작");
	        //boardService.boardUpdate(boardDto);
	        System.out.println("보드값 확인 " + boardDto.getTitle());
	        System.out.println("보드값 확인 " + boardDto.getContent());
	        return "redirect:/boardlist";
	    }
	*/
}	
	
	
	//2번안됨 
	
//	@GetMapping("/update")
//	public String getUpdate(@RequestParam Integer postno, Model model) throws Exception {
//	    BoardDto data = boardService.getdetail(postno);
//	    model.addAttribute("data", data);
//	    return "updateView";
//	}
//
//	@PostMapping("/update")
//	public String postUpdate(@ModelAttribute BoardDto boardDto) throws Exception {
//	    boardService.update(boardDto);
//	    return "redirect:/boardlist";
//	}
	
//
//	
//	@GetMapping("/searchBoard")
//	public String searchBoardReservationMap(Model model, @RequestParam Map<String,String> map) {
//		// @RequestParam(name="searchKeyword", required = false) String searchKeyword) {
//		// //1번 방식
//		List<BoardDto> boardList = boardService.findBoardListBySearchKeywordMap(map);
//		model.addAttribute("boardList", boardList);
//
//		return "boardlist";
//	}
//
//	
//	@GetMapping("/searchBoard2")
//	public String searchBoardReservationMap2(Model model, @RequestParam Map<String, String> map) {
//
//
//		List<BoardDto> boardList = boardService.findBoardListBySearchKeywordMap2(map);
//		model.addAttribute("boardList", boardList);
//
//		log.debug("boardList end");
//
//		return "boardlist";
//	}



	
	

