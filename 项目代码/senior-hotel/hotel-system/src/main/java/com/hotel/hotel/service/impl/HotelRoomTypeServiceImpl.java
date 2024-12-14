package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelRoomTypeMapper;
import com.hotel.hotel.domain.HotelRoomType;
import com.hotel.hotel.service.IHotelRoomTypeService;

/**
 * 酒店房间类型Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelRoomTypeServiceImpl implements IHotelRoomTypeService 
{
    @Autowired
    private HotelRoomTypeMapper hotelRoomTypeMapper;

    /**
     * 查询酒店房间类型
     * 
     * @param roomTypeId 酒店房间类型主键
     * @return 酒店房间类型
     */
    @Override
    public HotelRoomType selectHotelRoomTypeByRoomTypeId(Long roomTypeId)
    {
        return hotelRoomTypeMapper.selectHotelRoomTypeByRoomTypeId(roomTypeId);
    }

    /**
     * 查询酒店房间类型列表
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 酒店房间类型
     */
    @Override
    public List<HotelRoomType> selectHotelRoomTypeList(HotelRoomType hotelRoomType)
    {
        return hotelRoomTypeMapper.selectHotelRoomTypeList(hotelRoomType);
    }

    /**
     * 新增酒店房间类型
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 结果
     */
    @Override
    public int insertHotelRoomType(HotelRoomType hotelRoomType)
    {
        hotelRoomType.setCreateTime(DateUtils.getNowDate());
        return hotelRoomTypeMapper.insertHotelRoomType(hotelRoomType);
    }

    /**
     * 修改酒店房间类型
     * 
     * @param hotelRoomType 酒店房间类型
     * @return 结果
     */
    @Override
    public int updateHotelRoomType(HotelRoomType hotelRoomType)
    {
        hotelRoomType.setUpdateTime(DateUtils.getNowDate());
        return hotelRoomTypeMapper.updateHotelRoomType(hotelRoomType);
    }

    /**
     * 批量删除酒店房间类型
     * 
     * @param roomTypeIds 需要删除的酒店房间类型主键
     * @return 结果
     */
    @Override
    public int deleteHotelRoomTypeByRoomTypeIds(Long[] roomTypeIds)
    {
        return hotelRoomTypeMapper.deleteHotelRoomTypeByRoomTypeIds(roomTypeIds);
    }

    /**
     * 删除酒店房间类型信息
     * 
     * @param roomTypeId 酒店房间类型主键
     * @return 结果
     */
    @Override
    public int deleteHotelRoomTypeByRoomTypeId(Long roomTypeId)
    {
        return hotelRoomTypeMapper.deleteHotelRoomTypeByRoomTypeId(roomTypeId);
    }
}
