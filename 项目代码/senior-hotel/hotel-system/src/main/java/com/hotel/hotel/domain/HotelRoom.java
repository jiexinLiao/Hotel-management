package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 酒店房间对象 hotel_room
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房间id */
    private Long roomId;

    /** 房间号 */
    @Excel(name = "房间号")
    private Long roomNum;

    /** 房间类型id */
    @Excel(name = "房间类型id")
    private Long roomTypeId;

    /** 房间价格 */
    @Excel(name = "房间价格")
    private Integer roomPrice;

    /** 封面 */
    @Excel(name = "封面")
    private String roomCover;

    /** 房间介绍 */
    @Excel(name = "房间介绍")
    private String roomIntroduce;

    /** 房间详情 */
    @Excel(name = "房间详情")
    private String roomDetail;

    /** 是否上架（1是 0否） */
    @Excel(name = "是否上架", readConverterExp = "1=是,0=否")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;


    private String roomTypeName; // 房间类型名字


    public HotelRoom() {
    }

    public HotelRoom(Long roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setRoomNum(Long roomNum) 
    {
        this.roomNum = roomNum;
    }

    public Long getRoomNum() 
    {
        return roomNum;
    }
    public void setRoomTypeId(Long roomTypeId) 
    {
        this.roomTypeId = roomTypeId;
    }

    public Long getRoomTypeId() 
    {
        return roomTypeId;
    }
    public void setRoomPrice(Integer roomPrice) 
    {
        this.roomPrice = roomPrice;
    }

    public Integer getRoomPrice() 
    {
        return roomPrice;
    }
    public void setRoomCover(String roomCover) 
    {
        this.roomCover = roomCover;
    }

    public String getRoomCover() 
    {
        return roomCover;
    }
    public void setRoomIntroduce(String roomIntroduce) 
    {
        this.roomIntroduce = roomIntroduce;
    }

    public String getRoomIntroduce() 
    {
        return roomIntroduce;
    }
    public void setRoomDetail(String roomDetail) 
    {
        this.roomDetail = roomDetail;
    }

    public String getRoomDetail() 
    {
        return roomDetail;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roomId", getRoomId())
            .append("roomNum", getRoomNum())
            .append("roomTypeId", getRoomTypeId())
            .append("roomPrice", getRoomPrice())
            .append("roomCover", getRoomCover())
            .append("roomIntroduce", getRoomIntroduce())
            .append("roomDetail", getRoomDetail())
            .append("status", getStatus())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
