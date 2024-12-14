package com.hotel.hotel.service.impl;

import java.util.List;
import com.hotel.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelCarouselMapper;
import com.hotel.hotel.domain.HotelCarousel;
import com.hotel.hotel.service.IHotelCarouselService;

/**
 * 轮播图Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelCarouselServiceImpl implements IHotelCarouselService 
{
    @Autowired
    private HotelCarouselMapper hotelCarouselMapper;

    /**
     * 查询轮播图
     * 
     * @param carouselId 轮播图主键
     * @return 轮播图
     */
    @Override
    public HotelCarousel selectHotelCarouselByCarouselId(Long carouselId)
    {
        return hotelCarouselMapper.selectHotelCarouselByCarouselId(carouselId);
    }

    /**
     * 查询轮播图列表
     * 
     * @param hotelCarousel 轮播图
     * @return 轮播图
     */
    @Override
    public List<HotelCarousel> selectHotelCarouselList(HotelCarousel hotelCarousel)
    {
        return hotelCarouselMapper.selectHotelCarouselList(hotelCarousel);
    }

    /**
     * 新增轮播图
     * 
     * @param hotelCarousel 轮播图
     * @return 结果
     */
    @Override
    public int insertHotelCarousel(HotelCarousel hotelCarousel)
    {
        hotelCarousel.setCreateTime(DateUtils.getNowDate());
        return hotelCarouselMapper.insertHotelCarousel(hotelCarousel);
    }

    /**
     * 修改轮播图
     * 
     * @param hotelCarousel 轮播图
     * @return 结果
     */
    @Override
    public int updateHotelCarousel(HotelCarousel hotelCarousel)
    {
        hotelCarousel.setUpdateTime(DateUtils.getNowDate());
        return hotelCarouselMapper.updateHotelCarousel(hotelCarousel);
    }

    /**
     * 批量删除轮播图
     * 
     * @param carouselIds 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteHotelCarouselByCarouselIds(Long[] carouselIds)
    {
        return hotelCarouselMapper.deleteHotelCarouselByCarouselIds(carouselIds);
    }

    /**
     * 删除轮播图信息
     * 
     * @param carouselId 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteHotelCarouselByCarouselId(Long carouselId)
    {
        return hotelCarouselMapper.deleteHotelCarouselByCarouselId(carouselId);
    }
}
