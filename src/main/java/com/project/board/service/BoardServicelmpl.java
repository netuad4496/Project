package com.project.board.service;

import com.project.board.domain.BoardDTO;
import com.project.board.mapper.BoardMapper;
import com.project.board.paging.Criteria;
import com.project.board.paging.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
public class BoardServicelmpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    @Transactional(rollbackFor = Exception.class)
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

    @Transactional(rollbackFor = Exception.class)
    public boolean deleteBoard(Long idx) {
        int result = 0;

        BoardDTO boardDTO = boardMapper.selectBoardDetail(idx);

        if (idx != null && "N".equals(boardDTO.getDeleteYn())) {
            result = boardMapper.deleteBoard(idx);
        }

        return (result == 1) ? true : false;
    }

    public List<BoardDTO> getBoardList(BoardDTO params) {

        List<BoardDTO> boardList = Collections.emptyList();

        int boardTotalCount = boardMapper.selectBoardTotalCount(params);

        PaginationInfo paginationInfo = new PaginationInfo(params);
        paginationInfo.setTotalRecordCount(boardTotalCount);

        params.setPaginationInfo(paginationInfo);

        if (boardTotalCount > 0) {
            boardList = boardMapper.selectBoardList(params);
        }
        return boardList;
    }

}
