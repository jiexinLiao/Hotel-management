package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 轮播图对象 hotel_carousel
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelCarousel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 轮播图id */
    private Long carouselId;

    /** 名字 */
    @Excel(name = "名字")
    private String name;

    /** 简介 */
    @Excel(name = "简介")
    private String introduce;

    /** 图片路径 */
    @Excel(name = "图片路径")
    private String imagePath;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    public void setCarouselId(Long carouselId) 
    {
        this.carouselId = carouselId;
    }

    public Long getCarouselId() 
    {
        return carouselId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setIntroduce(String introduce)
    {
        this.introduce = introduce;
    }

    public String getIntroduce() 
    {
        return introduce;
    }
    public void setImagePath(String imagePath) 
    {
        this.imagePath = imagePath;
    }

    public String getImagePath() 
    {
        return imagePath;
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
            .append("carouselId", getCarouselId())
            .append("name", getName())
            .append("introduce", getIntroduce())
            .append("imagePath", getImagePath())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
