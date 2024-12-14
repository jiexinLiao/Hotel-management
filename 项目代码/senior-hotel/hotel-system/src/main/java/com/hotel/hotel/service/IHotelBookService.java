package com.hotel.hotel.service;

import java.util.List;

import com.hotel.common.core.domain.AjaxResult;
import com.hotel.hotel.domain.HotelBook;

/**
 * 酒店预约Service接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface IHotelBookService 
{
    /**
     * 查询酒店预约
     * 
     * @param bookId 酒店预约主键
     * @return 酒店预约
     */
    public HotelBook selectHotelBookByBookId(Long bookId);

    /**
     * 查询酒店预约列表
     * 
     * @param hotelBook 酒店预约
     * @return 酒店预约集合
     */
    public List<HotelBook> selectHotelBookList(HotelBook hotelBook);

    /**
     * 新增酒店预约
     * 
     * @param hotelBook 酒店预约
     * @return 结果
     */
    public int insertHotelBook(HotelBook hotelBook);

    /**
     * 修改酒店预约
     * 
     * @param hotelBook 酒店预约
     * @return 结果
     */
    public int updateHotelBook(HotelBook hotelBook);

    /**
     * 批量删除酒店预约
     * 
     * @param bookIds 需要删除的酒店预约主键集合
     * @return 结果
     */
    public int deleteHotelBookByBookIds(Long[] bookIds);

    /**
     * 删除酒店预约信息
     * 
     * @param bookId 酒店预约主键
     * @return 结果
     */
    public int deleteHotelBookByBookId(Long bookId);

    /**
     * 办理入住，返回房间号
     * @param bookId
     * @return
     */
    AjaxResult moveIn(Long bookId);

    /**
     * 办理离开房间
     * @param bookId
     * @return
     */
    AjaxResult moveOut(Long bookId);
}
