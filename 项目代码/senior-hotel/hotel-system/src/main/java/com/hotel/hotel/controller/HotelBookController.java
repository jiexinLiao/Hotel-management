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
import com.hotel.hotel.domain.HotelBook;
import com.hotel.hotel.service.IHotelBookService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 酒店预约Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/book")
public class HotelBookController extends BaseController
{
    @Autowired
    private IHotelBookService hotelBookService;

    /**
     * 查询酒店预约列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelBook hotelBook)
    {
        startPage();
        List<HotelBook> list = hotelBookService.selectHotelBookList(hotelBook);
        return getDataTable(list);
    }

    /**
     * 导出酒店预约列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:export')")
    @Log(title = "酒店预约", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelBook hotelBook)
    {
        List<HotelBook> list = hotelBookService.selectHotelBookList(hotelBook);
        ExcelUtil<HotelBook> util = new ExcelUtil<HotelBook>(HotelBook.class);
        util.exportExcel(response, list, "酒店预约数据");
    }

    /**
     * 获取酒店预约详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:query')")
    @GetMapping(value = "/{bookId}")
    public AjaxResult getInfo(@PathVariable("bookId") Long bookId)
    {
        return AjaxResult.success(hotelBookService.selectHotelBookByBookId(bookId));
    }

    /**
     * 新增酒店预约
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:add')")
    @Log(title = "酒店预约", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelBook hotelBook)
    {
        return toAjax(hotelBookService.insertHotelBook(hotelBook));
    }

    /**
     * 修改酒店预约
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:edit')")
    @Log(title = "酒店预约", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelBook hotelBook)
    {
        return toAjax(hotelBookService.updateHotelBook(hotelBook));
    }

    /**
     * 删除酒店预约
     */
    @PreAuthorize("@ss.hasPermi('hotel:book:remove')")
    @Log(title = "酒店预约", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bookIds}")
    public AjaxResult remove(@PathVariable Long[] bookIds)
    {
        return toAjax(hotelBookService.deleteHotelBookByBookIds(bookIds));
    }

    /**
     * 办理入住，返回房间号
     * @param bookId
     * @return
     */
    @GetMapping("/moveIn")
    public AjaxResult moveIn(Long bookId) {
        return hotelBookService.moveIn(bookId);
    }

    /**
     * 办理离开房间
     * @param bookId
     * @return
     */
    @GetMapping("/moveOut")
    public AjaxResult moveOut(Long bookId) {
        return hotelBookService.moveOut(bookId);
    }


}
