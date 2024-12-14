package com.hotel.hotel.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hotel.common.annotation.Excel;
import com.hotel.common.core.domain.BaseEntity;

/**
 * 游客对象 hotel_visitor
 * 
 * @author gary
 * @date 2023-03-20
 */
public class HotelVisitor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 游客id */
    private Long visitorId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 手机 */
    @Excel(name = "手机")
    private String phone;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 留言内容 */
    @Excel(name = "留言内容")
    private String message;

    public void setVisitorId(Long visitorId) 
    {
        this.visitorId = visitorId;
    }

    public Long getVisitorId() 
    {
        return visitorId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setMessage(String message) 
    {
        this.message = message;
    }

    public String getMessage() 
    {
        return message;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("visitorId", getVisitorId())
            .append("name", getName())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("message", getMessage())
            .append("createTime", getCreateTime())
            .toString();
    }
}
