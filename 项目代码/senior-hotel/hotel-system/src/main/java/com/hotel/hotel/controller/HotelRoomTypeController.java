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
import com.hotel.hotel.domain.HotelRoomType;
import com.hotel.hotel.service.IHotelRoomTypeService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店房间类型Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/type")
public class HotelRoomTypeController extends BaseController
{
    @Autowired
    private IHotelRoomTypeService hotelRoomTypeService;

    /**
     * 查询酒店房间类型列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelRoomType hotelRoomType)
    {
        startPage();
        List<HotelRoomType> list = hotelRoomTypeService.selectHotelRoomTypeList(hotelRoomType);
        return getDataTable(list);
    }

    /**
     * 导出酒店房间类型列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:export')")
    @Log(title = "酒店房间类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelRoomType hotelRoomType)
    {
        List<HotelRoomType> list = hotelRoomTypeService.selectHotelRoomTypeList(hotelRoomType);
        ExcelUtil<HotelRoomType> util = new ExcelUtil<HotelRoomType>(HotelRoomType.class);
        util.exportExcel(response, list, "酒店房间类型数据");
    }

    /**
     * 获取酒店房间类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:query')")
    @GetMapping(value = "/{roomTypeId}")
    public AjaxResult getInfo(@PathVariable("roomTypeId") Long roomTypeId)
    {
        return AjaxResult.success(hotelRoomTypeService.selectHotelRoomTypeByRoomTypeId(roomTypeId));
    }

    /**
     * 新增酒店房间类型
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:add')")
    @Log(title = "酒店房间类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelRoomType hotelRoomType)
    {
        return toAjax(hotelRoomTypeService.insertHotelRoomType(hotelRoomType));
    }

    /**
     * 修改酒店房间类型
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:edit')")
    @Log(title = "酒店房间类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelRoomType hotelRoomType)
    {
        return toAjax(hotelRoomTypeService.updateHotelRoomType(hotelRoomType));
    }

    /**
     * 删除酒店房间类型
     */
    @PreAuthorize("@ss.hasPermi('hotel:type:remove')")
    @Log(title = "酒店房间类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomTypeIds}")
    public AjaxResult remove(@PathVariable Long[] roomTypeIds)
    {
        return toAjax(hotelRoomTypeService.deleteHotelRoomTypeByRoomTypeIds(roomTypeIds));
    }
}
