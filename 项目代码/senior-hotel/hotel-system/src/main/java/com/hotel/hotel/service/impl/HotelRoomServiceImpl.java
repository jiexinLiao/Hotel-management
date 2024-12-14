package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelRoomMapper;
import com.hotel.hotel.domain.HotelRoom;
import com.hotel.hotel.service.IHotelRoomService;

/**
 * 酒店房间Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelRoomServiceImpl implements IHotelRoomService 
{
    @Autowired
    private HotelRoomMapper hotelRoomMapper;

    /**
     * 查询酒店房间
     * 
     * @param roomId 酒店房间主键
     * @return 酒店房间
     */
    @Override
    public HotelRoom selectHotelRoomByRoomId(Long roomId)
    {
        return hotelRoomMapper.selectHotelRoomByRoomId(roomId);
    }

    /**
     * 查询酒店房间列表
     * 
     * @param hotelRoom 酒店房间
     * @return 酒店房间
     */
    @Override
    public List<HotelRoom> selectHotelRoomList(HotelRoom hotelRoom)
    {
        return hotelRoomMapper.selectHotelRoomList(hotelRoom);
    }

    /**
     * 新增酒店房间
     * 
     * @param hotelRoom 酒店房间
     * @return 结果
     */
    @Override
    public int insertHotelRoom(HotelRoom hotelRoom)
    {
        hotelRoom.setCreateTime(DateUtils.getNowDate());
        return hotelRoomMapper.insertHotelRoom(hotelRoom);
    }

    /**
     * 修改酒店房间
     * 
     * @param hotelRoom 酒店房间
     * @return 结果
     */
    @Override
    public int updateHotelRoom(HotelRoom hotelRoom)
    {
        hotelRoom.setUpdateTime(DateUtils.getNowDate());
        return hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 批量删除酒店房间
     * 
     * @param roomIds 需要删除的酒店房间主键
     * @return 结果
     */
    @Override
    public int deleteHotelRoomByRoomIds(Long[] roomIds)
    {
        return hotelRoomMapper.deleteHotelRoomByRoomIds(roomIds);
    }

    /**
     * 删除酒店房间信息
     * 
     * @param roomId 酒店房间主键
     * @return 结果
     */
    @Override
    public int deleteHotelRoomByRoomId(Long roomId)
    {
        return hotelRoomMapper.deleteHotelRoomByRoomId(roomId);
    }
}
