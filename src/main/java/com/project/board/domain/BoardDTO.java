package com.project.board.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class BoardDTO extends CommonDTO{

    /** 번호 (PK) */
    private Long idx;

    /** 제목 */
    private String title;

    /** 내용 */
    private String content;

    /** 작성자 */
    private String writer;

    /** 공지 여부 */
    private String noticeYn;

    /** 삭제 여부 */
    private String deleteYn;
}