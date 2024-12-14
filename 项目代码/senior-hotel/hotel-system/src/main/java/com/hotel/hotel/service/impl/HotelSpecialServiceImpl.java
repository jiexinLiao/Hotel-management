package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelSpecialMapper;
import com.hotel.hotel.domain.HotelSpecial;
import com.hotel.hotel.service.IHotelSpecialService;

/**
 * 酒店特色Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelSpecialServiceImpl implements IHotelSpecialService 
{
    @Autowired
    private HotelSpecialMapper hotelSpecialMapper;

    /**
     * 查询酒店特色
     * 
     * @param specialId 酒店特色主键
     * @return 酒店特色
     */
    @Override
    public HotelSpecial selectHotelSpecialBySpecialId(Long specialId)
    {
        return hotelSpecialMapper.selectHotelSpecialBySpecialId(specialId);
    }

    /**
     * 查询酒店特色列表
     * 
     * @param hotelSpecial 酒店特色
     * @return 酒店特色
     */
    @Override
    public List<HotelSpecial> selectHotelSpecialList(HotelSpecial hotelSpecial)
    {
        return hotelSpecialMapper.selectHotelSpecialList(hotelSpecial);
    }

    /**
     * 新增酒店特色
     * 
     * @param hotelSpecial 酒店特色
     * @return 结果
     */
    @Override
    public int insertHotelSpecial(HotelSpecial hotelSpecial)
    {
        hotelSpecial.setCreateTime(DateUtils.getNowDate());
        return hotelSpecialMapper.insertHotelSpecial(hotelSpecial);
    }

    /**
     * 修改酒店特色
     * 
     * @param hotelSpecial 酒店特色
     * @return 结果
     */
    @Override
    public int updateHotelSpecial(HotelSpecial hotelSpecial)
    {
        hotelSpecial.setUpdateTime(DateUtils.getNowDate());
        return hotelSpecialMapper.updateHotelSpecial(hotelSpecial);
    }

    /**
     * 批量删除酒店特色
     * 
     * @param specialIds 需要删除的酒店特色主键
     * @return 结果
     */
    @Override
    public int deleteHotelSpecialBySpecialIds(Long[] specialIds)
    {
        return hotelSpecialMapper.deleteHotelSpecialBySpecialIds(specialIds);
    }

    /**
     * 删除酒店特色信息
     * 
     * @param specialId 酒店特色主键
     * @return 结果
     */
    @Override
    public int deleteHotelSpecialBySpecialId(Long specialId)
    {
        return hotelSpecialMapper.deleteHotelSpecialBySpecialId(specialId);
    }
}
