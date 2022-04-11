package com.project.board.service;

import com.project.board.domain.BoardDTO;
import com.project.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class BoardServicelmpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    public boolean registerBoard(BoardDTO params) {
        int result = 0;

        if (params.getIdx() == null) {
            result = boardMapper.insertBoard(params);
        } else {
            result = boardMapper.updateBoard(params);
        }

        return (result == 1) ? true : false;
    }

    public BoardDTO getBoardDetail(Long idx) {
        return boardMapper.selectBoardDetail(idx);
    }

    public boolean deleteBoard(Long idx) {
        int result = 0;

        BoardDTO boardDTO = boardMapper.selectBoardDetail(idx);

        if (idx != null && "N".equals(boardDTO.getDeleteYn())) {
            result = boardMapper.deleteBoard(idx);
        }

        return (result == 1) ? true : false;
    }

    public List<BoardDTO> getBoardList() {

        List<BoardDTO> boardList = Collections.emptyList();

        int boardTotalCount = boardMapper.selectBoardTotalCount();

        if (boardTotalCount > 0) {
            boardList = boardMapper.selectBoardList();
        }
        return boardList;
    }

}
