package com.project.board.controller;

import com.project.board.constant.Method;
import com.project.board.domain.BoardDTO;
import com.project.board.service.BoardService;
import com.project.board.util.UiUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
public class BoardController extends UiUtils {

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/index.do")
    public String home() {
        return "index";
    }

    @GetMapping(value = "/board/view.do")
    public String boardView(@RequestParam("idx") Long idx, Model model) {

        if (idx == null) {
            showMessageWithRedirect("올바르지 않은 접근입니다.", "/board/list.do", Method.GET, null, model);
        }
        BoardDTO boardview = boardService.getBoardDetail(idx);

        if (boardview == null || "Y".equals(boardview.getDeleteYn())) {
            return showMessageWithRedirect("없는 게시글이거나 이미 삭제된 게시글입니다.", "/board/list.do", Method.GET, null, model);
        }
        model.addAttribute("boardview", boardview);

        return "view";
    }

    @GetMapping(value = "/board/write.do")
    public String openBoardWrite(@RequestParam(value = "idx", required = false) Long idx, final BoardDTO params, Model model) {

        if (idx == null) {
            model.addAttribute("params", new BoardDTO());
        } else {
            BoardDTO boardDTO = boardService.getBoardDetail(idx);
            model.addAttribute("params", boardDTO);
        }

        return "write";
    }

    @PostMapping(value = "/board/RegisApi")
    public String RegisApi(final BoardDTO params, Model model) {
        try {
            boolean result = boardService.registerBoard(params);
            if (result == false) {
                showMessageWithRedirect("등록 실패.", "/board/list.do", Method.GET, null, model);
            }
        } catch (DataAccessException e) {
            showMessageWithRedirect("데이터 베이스 문제 발생.", "/board/list.do", Method.GET, null, model);
            e.printStackTrace();
            log.error("Exception ERROR: {} ", e.getMessage());
            throw e;

        } catch (Exception e) {
            showMessageWithRedirect("시스템 문제 발생.", "/board/list.do", Method.GET, null, model);
            e.printStackTrace();
            log.error("Exception ERROR: {} ", e.getMessage());
            throw e;
        }

        return showMessageWithRedirect("게시글 등록 완료되었습니다.", "/board/list.do", Method.GET, null, model);
    }

    @PostMapping(value = "/board/boardDeleteApi")
    public String boardDeleteApi(@RequestParam("idx") Long idx, Model model) {

        try {
            boolean result = boardService.deleteBoard(idx);
            if (result == false) {
                showMessageWithRedirect("삭제 실패.", "/board/list.do", Method.GET, null, model);
            }
        } catch (DataAccessException e) {
            showMessageWithRedirect("데이터 베이스 문제 발생.", "/board/list.do", Method.GET, null, model);
            e.printStackTrace();
            log.error("Exception ERROR: {} ", e.getMessage());
            throw e;

        } catch (Exception e) {
            showMessageWithRedirect("시스템 문제 발생.", "/board/list.do", Method.GET, null, model);
            e.printStackTrace();
            log.error("Exception ERROR: {} ", e.getMessage());
            throw e;
        }

        return showMessageWithRedirect("게시글 삭제가 완료되었습니다.", "/board/list.do", Method.GET, null, model);
    }

    @GetMapping(value = "/board/list.do")
    public String boardList(Model model) {
        List<BoardDTO> boardlist = boardService.getBoardList();

        model.addAttribute("boardlist", boardlist);

        return "list";
    }
}
