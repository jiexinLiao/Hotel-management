package com.hotel.hotel.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 酒店预约对象 hotel_book
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelBook extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约id */
    private Long bookId;
    /** 预约编码*/
    private String bookCode;

    /** 房间类型id */
    @Excel(name = "房间类型id")
    private Long roomTypeId;

    /** 房间id */
    @Excel(name = "房间id")
    private Long roomId;

    /** 入住时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date inTime;

    /** 离开时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "离开时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date outTime;

    /** 预约人 */
    @Excel(name = "预约人")
    private String bookName;

    /** 预约人手机 */
    @Excel(name = "预约人手机")
    private String bookPhone;

    /** 预约人邮箱 */
    @Excel(name = "预约人邮箱")
    private String bookEmail;

    /** 是否入住，1是 0否 */
    @Excel(name = "是否入住，1是 0否")
    private Integer moveIn;

    /** 是否离开，1是 0否 */
    @Excel(name = "是否离开，1是 0否")
    private Integer moveOut;

    /**
     * 选择的时间拿来判断是否在入住与离开的时间区间
     */
    private Date judgeTime1;
    private Date judgeTime2;

    private String roomTypeName;


    public String getBookCode() {
        return bookCode;
    }

    public void setBookCode(String bookCode) {
        this.bookCode = bookCode;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public Integer getMoveIn() {
        return moveIn;
    }

    public void setMoveIn(Integer moveIn) {
        this.moveIn = moveIn;
    }

    public Integer getMoveOut() {
        return moveOut;
    }

    public void setMoveOut(Integer moveOut) {
        this.moveOut = moveOut;
    }

    public Date getJudgeTime1() {
        return judgeTime1;
    }

    public void setJudgeTime1(Date judgeTime1) {
        this.judgeTime1 = judgeTime1;
    }

    public Date getJudgeTime2() {
        return judgeTime2;
    }

    public void setJudgeTime2(Date judgeTime2) {
        this.judgeTime2 = judgeTime2;
    }

    public void setBookId(Long bookId)
    {
        this.bookId = bookId;
    }

    public Long getBookId() 
    {
        return bookId;
    }
    public void setRoomTypeId(Long roomTypeId) 
    {
        this.roomTypeId = roomTypeId;
    }

    public Long getRoomTypeId() 
    {
        return roomTypeId;
    }
    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setInTime(Date inTime) 
    {
        this.inTime = inTime;
    }

    public Date getInTime() 
    {
        return inTime;
    }
    public void setOutTime(Date outTime) 
    {
        this.outTime = outTime;
    }

    public Date getOutTime() 
    {
        return outTime;
    }
    public void setBookName(String bookName) 
    {
        this.bookName = bookName;
    }

    public String getBookName() 
    {
        return bookName;
    }
    public void setBookPhone(String bookPhone) 
    {
        this.bookPhone = bookPhone;
    }

    public String getBookPhone() 
    {
        return bookPhone;
    }
    public void setBookEmail(String bookEmail) 
    {
        this.bookEmail = bookEmail;
    }

    public String getBookEmail() 
    {
        return bookEmail;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("bookId", getBookId())
            .append("roomTypeId", getRoomTypeId())
            .append("roomId", getRoomId())
            .append("inTime", getInTime())
            .append("outTime", getOutTime())
            .append("bookName", getBookName())
            .append("bookPhone", getBookPhone())
            .append("bookEmail", getBookEmail())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
