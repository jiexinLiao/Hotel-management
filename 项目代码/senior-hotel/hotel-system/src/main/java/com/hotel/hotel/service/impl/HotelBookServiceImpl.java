package com.hotel.hotel.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.hotel.common.core.domain.AjaxResult;
import com.hotel.common.utils.DateUtils;
import com.hotel.hotel.domain.HotelRoom;
import com.hotel.hotel.mapper.HotelRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.hotel.mapper.HotelBookMapper;
import com.hotel.hotel.domain.HotelBook;
import com.hotel.hotel.service.IHotelBookService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 酒店预约Service业务层处理
 * 
 * @author gary
 * @date 2023-03-20
 */
@Service
public class HotelBookServiceImpl implements IHotelBookService 
{
    @Autowired
    private HotelBookMapper hotelBookMapper;
    @Autowired
    private HotelRoomMapper roomMapper;

    /**
     * 查询酒店预约
     * 
     * @param bookId 酒店预约主键
     * @return 酒店预约
     */
    @Override
    public HotelBook selectHotelBookByBookId(Long bookId)
    {
        return hotelBookMapper.selectHotelBookByBookId(bookId);
    }

    /**
     * 查询酒店预约列表
     * 
     * @param hotelBook 酒店预约
     * @return 酒店预约
     */
    @Override
    public List<HotelBook> selectHotelBookList(HotelBook hotelBook)
    {
        return hotelBookMapper.selectHotelBookList(hotelBook);
    }

    /**
     * 新增酒店预约
     * 
     * @param hotelBook 酒店预约
     * @return 结果
     */
    @Override
    public int insertHotelBook(HotelBook hotelBook)
    {
        hotelBook.setCreateTime(DateUtils.getNowDate());
        return hotelBookMapper.insertHotelBook(hotelBook);
    }

    /**
     * 修改酒店预约
     * 
     * @param hotelBook 酒店预约
     * @return 结果
     */
    @Override
    public int updateHotelBook(HotelBook hotelBook)
    {
        hotelBook.setUpdateTime(DateUtils.getNowDate());
        return hotelBookMapper.updateHotelBook(hotelBook);
    }

    /**
     * 批量删除酒店预约
     * 
     * @param bookIds 需要删除的酒店预约主键
     * @return 结果
     */
    @Override
    public int deleteHotelBookByBookIds(Long[] bookIds)
    {
        return hotelBookMapper.deleteHotelBookByBookIds(bookIds);
    }

    /**
     * 删除酒店预约信息
     * 
     * @param bookId 酒店预约主键
     * @return 结果
     */
    @Override
    public int deleteHotelBookByBookId(Long bookId)
    {
        return hotelBookMapper.deleteHotelBookByBookId(bookId);
    }


    @Override
    public AjaxResult moveIn(Long bookId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        HotelBook book = hotelBookMapper.selectHotelBookByBookId(bookId);

        // 判断是否符合入住时间条件
        String inTimeStr = sdf.format(book.getInTime()).replace("00:00:00", "12:00:00");
        String outTimeStr = sdf.format(book.getOutTime()).replace("00:00:00", "12:00:00");
        long inTimes = 0;
        long outTimes = 0;
        try {
            inTimes = sdf.parse(inTimeStr).getTime();
            outTimes = sdf.parse(outTimeStr).getTime();
        }catch (Exception e){
            return AjaxResult.error("办理入住后台时间转换异常，请联系管理员！");
        }
        long currentTimes = System.currentTimeMillis();
        if(currentTimes < inTimes || currentTimes > outTimes) {
            Date currentDate = new Date(currentTimes);
            String tips = String.format("不好意思，当前时间是：%s，订单入住时间是：%s，离开时间是：%s，所以不能办理入住！",
                    sdf.format(currentDate), inTimeStr, outTimeStr);
            return AjaxResult.error(tips);
        }

        // 看看当前房型已经预约并且入住多少个记录先
        HotelBook selectBook = new HotelBook();
        selectBook.setRoomTypeId(book.getRoomTypeId());
        selectBook.setMoveIn(1);// 入住了
        selectBook.setMoveOut(0); // 还没离开
        List<HotelBook> moveInList = hotelBookMapper.selectHotelBookList(selectBook);


        // 查看当前房房型的所有房间
        List<HotelRoom> rooms = roomMapper.selectHotelRoomList(new HotelRoom(book.getRoomTypeId()));

        // 得到入住的房间
        HotelRoom inRoom = rooms.get(moveInList.size());

        // 更新预约信息
        book.setMoveIn(1);
        book.setRoomId(inRoom.getRoomId());
        hotelBookMapper.updateHotelBook(book);

        return AjaxResult.success("办理入住成功！", inRoom.getRoomNum());
    }

    @Override
    public AjaxResult moveOut(Long bookId) {
        HotelBook book = hotelBookMapper.selectHotelBookByBookId(bookId);
        book.setMoveOut(1);
        hotelBookMapper.updateHotelBook(book);
        return AjaxResult.success("办理退房成功！");
    }
}
