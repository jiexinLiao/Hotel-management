package com.hotel.hotel.service;

import java.util.List;
import com.hotel.hotel.domain.HotelRoomType;

/**
 * 酒店房间类型Service接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface IHotelRoomTypeService 
{
    /**
     * 查询酒店房间类型
     * 
     * @param roomTypeId 酒店房间类型主键
     * @return 酒店房间类型
     */
    public HotelRoomType selectHotelRoomTypeByRoomTypeId(Long roomTypeId);

    /**
     * 查询酒店房间类型列表
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 酒店房间类型集合
     */
    public List<HotelRoomType> selectHotelRoomTypeList(HotelRoomType hotelRoomType);

    /**
     * 新增酒店房间类型
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 结果
     */
    public int insertHotelRoomType(HotelRoomType hotelRoomType);

    /**
     * 修改酒店房间类型
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 结果
     */
    public int updateHotelRoomType(HotelRoomType hotelRoomType);

    /**
     * 批量删除酒店房间类型
     * 
     * @param roomTypeIds 需要删除的酒店房间类型主键集合
     * @return 结果
     */
    public int deleteHotelRoomTypeByRoomTypeIds(Long[] roomTypeIds);

    /**
     * 删除酒店房间类型信息
     * 
     * @param roomTypeId 酒店房间类型主键
     * @return 结果
     */
    public int deleteHotelRoomTypeByRoomTypeId(Long roomTypeId);
}
