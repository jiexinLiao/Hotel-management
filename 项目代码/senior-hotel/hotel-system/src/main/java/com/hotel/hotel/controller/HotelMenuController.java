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
import com.hotel.hotel.domain.HotelMenu;
import com.hotel.hotel.service.IHotelMenuService;
import com.hotel.common.utils.poi.ExcelUtil;

/**
 * 酒店菜单Controller
 * 
 * @author gary
 * @date 2022-08-31
 */
@RestController
@RequestMapping("/hotel/menu")
public class HotelMenuController extends BaseController
{
    @Autowired
    private IHotelMenuService hotelMenuService;

    /**
     * 查询酒店菜单列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:list')")
    @GetMapping("/list")
    public AjaxResult list(HotelMenu hotelMenu)
    {
        List<HotelMenu> list = hotelMenuService.selectHotelMenuList(hotelMenu);
        return AjaxResult.success(list);
    }

    /**
     * 导出酒店菜单列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:export')")
    @Log(title = "酒店菜单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelMenu hotelMenu)
    {
        List<HotelMenu> list = hotelMenuService.selectHotelMenuList(hotelMenu);
        ExcelUtil<HotelMenu> util = new ExcelUtil<HotelMenu>(HotelMenu.class);
        util.exportExcel(response, list, "酒店菜单数据");
    }

    /**
     * 获取酒店菜单详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:query')")
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable("menuId") Long menuId)
    {
        return AjaxResult.success(hotelMenuService.selectHotelMenuByMenuId(menuId));
    }

    /**
     * 新增酒店菜单
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:add')")
    @Log(title = "酒店菜单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelMenu hotelMenu)
    {
        return toAjax(hotelMenuService.insertHotelMenu(hotelMenu));
    }

    /**
     * 修改酒店菜单
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:edit')")
    @Log(title = "酒店菜单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelMenu hotelMenu)
    {
        return toAjax(hotelMenuService.updateHotelMenu(hotelMenu));
    }

    /**
     * 删除酒店菜单
     */
    @PreAuthorize("@ss.hasPermi('hotel:menu:remove')")
    @Log(title = "酒店菜单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{menuIds}")
    public AjaxResult remove(@PathVariable Long[] menuIds)
    {
        return toAjax(hotelMenuService.deleteHotelMenuByMenuIds(menuIds));
    }
}
