package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelServiceMapper;
import com.hotel.hotel.domain.HotelService;
import com.hotel.hotel.service.IHotelServiceService;

/**
 * 酒店服务Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelServiceServiceImpl implements IHotelServiceService 
{
    @Autowired
    private HotelServiceMapper hotelServiceMapper;

    /**
     * 查询酒店服务
     * 
     * @param serviceId 酒店服务主键
     * @return 酒店服务
     */
    @Override
    public HotelService selectHotelServiceByServiceId(Long serviceId)
    {
        return hotelServiceMapper.selectHotelServiceByServiceId(serviceId);
    }

    /**
     * 查询酒店服务列表
     * 
     * @param hotelService 酒店服务
     * @return 酒店服务
     */
    @Override
    public List<HotelService> selectHotelServiceList(HotelService hotelService)
    {
        return hotelServiceMapper.selectHotelServiceList(hotelService);
    }

    /**
     * 新增酒店服务
     * 
     * @param hotelService 酒店服务
     * @return 结果
     */
    @Override
    public int insertHotelService(HotelService hotelService)
    {
        hotelService.setCreateTime(DateUtils.getNowDate());
        return hotelServiceMapper.insertHotelService(hotelService);
    }

    /**
     * 修改酒店服务
     * 
     * @param hotelService 酒店服务
     * @return 结果
     */
    @Override
    public int updateHotelService(HotelService hotelService)
    {
        hotelService.setUpdateTime(DateUtils.getNowDate());
        return hotelServiceMapper.updateHotelService(hotelService);
    }

    /**
     * 批量删除酒店服务
     * 
     * @param serviceIds 需要删除的酒店服务主键
     * @return 结果
     */
    @Override
    public int deleteHotelServiceByServiceIds(Long[] serviceIds)
    {
        return hotelServiceMapper.deleteHotelServiceByServiceIds(serviceIds);
    }

    /**
     * 删除酒店服务信息
     * 
     * @param serviceId 酒店服务主键
     * @return 结果
     */
    @Override
    public int deleteHotelServiceByServiceId(Long serviceId)
    {
        return hotelServiceMapper.deleteHotelServiceByServiceId(serviceId);
    }
}
