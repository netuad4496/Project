package com.project.board.mapper;

import com.project.board.domain.BoardDTO;
import com.project.board.paging.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardMapper {

    public int insertBoard(BoardDTO params);

    public BoardDTO selectBoardDetail(Long idx);

    public int updateBoard(BoardDTO params);

    public int deleteBoard(Long idx);

    public List<BoardDTO> selectBoardList(BoardDTO params);

    public int selectBoardTotalCount(BoardDTO params);
}

