package com.hotel.hotel.controller;

import com.hotel.common.core.domain.AjaxResult;
import com.hotel.hotel.domain.HotelBook;
import com.hotel.hotel.domain.HotelRoom;
import com.hotel.hotel.domain.HotelVisitor;
import com.hotel.hotel.service.IHotelFrontService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Scanner;

/**
 * 前台网站对接的controller
 */
@RestController
@RequestMapping("/hotel/front")
public class HotelFrontController {
    @Autowired
    private IHotelFrontService hotelFrontService;

    /**
     * 获取头部菜单数据
     * @return
     */
    @RequestMapping("/get/menu/tree")
    private AjaxResult getHeaderMenuTree(){
        return hotelFrontService.getHeaderMenuTree();
    }

    /**
     * 获取首页除了头部菜单的数据 1、轮播图数据 2、房间类型数据 3、酒店特色数据 4、资讯新闻数据
     * @return
     */
    @RequestMapping("/get/index/data")
    private AjaxResult getIndexData() {
        return hotelFrontService.getIndexData();
    }


    /**
     *获取房间数据
     * @param room
     * @return
     */
    @RequestMapping("/get/room/list")
    private AjaxResult getRoomList(HotelRoom room) {
        return hotelFrontService.getRoomList(room);
    }

    /**
     *预约房间
     * @param book
     * @return
     */
    @RequestMapping("/add/book")
    private AjaxResult addBook(HotelBook book) {
        return hotelFrontService.addBook(book);
    }

    /**
     *获取服务数据
     * @return
     */
    @RequestMapping("/get/service/list")
    private AjaxResult getServiceList() {
        return hotelFrontService.getServiceList();
    }

    /**
     *获取新闻数据
     * @return
     */
    @RequestMapping("/get/news/list")
    private AjaxResult getNewsList() {
        return hotelFrontService.getNewsList();
    }

    /**
     * 添加游客留言
     * @param visitor
     * @return
     */
    @RequestMapping("/add/vistor")
    private AjaxResult addVistor(HotelVisitor visitor) {
        return hotelFrontService.addVistor(visitor);
    }


    /**
     * 预约酒店
     * @param book
     * @return
     */
    @RequestMapping("/book")
    private AjaxResult book(@RequestBody HotelBook book) {
        return hotelFrontService.book(book);
    }

    /**
     * 判断当前选择时间段的房型是否还有房
     * @param book
     * @return
     */
    @PostMapping("/hasRoom")
    private AjaxResult hasRoom(@RequestBody HotelBook book) {
        if(hotelFrontService.hasRoom(book)) {
            return AjaxResult.success("有房", true);
        }
        return AjaxResult.success("不好意思，当前时间段的该房型已经没有房了！", false);
    }

    /**
     * 获取服务数据
     * @return
     */
    @GetMapping("/get/service/data")
    private AjaxResult getServiceData() {
        return hotelFrontService.getServiceList();
    }

    /**
     * 获取新闻数据
     * @return
     */
    @GetMapping("/get/news/data")
    private AjaxResult getNewsData() {
        return hotelFrontService.getNewsList();
    }

    /**
     * 根据id获取新闻
     * @param newsId
     * @return
     */
    @GetMapping("/get/news/by/id")
    private AjaxResult getNewsById(Long newsId) {
        return hotelFrontService.getNewsById(newsId);
    }

    /**
     * 根据id获取房间类型
     * @param roomTypeId
     * @return
     */
    @GetMapping("/get/roomType/by/id")
    private AjaxResult getRoomTypeById(Long roomTypeId) {
        return hotelFrontService.getRoomTypeById(roomTypeId);
    }




}
