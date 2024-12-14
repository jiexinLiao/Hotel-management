package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelNewsMapper;
import com.hotel.hotel.domain.HotelNews;
import com.hotel.hotel.service.IHotelNewsService;

/**
 * 酒店新闻中心Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelNewsServiceImpl implements IHotelNewsService 
{
    @Autowired
    private HotelNewsMapper hotelNewsMapper;

    /**
     * 查询酒店新闻中心
     * 
     * @param newsId 酒店新闻中心主键
     * @return 酒店新闻中心
     */
    @Override
    public HotelNews selectHotelNewsByNewsId(Long newsId)
    {
        return hotelNewsMapper.selectHotelNewsByNewsId(newsId);
    }

    /**
     * 查询酒店新闻中心列表
     * 
     * @param hotelNews 酒店新闻中心
     * @return 酒店新闻中心
     */
    @Override
    public List<HotelNews> selectHotelNewsList(HotelNews hotelNews)
    {
        return hotelNewsMapper.selectHotelNewsList(hotelNews);
    }

    /**
     * 新增酒店新闻中心
     * 
     * @param hotelNews 酒店新闻中心
     * @return 结果
     */
    @Override
    public int insertHotelNews(HotelNews hotelNews)
    {
        hotelNews.setCreateTime(DateUtils.getNowDate());
        return hotelNewsMapper.insertHotelNews(hotelNews);
    }

    /**
     * 修改酒店新闻中心
     * 
     * @param hotelNews 酒店新闻中心
     * @return 结果
     */
    @Override
    public int updateHotelNews(HotelNews hotelNews)
    {
        hotelNews.setUpdateTime(DateUtils.getNowDate());
        return hotelNewsMapper.updateHotelNews(hotelNews);
    }

    /**
     * 批量删除酒店新闻中心
     * 
     * @param newsIds 需要删除的酒店新闻中心主键
     * @return 结果
     */
    @Override
    public int deleteHotelNewsByNewsIds(Long[] newsIds)
    {
        return hotelNewsMapper.deleteHotelNewsByNewsIds(newsIds);
    }

    /**
     * 删除酒店新闻中心信息
     * 
     * @param newsId 酒店新闻中心主键
     * @return 结果
     */
    @Override
    public int deleteHotelNewsByNewsId(Long newsId)
    {
        return hotelNewsMapper.deleteHotelNewsByNewsId(newsId);
    }
}
