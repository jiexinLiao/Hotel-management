package com.hotel.hotel.mapper;

import java.util.List;
import com.hotel.hotel.domain.HotelSpecial;

/**
 * 酒店特色Mapper接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface HotelSpecialMapper 
{
    /**
     * 查询酒店特色
     * 
     * @param specialId 酒店特色主键
     * @return 酒店特色
     */
    public HotelSpecial selectHotelSpecialBySpecialId(Long specialId);

    /**
     * 查询酒店特色列表
     * 
     * @param hotelSpecial 酒店特色
     * @return 酒店特色集合
     */
    public List<HotelSpecial> selectHotelSpecialList(HotelSpecial hotelSpecial);

    /**
     * 新增酒店特色
     * 
     * @param hotelSpecial 酒店特色
     * @return 结果
     */
    public int insertHotelSpecial(HotelSpecial hotelSpecial);

    /**
     * 修改酒店特色
     * 
     * @param hotelSpecial 酒店特色
     * @return 结果
     */
    public int updateHotelSpecial(HotelSpecial hotelSpecial);

    /**
     * 删除酒店特色
     * 
     * @param specialId 酒店特色主键
     * @return 结果
     */
    public int deleteHotelSpecialBySpecialId(Long specialId);

    /**
     * 批量删除酒店特色
     * 
     * @param specialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHotelSpecialBySpecialIds(Long[] specialIds);
}
