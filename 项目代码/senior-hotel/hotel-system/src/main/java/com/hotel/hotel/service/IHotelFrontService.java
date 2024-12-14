package com.hotel.hotel.service;

import com.hotel.common.core.domain.AjaxResult;
import com.hotel.hotel.domain.HotelBook;
import com.hotel.hotel.domain.HotelRoom;
import com.hotel.hotel.domain.HotelVisitor;

import java.text.ParseException;

/**
 * 前台网站Service接口
 */
public interface IHotelFrontService {

    /**
     * 获取头部菜单数据
     * @return
     */
    AjaxResult getHeaderMenuTree();

    /**
     * 获取首页除了头部菜单的数据
     *  1、轮播图数据
     *  2、房间类型数据
     *  3、酒店特色数据
     *  4、资讯新闻数据
     * @return
     */
    AjaxResult getIndexData();

    /**
     * 获取房间数据
     * @param room
     * @return
     */
    AjaxResult getRoomList(HotelRoom room);

    /**
     * 预约房间
     * @param book
     * @return
     */
    AjaxResult addBook(HotelBook book);

    /**
     * 获取服务数据
     * @return
     */
    AjaxResult getServiceList();

    /**
     * 获取新闻数据
     * @return
     */
    AjaxResult getNewsList();

    /**
     * 添加游客留言
     * @param visitor
     * @return
     */
    AjaxResult addVistor(HotelVisitor visitor);

    /**
     * 预约酒店
     * @param book
     * @return
     */
    AjaxResult book(HotelBook book);

    /**
     * 判断当前选择时间段的房型是否还有房
     * @param book
     * @return
     */
    boolean hasRoom(HotelBook book);

    /**
     * 根据id获取新闻
     * @param newsId
     * @return
     */
    AjaxResult getNewsById(Long newsId);

    /**
     * 根据id获取房间类型
     * @param roomTypeId
     * @return
     */
    AjaxResult getRoomTypeById(Long roomTypeId);

}
