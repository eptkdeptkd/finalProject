package cc.factory.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.QnaReplyDto;
import cc.factory.com.dto.QnaReplyPage;
import cc.factory.com.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping(value = "qna.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaList() {
		
		return "qnaList.tiles";
	}
	@ResponseBody
	@RequestMapping(value = "qnaData.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<QnaDto> qnaList(QnaParam qp, Model model) {

		int sn = qp.getPageNumber(); // 현재 페이지
		int start = sn * qp.getRecordCountPerPage() + 1; // 1 11 21
		int end = (sn + 1) * qp.getRecordCountPerPage(); // 10 20 30
		qp.setStart(start);
		qp.setEnd(end);
		List<QnaDto> list = service.getQnaList(qp);
		
		return list;
	}
	@ResponseBody
	@RequestMapping(value = "qnaCount.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int qnaCount(QnaParam qp) {
		int count = service.getQnaCount(qp);
		return count;
	}
	// 답글 갯수
	@ResponseBody
	@RequestMapping(value = "countReply.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int countReply(Model model, int seq) {
		int reCount = (int)service.countReply(seq);
		return reCount;
	}

	
	// 글 상세보기
	@RequestMapping(value = "qnadetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnadetail(int seq, QnaReplyPage qrg, Model model, HttpServletRequest req) {
		
		//게시글
		QnaDto dto = service.getQna(seq);		
		model.addAttribute("oneQna", dto);
		System.out.println(dto);
		
		//댓글		
		int sn = qrg.getPageNumber(); // 현재 페이지
		int start = sn * qrg.getRecordCountPerPage() + 1; // 1 11 21
		int end = (sn + 1) * qrg.getRecordCountPerPage(); // 10 20 30
		qrg.setQnaseq(seq);
		qrg.setStart(start);
		qrg.setEnd(end);
		List<QnaReplyDto> list = service.qnaReplyListData(qrg);
		model.addAttribute("relist", list);

		int totalRecordCount = service.getQnaReplyCount(seq);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", qrg.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		service.readQna(seq);
		
		return "qnaDetail.tiles";
	}
	
	// 글쓰기로 이동
	@RequestMapping(value = "qnawrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnawrite() {
		return "qnaWrite.tiles";
	}

	// 글쓰기
	@RequestMapping(value = "qnawriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnawriteAf(QnaDto dto, Model model) {

		System.out.println(model);
		System.out.println(dto);
		service.writeQna(dto);
		return "redirect:/qna.do";
	}
	
	// 글 수정 페이지로 이동
	@RequestMapping(value = "qnaupdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaupdate(QnaDto dto, Model model) {
		System.out.println(dto);
		QnaDto qdto = service.getQna(dto.getSeq());
		model.addAttribute("oneQna", qdto);
		return "qnaUpdate.tiles";
	}

	// 글 수정 후
	@RequestMapping(value = "qnaupdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaupdateAf(QnaDto dto) {
		service.updateQna(dto);
		return "redirect:/qnadetail.do?seq=" + dto.getSeq();
	}

	// 글삭제
	@RequestMapping(value = "qnadelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnadelete(int seq, Model model) {
		System.out.println(seq);

		service.deleteQnaReply(seq);
		service.deleteQna(seq);
		return "redirect:/qna.do";
	}
	
	// 댓글입력
	@RequestMapping(value = "qnareplywrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnareplywrite(QnaReplyDto dto) {

		System.out.println(dto);

		service.writeQnaReply(dto);
		return "redirect:/qnadetail.do?seq=" + dto.getQnaseq(); // qnaseq값 갖고 다시 향해야함
	}
	
	// 댓글삭제
	@RequestMapping(value = "qnareplyremove.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnareplyremove(int seq, int qnaseq) {

		service.removeQnaReply(seq);
		
		return "redirect:/qnadetail.do?seq=" + qnaseq;
	}
}
