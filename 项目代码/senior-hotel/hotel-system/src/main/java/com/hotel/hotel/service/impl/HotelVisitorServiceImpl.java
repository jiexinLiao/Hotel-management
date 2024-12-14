package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelVisitorMapper;
import com.hotel.hotel.domain.HotelVisitor;
import com.hotel.hotel.service.IHotelVisitorService;

/**
 * 游客Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelVisitorServiceImpl implements IHotelVisitorService 
{
    @Autowired
    private HotelVisitorMapper hotelVisitorMapper;

    /**
     * 查询游客
     * 
     * @param visitorId 游客主键
     * @return 游客
     */
    @Override
    public HotelVisitor selectHotelVisitorByVisitorId(Long visitorId)
    {
        return hotelVisitorMapper.selectHotelVisitorByVisitorId(visitorId);
    }

    /**
     * 查询游客列表
     * 
     * @param hotelVisitor 游客
     * @return 游客
     */
    @Override
    public List<HotelVisitor> selectHotelVisitorList(HotelVisitor hotelVisitor)
    {
        return hotelVisitorMapper.selectHotelVisitorList(hotelVisitor);
    }

    /**
     * 新增游客
     * 
     * @param hotelVisitor 游客
     * @return 结果
     */
    @Override
    public int insertHotelVisitor(HotelVisitor hotelVisitor)
    {
        hotelVisitor.setCreateTime(DateUtils.getNowDate());
        return hotelVisitorMapper.insertHotelVisitor(hotelVisitor);
    }

    /**
     * 修改游客
     * 
     * @param hotelVisitor 游客
     * @return 结果
     */
    @Override
    public int updateHotelVisitor(HotelVisitor hotelVisitor)
    {
        return hotelVisitorMapper.updateHotelVisitor(hotelVisitor);
    }

    /**
     * 批量删除游客
     * 
     * @param visitorIds 需要删除的游客主键
     * @return 结果
     */
    @Override
    public int deleteHotelVisitorByVisitorIds(Long[] visitorIds)
    {
        return hotelVisitorMapper.deleteHotelVisitorByVisitorIds(visitorIds);
    }

    /**
     * 删除游客信息
     * 
     * @param visitorId 游客主键
     * @return 结果
     */
    @Override
    public int deleteHotelVisitorByVisitorId(Long visitorId)
    {
        return hotelVisitorMapper.deleteHotelVisitorByVisitorId(visitorId);
    }
}
