package com.hotel.hotel.service;

import java.util.List;
import com.hotel.hotel.domain.HotelNews;

/**
 * 酒店新闻中心Service接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface IHotelNewsService 
{
    /**
     * 查询酒店新闻中心
     * 
     * @param newsId 酒店新闻中心主键
     * @return 酒店新闻中心
     */
    public HotelNews selectHotelNewsByNewsId(Long newsId);

    /**
     * 查询酒店新闻中心列表
     * 
     * @param hotelNews 酒店新闻中心
     * @return 酒店新闻中心集合
     */
    public List<HotelNews> selectHotelNewsList(HotelNews hotelNews);

    /**
     * 新增酒店新闻中心
     * 
     * @param hotelNews 酒店新闻中心
     * @return 结果
     */
    public int insertHotelNews(HotelNews hotelNews);

    /**
     * 修改酒店新闻中心
     * 
     * @param hotelNews 酒店新闻中心
     * @return 结果
     */
    public int updateHotelNews(HotelNews hotelNews);

    /**
     * 批量删除酒店新闻中心
     * 
     * @param newsIds 需要删除的酒店新闻中心主键集合
     * @return 结果
     */
    public int deleteHotelNewsByNewsIds(Long[] newsIds);

    /**
     * 删除酒店新闻中心信息
     * 
     * @param newsId 酒店新闻中心主键
     * @return 结果
     */
    public int deleteHotelNewsByNewsId(Long newsId);
}
