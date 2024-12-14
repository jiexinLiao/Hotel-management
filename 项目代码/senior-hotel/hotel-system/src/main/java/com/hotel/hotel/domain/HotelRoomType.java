package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 酒店房间类型对象 hotel_room_type
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelRoomType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房间类型id */
    private Long roomTypeId;

    /** 类型名 */
    @Excel(name = "类型名")
    private String roomTypeName;

    /** 类型简介 */
    @Excel(name = "类型简介")
    private String roomTypeIntroduce;

    /** 封面 */
    @Excel(name = "封面")
    private String cover;

    /**多图*/
    private String images;

    private List<String> imageList;


    /** 是否上架（1是 0否） */
    @Excel(name = "是否上架", readConverterExp = "1=是,0=否")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 排序 */
    @Excel(name = "房间价钱")
    private Integer price;

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public void setRoomTypeId(Long roomTypeId)
    {
        this.roomTypeId = roomTypeId;
    }

    public Long getRoomTypeId() 
    {
        return roomTypeId;
    }
    public void setRoomTypeName(String roomTypeName) 
    {
        this.roomTypeName = roomTypeName;
    }

    public String getRoomTypeName() 
    {
        return roomTypeName;
    }
    public void setRoomTypeIntroduce(String roomTypeIntroduce) 
    {
        this.roomTypeIntroduce = roomTypeIntroduce;
    }

    public String getRoomTypeIntroduce() 
    {
        return roomTypeIntroduce;
    }
    public void setCover(String cover) 
    {
        this.cover = cover;
    }

    public String getCover() 
    {
        return cover;
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
            .append("roomTypeId", getRoomTypeId())
            .append("roomTypeName", getRoomTypeName())
            .append("roomTypeIntroduce", getRoomTypeIntroduce())
            .append("cover", getCover())
            .append("status", getStatus())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
