package com.project.board.controller;

import com.project.board.domain.BoardDTO;
import com.project.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/index.do")
    public String home() {
        return "index";
    }

    @GetMapping(value = "/board/view.do")
    public String boardView(@RequestParam("idx") Long idx, Model model) {

        if (idx == null) {
            System.out.println("삭제된 게시글입니다.");
            return "redirect:/board/list.do";
        }

        BoardDTO boardview = boardService.getBoardDetail(idx);
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
    public String RegisApi(final BoardDTO params) {
        try {
            boolean result = boardService.registerBoard(params);
            if (result == false) {
               System.out.println("등록 실패");
            }
        } catch (DataAccessException e) {
            System.out.println("데이터 베이스 문제 발생");
        } catch (Exception e) {
            System.out.println("시스템 문제 발생");
        }

        return "redirect:/board/list.do";
    }

    @GetMapping(value = "/board/list.do")
    public String boardList(Model model) {
        List<BoardDTO> boardlist = boardService.getBoardList();

        model.addAttribute("boardlist", boardlist);

        return "list";
    }
}
