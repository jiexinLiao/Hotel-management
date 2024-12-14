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
import com.hotel.hotel.domain.HotelSpecial;
import com.hotel.hotel.service.IHotelSpecialService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店特色Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/special")
public class HotelSpecialController extends BaseController
{
    @Autowired
    private IHotelSpecialService hotelSpecialService;

    /**
     * 查询酒店特色列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelSpecial hotelSpecial)
    {
        startPage();
        List<HotelSpecial> list = hotelSpecialService.selectHotelSpecialList(hotelSpecial);
        return getDataTable(list);
    }

    /**
     * 导出酒店特色列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:export')")
    @Log(title = "酒店特色", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelSpecial hotelSpecial)
    {
        List<HotelSpecial> list = hotelSpecialService.selectHotelSpecialList(hotelSpecial);
        ExcelUtil<HotelSpecial> util = new ExcelUtil<HotelSpecial>(HotelSpecial.class);
        util.exportExcel(response, list, "酒店特色数据");
    }

    /**
     * 获取酒店特色详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:query')")
    @GetMapping(value = "/{specialId}")
    public AjaxResult getInfo(@PathVariable("specialId") Long specialId)
    {
        return AjaxResult.success(hotelSpecialService.selectHotelSpecialBySpecialId(specialId));
    }

    /**
     * 新增酒店特色
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:add')")
    @Log(title = "酒店特色", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelSpecial hotelSpecial)
    {
        return toAjax(hotelSpecialService.insertHotelSpecial(hotelSpecial));
    }

    /**
     * 修改酒店特色
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:edit')")
    @Log(title = "酒店特色", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelSpecial hotelSpecial)
    {
        return toAjax(hotelSpecialService.updateHotelSpecial(hotelSpecial));
    }

    /**
     * 删除酒店特色
     */
    @PreAuthorize("@ss.hasPermi('hotel:special:remove')")
    @Log(title = "酒店特色", businessType = BusinessType.DELETE)
	@DeleteMapping("/{specialIds}")
    public AjaxResult remove(@PathVariable Long[] specialIds)
    {
        return toAjax(hotelSpecialService.deleteHotelSpecialBySpecialIds(specialIds));
    }
}
