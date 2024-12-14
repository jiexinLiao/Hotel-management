package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 酒店服务对象 hotel_service
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelService extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务id */
    private Long serviceId;

    /** 服务名 */
    @Excel(name = "服务名")
    private String name;

    /** 服务介绍 */
    @Excel(name = "服务介绍")
    private String introduce;

    /** 图标 */
    @Excel(name = "图标")
    private String icon;

    public void setServiceId(Long serviceId) 
    {
        this.serviceId = serviceId;
    }

    public Long getServiceId() 
    {
        return serviceId;
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
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("serviceId", getServiceId())
            .append("name", getName())
            .append("introduce", getIntroduce())
            .append("icon", getIcon())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
