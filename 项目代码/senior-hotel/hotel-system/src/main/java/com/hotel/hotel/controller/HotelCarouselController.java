package com.hotel.hotel.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.hotel.common.annotation.Log;
import com.hotel.common.core.controller.BaseController;
import com.hotel.common.core.domain.AjaxResult;
import com.hotel.common.enums.BusinessType;
import com.hotel.hotel.domain.HotelCarousel;
import com.hotel.hotel.service.IHotelCarouselService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/carousel")
public class HotelCarouselController extends BaseController
{
    @Autowired
    private IHotelCarouselService hotelCarouselService;

    /**
     * 查询轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelCarousel hotelCarousel)
    {
        startPage();
        List<HotelCarousel> list = hotelCarouselService.selectHotelCarouselList(hotelCarousel);
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:export')")
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelCarousel hotelCarousel)
    {
        List<HotelCarousel> list = hotelCarouselService.selectHotelCarouselList(hotelCarousel);
        ExcelUtil<HotelCarousel> util = new ExcelUtil<HotelCarousel>(HotelCarousel.class);
        util.exportExcel(response, list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:query')")
    @GetMapping(value = "/{carouselId}")
    public AjaxResult getInfo(@PathVariable("carouselId") Long carouselId)
    {
        return AjaxResult.success(hotelCarouselService.selectHotelCarouselByCarouselId(carouselId));
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:add')")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelCarousel hotelCarousel)
    {
        return toAjax(hotelCarouselService.insertHotelCarousel(hotelCarousel));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:edit')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelCarousel hotelCarousel)
    {
        return toAjax(hotelCarouselService.updateHotelCarousel(hotelCarousel));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasPermi('hotel:carousel:remove')")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carouselIds}")
    public AjaxResult remove(@PathVariable Long[] carouselIds)
    {
        return toAjax(hotelCarouselService.deleteHotelCarouselByCarouselIds(carouselIds));
    }
}
