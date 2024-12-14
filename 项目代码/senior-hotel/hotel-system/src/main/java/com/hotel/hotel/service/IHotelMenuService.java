package com.hotel.hotel.service;

import java.util.List;
import com.hotel.hotel.domain.HotelMenu;

/**
 * 酒店菜单Service接口
 * 
 * @author gary
 * @date 2022-08-31
 */
public interface IHotelMenuService 
{
    /**
     * 查询酒店菜单
     * 
     * @param menuId 酒店菜单主键
     * @return 酒店菜单
     */
    public HotelMenu selectHotelMenuByMenuId(Long menuId);

    /**
     * 查询酒店菜单列表
     * 
     * @param hotelMenu 酒店菜单
     * @return 酒店菜单集合
     */
    public List<HotelMenu> selectHotelMenuList(HotelMenu hotelMenu);

    /**
     * 新增酒店菜单
     * 
     * @param hotelMenu 酒店菜单
     * @return 结果
     */
    public int insertHotelMenu(HotelMenu hotelMenu);

    /**
     * 修改酒店菜单
     * 
     * @param hotelMenu 酒店菜单
     * @return 结果
     */
    public int updateHotelMenu(HotelMenu hotelMenu);

    /**
     * 批量删除酒店菜单
     * 
     * @param menuIds 需要删除的酒店菜单主键集合
     * @return 结果
     */
    public int deleteHotelMenuByMenuIds(Long[] menuIds);

    /**
     * 删除酒店菜单信息
     * 
     * @param menuId 酒店菜单主键
     * @return 结果
     */
    public int deleteHotelMenuByMenuId(Long menuId);
}
