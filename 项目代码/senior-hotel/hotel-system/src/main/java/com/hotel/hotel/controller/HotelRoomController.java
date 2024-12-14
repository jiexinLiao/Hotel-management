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
import com.hotel.hotel.domain.HotelRoom;
import com.hotel.hotel.service.IHotelRoomService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店房间Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/room")
public class HotelRoomController extends BaseController
{
    @Autowired
    private IHotelRoomService hotelRoomService;

    /**
     * 查询酒店房间列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelRoom hotelRoom)
    {
        startPage();
        List<HotelRoom> list = hotelRoomService.selectHotelRoomList(hotelRoom);
        return getDataTable(list);
    }

    /**
     * 导出酒店房间列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:export')")
    @Log(title = "酒店房间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelRoom hotelRoom)
    {
        List<HotelRoom> list = hotelRoomService.selectHotelRoomList(hotelRoom);
        ExcelUtil<HotelRoom> util = new ExcelUtil<HotelRoom>(HotelRoom.class);
        util.exportExcel(response, list, "酒店房间数据");
    }

    /**
     * 获取酒店房间详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:query')")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId)
    {
        return AjaxResult.success(hotelRoomService.selectHotelRoomByRoomId(roomId));
    }

    /**
     * 新增酒店房间
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:add')")
    @Log(title = "酒店房间", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelRoom hotelRoom)
    {
        return toAjax(hotelRoomService.insertHotelRoom(hotelRoom));
    }

    /**
     * 修改酒店房间
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:edit')")
    @Log(title = "酒店房间", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelRoom hotelRoom)
    {
        return toAjax(hotelRoomService.updateHotelRoom(hotelRoom));
    }

    /**
     * 删除酒店房间
     */
    @PreAuthorize("@ss.hasPermi('hotel:room:remove')")
    @Log(title = "酒店房间", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {
        return toAjax(hotelRoomService.deleteHotelRoomByRoomIds(roomIds));
    }
}
