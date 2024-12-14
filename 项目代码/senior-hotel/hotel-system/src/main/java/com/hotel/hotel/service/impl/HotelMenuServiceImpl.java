package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelMenuMapper;
import com.hotel.hotel.domain.HotelMenu;
import com.hotel.hotel.service.IHotelMenuService;

/**
 * 酒店菜单Service业务层处理
 * 
 * @author gary
 * @date 2022-08-31
 */
@Service
public class HotelMenuServiceImpl implements IHotelMenuService 
{
    @Autowired
    private HotelMenuMapper hotelMenuMapper;

    /**
     * 查询酒店菜单
     * 
     * @param menuId 酒店菜单主键
     * @return 酒店菜单
     */
    @Override
    public HotelMenu selectHotelMenuByMenuId(Long menuId)
    {
        return hotelMenuMapper.selectHotelMenuByMenuId(menuId);
    }

    /**
     * 查询酒店菜单列表
     * 
     * @param hotelMenu 酒店菜单
     * @return 酒店菜单
     */
    @Override
    public List<HotelMenu> selectHotelMenuList(HotelMenu hotelMenu)
    {
        return hotelMenuMapper.selectHotelMenuList(hotelMenu);
    }

    /**
     * 新增酒店菜单
     * 
     * @param hotelMenu 酒店菜单
     * @return 结果
     */
    @Override
    public int insertHotelMenu(HotelMenu hotelMenu)
    {
        hotelMenu.setCreateTime(DateUtils.getNowDate());
        return hotelMenuMapper.insertHotelMenu(hotelMenu);
    }

    /**
     * 修改酒店菜单
     * 
     * @param hotelMenu 酒店菜单
     * @return 结果
     */
    @Override
    public int updateHotelMenu(HotelMenu hotelMenu)
    {
        hotelMenu.setUpdateTime(DateUtils.getNowDate());
        return hotelMenuMapper.updateHotelMenu(hotelMenu);
    }

    /**
     * 批量删除酒店菜单
     * 
     * @param menuIds 需要删除的酒店菜单主键
     * @return 结果
     */
    @Override
    public int deleteHotelMenuByMenuIds(Long[] menuIds)
    {
        return hotelMenuMapper.deleteHotelMenuByMenuIds(menuIds);
    }

    /**
     * 删除酒店菜单信息
     * 
     * @param menuId 酒店菜单主键
     * @return 结果
     */
    @Override
    public int deleteHotelMenuByMenuId(Long menuId)
    {
        return hotelMenuMapper.deleteHotelMenuByMenuId(menuId);
    }
}
