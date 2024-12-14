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
import com.hotel.hotel.domain.HotelNews;
import com.hotel.hotel.service.IHotelNewsService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店新闻中心Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/news")
public class HotelNewsController extends BaseController
{
    @Autowired
    private IHotelNewsService hotelNewsService;

    /**
     * 查询酒店新闻中心列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelNews hotelNews)
    {
        startPage();
        List<HotelNews> list = hotelNewsService.selectHotelNewsList(hotelNews);
        return getDataTable(list);
    }

    /**
     * 导出酒店新闻中心列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:export')")
    @Log(title = "酒店新闻中心", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelNews hotelNews)
    {
        List<HotelNews> list = hotelNewsService.selectHotelNewsList(hotelNews);
        ExcelUtil<HotelNews> util = new ExcelUtil<HotelNews>(HotelNews.class);
        util.exportExcel(response, list, "酒店新闻中心数据");
    }

    /**
     * 获取酒店新闻中心详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:query')")
    @GetMapping(value = "/{newsId}")
    public AjaxResult getInfo(@PathVariable("newsId") Long newsId)
    {
        return AjaxResult.success(hotelNewsService.selectHotelNewsByNewsId(newsId));
    }

    /**
     * 新增酒店新闻中心
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:add')")
    @Log(title = "酒店新闻中心", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelNews hotelNews)
    {
        return toAjax(hotelNewsService.insertHotelNews(hotelNews));
    }

    /**
     * 修改酒店新闻中心
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:edit')")
    @Log(title = "酒店新闻中心", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelNews hotelNews)
    {
        return toAjax(hotelNewsService.updateHotelNews(hotelNews));
    }

    /**
     * 删除酒店新闻中心
     */
    @PreAuthorize("@ss.hasPermi('hotel:news:remove')")
    @Log(title = "酒店新闻中心", businessType = BusinessType.DELETE)
	@DeleteMapping("/{newsIds}")
    public AjaxResult remove(@PathVariable Long[] newsIds)
    {
        return toAjax(hotelNewsService.deleteHotelNewsByNewsIds(newsIds));
    }
}
