package com.teamproject.www.Kim.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class InformationBoardVo {
    private Long b_i_no;
    private String title; // 일간 best 용
    private String views; // 일간 best 용
    private String b_ib_no;
    private String boardName; // 일간 best 용 게시판 이름
    private Date regdate; // 공지 두개 노출용
    private Long b_a_no; // 공지 두개  링크용
    private String b_i_title;
    private String b_i_content;
    private String b_i_writer;
    private Date b_i_regdate;
    private Date b_i_updatedate;
    private String b_i_category;
    private Integer b_i_recommended;
    private Integer b_i_views;
    private Integer replycnt;
    
    // 첨부파일 - <input name="attachList[]">
 	private List<AttachBoardDto> attachList;
}
