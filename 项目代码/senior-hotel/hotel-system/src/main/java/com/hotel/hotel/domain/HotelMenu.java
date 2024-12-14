package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.TreeEntity;

/**
 * 酒店菜单对象 hotel_menu
 * 
 * @author gary
 * @date 2022-08-31
 */
public class HotelMenu extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜单id */
    private Long menuId;

    /** 菜单名称 */
    @Excel(name = "菜单名称")
    private String name;

    /** 菜单介绍描述 */
    private String introduce;

    /** 菜单URL */
    private String url;

    /** 封面 */
    @Excel(name = "封面")
    private String image;

    /** 菜单图标 */
    private String icon;

    /** 菜单介绍详情 */
    private String detail;

    public void setMenuId(Long menuId) 
    {
        this.menuId = menuId;
    }

    public Long getMenuId() 
    {
        return menuId;
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
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setDetail(String detail) 
    {
        this.detail = detail;
    }

    public String getDetail() 
    {
        return detail;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("menuId", getMenuId())
            .append("parentId", getParentId())
            .append("name", getName())
            .append("introduce", getIntroduce())
            .append("url", getUrl())
            .append("image", getImage())
            .append("icon", getIcon())
            .append("detail", getDetail())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
