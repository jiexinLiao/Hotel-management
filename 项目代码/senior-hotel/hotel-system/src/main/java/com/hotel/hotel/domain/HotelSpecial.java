package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 酒店特色对象 hotel_special
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelSpecial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 特色id */
    private Long specialId;

    /** 特色名 */
    @Excel(name = "特色名")
    private String name;

    /** 特色介绍 */
    @Excel(name = "特色介绍")
    private String introduce;

    /** 封面 */
    @Excel(name = "封面")
    private String cover;

    /** 服务时间7：30~20：00 */
    @Excel(name = "服务时间7：30~20：00")
    private String serviceTime;

    public void setSpecialId(Long specialId) 
    {
        this.specialId = specialId;
    }

    public Long getSpecialId() 
    {
        return specialId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setIntroduce(String introduce) 
    {
        this.introduce = introduce;
    }

    public String getIntroduce() 
    {
        return introduce;
    }
    public void setCover(String cover) 
    {
        this.cover = cover;
    }

    public String getCover() 
    {
        return cover;
    }
    public void setServiceTime(String serviceTime) 
    {
        this.serviceTime = serviceTime;
    }

    public String getServiceTime() 
    {
        return serviceTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("specialId", getSpecialId())
            .append("name", getName())
            .append("introduce", getIntroduce())
            .append("cover", getCover())
            .append("serviceTime", getServiceTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
