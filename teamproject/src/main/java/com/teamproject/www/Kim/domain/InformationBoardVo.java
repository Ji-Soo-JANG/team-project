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
    private Long boardNo;
    private String title;
    private String content;
    private String userId;
    private String nickName;
    private Integer boardTypeNo;
    private Date regdate;
    private Date updatedate;
    private Long views;
    private Long likes;
    private Long replycount;
    
    private String boardtype; // boardtype 컬럼과 매핑

    // 일간 best 용
    private String tbNo; 
    private String tbTitle; 
    private String tbViews; 
    private String tbBoardType; 
    
    // 첨부파일
    private List<AttachBoardDto> attachList;
}
