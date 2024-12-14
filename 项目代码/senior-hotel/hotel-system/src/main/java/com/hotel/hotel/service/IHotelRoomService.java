package com.hotel.hotel.service;

import java.util.List;
import com.hotel.hotel.domain.HotelRoom;

/**
 * 酒店房间Service接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface IHotelRoomService 
{
    /**
     * 查询酒店房间
     * 
     * @param roomId 酒店房间主键
     * @return 酒店房间
     */
    public HotelRoom selectHotelRoomByRoomId(Long roomId);

    /**
     * 查询酒店房间列表
     * 
     * @param hotelRoom 酒店房间
     * @return 酒店房间集合
     */
    public List<HotelRoom> selectHotelRoomList(HotelRoom hotelRoom);

    /**
     * 新增酒店房间
     * 
     * @param hotelRoom 酒店房间
     * @return 结果
     */
    public int insertHotelRoom(HotelRoom hotelRoom);

    /**
     * 修改酒店房间
     * 
     * @param hotelRoom 酒店房间
     * @return 结果
     */
    public int updateHotelRoom(HotelRoom hotelRoom);

    /**
     * 批量删除酒店房间
     * 
     * @param roomIds 需要删除的酒店房间主键集合
     * @return 结果
     */
    public int deleteHotelRoomByRoomIds(Long[] roomIds);

    /**
     * 删除酒店房间信息
     * 
     * @param roomId 酒店房间主键
     * @return 结果
     */
    public int deleteHotelRoomByRoomId(Long roomId);
}
