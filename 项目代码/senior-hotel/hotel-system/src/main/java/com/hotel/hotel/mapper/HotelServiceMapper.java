package com.hotel.hotel.mapper;

import java.util.List;
import com.hotel.hotel.domain.HotelService;

/**
 * 酒店服务Mapper接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface HotelServiceMapper 
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
     * 删除酒店服务
     * 
     * @param serviceId 酒店服务主键
     * @return 结果
     */
    public int deleteHotelServiceByServiceId(Long serviceId);

    /**
     * 批量删除酒店服务
     * 
     * @param serviceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHotelServiceByServiceIds(Long[] serviceIds);
}
