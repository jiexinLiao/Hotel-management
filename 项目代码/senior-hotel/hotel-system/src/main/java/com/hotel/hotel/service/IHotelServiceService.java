package com.hotel.hotel.service;

import java.util.List;
import com.hotel.hotel.domain.HotelService;

/**
 * 酒店服务Service接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface IHotelServiceService 
{
    /**
     * 查询酒店服务
     * 
     * @param serviceId 酒店服务主键
     * @return 酒店服务
     */
    public HotelService selectHotelServiceByServiceId(Long serviceId);

    /**
     * 查询酒店服务列表
     * 
     * @param hotelService 酒店服务
     * @return 酒店服务集合
     */
    public List<HotelService> selectHotelServiceList(HotelService hotelService);

    /**
     * 新增酒店服务
     * 
     * @param hotelService 酒店服务
     * @return 结果
     */
    public int insertHotelService(HotelService hotelService);

    /**
     * 修改酒店服务
     * 
     * @param hotelService 酒店服务
     * @return 结果
     */
    public int updateHotelService(HotelService hotelService);

    /**
     * 批量删除酒店服务
     * 
     * @param serviceIds 需要删除的酒店服务主键集合
     * @return 结果
     */
    public int deleteHotelServiceByServiceIds(Long[] serviceIds);

    /**
     * 删除酒店服务信息
     * 
     * @param serviceId 酒店服务主键
     * @return 结果
     */
    public int deleteHotelServiceByServiceId(Long serviceId);
}
