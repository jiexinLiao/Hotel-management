package com.hotel.hotel.mapper;

import java.util.List;
import com.hotel.hotel.domain.HotelBook;

/**
 * 酒店预约Mapper接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface HotelBookMapper 
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
     * 删除酒店预约
     * 
     * @param bookId 酒店预约主键
     * @return 结果
     */
    public int deleteHotelBookByBookId(Long bookId);

    /**
     * 批量删除酒店预约
     * 
     * @param bookIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHotelBookByBookIds(Long[] bookIds);
}
