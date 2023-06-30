package com.fc.dto.board;

import java.util.List;

//페이징 처리를 위한 클래스
//게시글 데이터와 페이징 관련 정보를 담고 있음
public class ArticlePage {
	//페이징 관련 멤버변수

	//전체 글의 행의 수
	private int total;

	//현재 페이지 번호
	private int currentPage;

	//전체 페이지 개수
	private int totalPages;

	//시작 페이지 번호
	private int startPage;

	//종료 페이지 번호
	private int endPage;

	//페이징의 개수
	private int pagingCount;

	//게시글 데이터
	private List<BoardDto> content;

	//생성자
	//size : 한 화면에 보여질 행의 수
	// 11, 1, 7, 5, list
	public ArticlePage(int total, int currentPage, int size, int pagingCount, List<BoardDto> content) {
		super();
		this.total = total; // 11
		this.currentPage = currentPage; // 1
		this.pagingCount = pagingCount; // 5
		//select 결과가 없다면..
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else { //select 결과가 있을 때
			//전체 페이지 개수 구하기(전체 글의 수/한 화면에 보여질 행의 수)
			//정수와 정수의 나눗셈 결과는 정수! 13 / 7 => 1
			totalPages = (int)Math.ceil(total / (double)size);

			//startPage : 이전 [1] [2] [3] [4] [5] 다음    일 때 1을 의미
			//startPage 공식 : 현재 페이지 / 페이징의 개수 * 페이징의 개수 + 1 
			startPage = currentPage / pagingCount * pagingCount + 1;
			//보정해줘야 할 경우는? 5 / 5 * 5 + 1 => 6 경우처럼
			//				현재페이지  % 5 == 0 일 때  (5, 10, 15처럼)

			if(currentPage % pagingCount == 0) {
				//startPage = startPage - 5(페이징의 개수);
				startPage -= pagingCount;
				//endPage : 이전 [1] [2] [3] [4] [5] 다음    일 때 5를 의미
			}

			endPage = startPage + (pagingCount-1);
			//보정해줘야 할 경우는? endPage > totalPages 일 때 (ex 5 > 3)
			//					endPage를 totalPages로 바꿔줘야 함 (ex 5를 3으로 바꾸자!)

			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
		if (((currentPage-1)*7) + size > total) {
			this.content = content.subList((currentPage-1)*size, total);
		} else if (((currentPage-1)*7) + size <= total) {
			this.content = content.subList((currentPage-1)*size, currentPage*size);			
		}

	}
	//전체 행의 수를 리턴
	//자바빈 클래스가 아니기 때문에 모든 멤버변수의 getter/setter메소드를 만들 필요는 없다.
	public int getTotal() {
		return this.total;
	}

	//select 결과가 없는가? true면 결과가 없다는 의미
	public boolean hasnoArticles() {
		return this.total == 0;
	}

	//select 결과가 있는가? true면 결과가 있다는 의미
	public boolean hasArticles() {
		return this.total > 0;
	}

	//현재 페이지 번호 리펀
	public int getCurrentPage() {
		return this.currentPage;
	}

	//전체 페이지의 개수 리턴
	public int getTotalPages() {
		return totalPages;
	}

	//데이터 VO List 리턴
	public List<BoardDto> getContent() {
		return this.content;
	}

	//목록 하단의 시작 번호를 리턴
	public int getStartPage() {
		return this.startPage;
	}

	//목록 하단의 종료 번호를 리턴
	public int getEndPage() {
		return this.endPage;
	}
	@Override
	public String toString() {
		return "ArticlePage [total=" + total + ", currentPage=" + currentPage + ", totalPages=" + totalPages
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", pagingCount=" + pagingCount + ", content="
				+ content + "]";
	}



}