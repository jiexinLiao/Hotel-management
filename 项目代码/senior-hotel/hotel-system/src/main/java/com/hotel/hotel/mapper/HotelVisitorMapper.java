package com.hotel.hotel.mapper;

import java.util.List;
import com.hotel.hotel.domain.HotelVisitor;

/**
 * 游客Mapper接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface HotelVisitorMapper 
{
    /**
     * 查询游客
     * 
     * @param visitorId 游客主键
     * @return 游客
     */
    public HotelVisitor selectHotelVisitorByVisitorId(Long visitorId);

    /**
     * 查询游客列表
     * 
     * @param hotelVisitor 游客
     * @return 游客集合
     */
    public List<HotelVisitor> selectHotelVisitorList(HotelVisitor hotelVisitor);

    /**
     * 新增游客
     * 
     * @param hotelVisitor 游客
     * @return 结果
     */
    public int insertHotelVisitor(HotelVisitor hotelVisitor);

    /**
     * 修改游客
     * 
     * @param hotelVisitor 游客
     * @return 结果
     */
    public int updateHotelVisitor(HotelVisitor hotelVisitor);

    /**
     * 删除游客
     * 
     * @param visitorId 游客主键
     * @return 结果
     */
    public int deleteHotelVisitorByVisitorId(Long visitorId);

    /**
     * 批量删除游客
     * 
     * @param visitorIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHotelVisitorByVisitorIds(Long[] visitorIds);
}
