package com.hotel.hotel.mapper;

import java.util.List;
import com.hotel.hotel.domain.HotelCarousel;

/**
 * 轮播图Mapper接口
 * 
 * @author gary
 * @date 2023-03-20
 */
public interface HotelCarouselMapper 
{
    /**
     * 查询轮播图
     * 
     * @param carouselId 轮播图主键
     * @return 轮播图
     */
    public HotelCarousel selectHotelCarouselByCarouselId(Long carouselId);

    /**
     * 查询轮播图列表
     * 
     * @param hotelCarousel 轮播图
     * @return 轮播图集合
     */
    public List<HotelCarousel> selectHotelCarouselList(HotelCarousel hotelCarousel);

    /**
     * 新增轮播图
     * 
     * @param hotelCarousel 轮播图
     * @return 结果
     */
    public int insertHotelCarousel(HotelCarousel hotelCarousel);

    /**
     * 修改轮播图
     * 
     * @param hotelCarousel 轮播图
     * @return 结果
     */
    public int updateHotelCarousel(HotelCarousel hotelCarousel);

    /**
     * 删除轮播图
     * 
     * @param carouselId 轮播图主键
     * @return 结果
     */
    public int deleteHotelCarouselByCarouselId(Long carouselId);

    /**
     * 批量删除轮播图
     * 
     * @param carouselIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHotelCarouselByCarouselIds(Long[] carouselIds);
}
