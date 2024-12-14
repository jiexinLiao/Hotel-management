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
import com.hotel.hotel.domain.HotelService;
import com.hotel.hotel.service.IHotelServiceService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店服务Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/service")
public class HotelServiceController extends BaseController
{
    @Autowired
    private IHotelServiceService hotelServiceService;

    /**
     * 查询酒店服务列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelService hotelService)
    {
        startPage();
        List<HotelService> list = hotelServiceService.selectHotelServiceList(hotelService);
        return getDataTable(list);
    }

    /**
     * 导出酒店服务列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:export')")
    @Log(title = "酒店服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelService hotelService)
    {
        List<HotelService> list = hotelServiceService.selectHotelServiceList(hotelService);
        ExcelUtil<HotelService> util = new ExcelUtil<HotelService>(HotelService.class);
        util.exportExcel(response, list, "酒店服务数据");
    }

    /**
     * 获取酒店服务详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:query')")
    @GetMapping(value = "/{serviceId}")
    public AjaxResult getInfo(@PathVariable("serviceId") Long serviceId)
    {
        return AjaxResult.success(hotelServiceService.selectHotelServiceByServiceId(serviceId));
    }

    /**
     * 新增酒店服务
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:add')")
    @Log(title = "酒店服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelService hotelService)
    {
        return toAjax(hotelServiceService.insertHotelService(hotelService));
    }

    /**
     * 修改酒店服务
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:edit')")
    @Log(title = "酒店服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelService hotelService)
    {
        return toAjax(hotelServiceService.updateHotelService(hotelService));
    }

    /**
     * 删除酒店服务
     */
    @PreAuthorize("@ss.hasPermi('hotel:service:remove')")
    @Log(title = "酒店服务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{serviceIds}")
    public AjaxResult remove(@PathVariable Long[] serviceIds)
    {
        return toAjax(hotelServiceService.deleteHotelServiceByServiceIds(serviceIds));
    }
}
