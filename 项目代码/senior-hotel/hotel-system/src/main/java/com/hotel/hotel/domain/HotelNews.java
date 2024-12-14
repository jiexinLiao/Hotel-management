package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 酒店新闻中心对象 hotel_news
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelNews extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 新闻id */
    private Long newsId;

    /** 新闻标题 */
    @Excel(name = "新闻标题")
    private String title;

    /** 常识详细 */
    @Excel(name = "常识详细")
    private String detail;

    /** 封面 */
    @Excel(name = "封面")
    private String cover;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 是否显示标志（1是，0否） */
    @Excel(name = "是否显示标志", readConverterExp = "1=是，0否")
    private String isShow;

    public void setNewsId(Long newsId) 
    {
        this.newsId = newsId;
    }

    public Long getNewsId() 
    {
        return newsId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setDetail(String detail) 
    {
        this.detail = detail;
    }

    public String getDetail() 
    {
        return detail;
    }
    public void setCover(String cover) 
    {
        this.cover = cover;
    }

    public String getCover() 
    {
        return cover;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }
    public void setIsShow(String isShow) 
    {
        this.isShow = isShow;
    }

    public String getIsShow() 
    {
        return isShow;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("newsId", getNewsId())
            .append("title", getTitle())
            .append("detail", getDetail())
            .append("cover", getCover())
            .append("orderNum", getOrderNum())
            .append("isShow", getIsShow())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
