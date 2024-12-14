package com.hotel.hotel.service.impl;

import com.hotel.common.core.domain.AjaxResult;
import com.hotel.common.exception.base.BaseException;
import com.hotel.common.utils.SendMailUtils;
import com.hotel.common.utils.StringUtils;
import com.hotel.hotel.domain.*;
import com.hotel.hotel.mapper.*;
import com.hotel.hotel.service.IHotelFrontService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class HotelFrontServiceImpl implements IHotelFrontService {

    private static final Logger log = LoggerFactory.getLogger(HotelFrontServiceImpl.class);

    /**
     * 订单编号前缀
     */
    private static final String order_pre = "xxx-vip-";
    @Value("${server.ip}")
    private String ip;
    @Value("${server.port}")
    private String port;
    @Value("${mail.number}")
    private String mailNumber;
    @Value("${mail.smtpPort}")
    private String smtpPort;
    @Value("${mail.server}")
    private String server;

    @Autowired
    private HotelBookMapper bookMapper;
    @Autowired
    private HotelCarouselMapper carouselMapper;
    @Autowired
    private HotelMenuMapper menuMapper;
    @Autowired
    private HotelNewsMapper newsMapper;
    @Autowired
    private HotelRoomMapper roomMapper;
    @Autowired
    private HotelRoomTypeMapper roomTypeMapper;
    @Autowired
    private HotelServiceMapper serviceMapper;
    @Autowired
    private HotelSpecialMapper specialMapper;
    @Autowired
    private HotelVisitorMapper visitorMapper;

    @Override
    public AjaxResult getHeaderMenuTree() {
        List<HotelMenu> menus = menuMapper.selectHotelMenuList(null);
        // 将封面全路径拼接一下
        for (HotelMenu m: menus) {
            m.setImage(ip + port + m.getImage());
        }
        return AjaxResult.success(menus);
    }

    @Override
    public AjaxResult getIndexData() {
        AjaxResult result = new AjaxResult();
        // 轮播图数据
        List<HotelCarousel> carousels = carouselMapper.selectHotelCarouselList(null);
        // 将封面全路径拼接一下
        for (HotelCarousel carousel: carousels) {
            carousel.setImagePath(ip + port + carousel.getImagePath());
        }

        // 房间类型数据
        List<HotelRoomType> types = roomTypeMapper.selectHotelRoomTypeList(null);
        // 将封面全路径拼接一下
        for (HotelRoomType type: types) {
            type.setCover(ip + port + type.getCover());

        }

        // 酒店特色数据
        List<HotelSpecial> specials = specialMapper.selectHotelSpecialList(null);
        // 将封面全路径拼接一下
        for (HotelSpecial special: specials) {
            special.setCover(ip + port + special.getCover());

        }

        // 最新3条资讯新闻
        List<HotelNews> newsList = newsMapper.selectThreeNewHotelNewsList();
        // 将封面全路径拼接一下
        for (HotelNews news: newsList) {
            news.setCover(ip + port + news.getCover());
        }

        result.put("carousels", carousels);
        result.put("types", types);
        result.put("specials", specials);
        result.put("newsList", newsList);
        return result;
    }

    @Override
    public AjaxResult getRoomList(HotelRoom room) {
        return null;
    }

    @Override
    public AjaxResult addBook(HotelBook book) {
        return null;
    }

    @Override
    public AjaxResult getServiceList() {
        List<HotelService> services = serviceMapper.selectHotelServiceList(null);
        return AjaxResult.success(services);
    }

    @Override
    public AjaxResult getNewsList() {
        List<HotelNews> newsList = newsMapper.selectHotelNewsList(null);
        // 将封面全路径拼接一下
        for (HotelNews news: newsList) {
            news.setCover(ip + port + news.getCover());
        }
        return AjaxResult.success(newsList);
    }

    @Override
    public AjaxResult addVistor(HotelVisitor visitor) {
        return null;
    }

    @Transactional
    @Override
    public AjaxResult book(HotelBook book) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        // 判断当前选择时间段的房型是否还有房
        if(!hasRoom(book)) {
            return AjaxResult.success("不好意思，当前时间段的该房型已经没有房了！");
        }

        bookMapper.insertHotelBook(book);
        // 预约编码
        String bookCode = order_pre + (book.getBookId());
        book.setBookCode(bookCode);
        bookMapper.updateHotelBook(book);

        //接收人的邮箱
        String recipientMailbox = book.getBookEmail();
        //邮件主题
        String emailSubject = "XXX酒店订房订单通知！";
        //邮件内容
        // 预订人名字
        String bookName = book.getBookName();
        // 入住时间
        String inTime = sdf.format(book.getInTime()).replace("00:00:00", "12:00:00");
        // 离开时间
        String outTime = sdf.format(book.getOutTime()).replace("00:00:00", "12:00:00");
        // 房间类型
        String typeName = roomTypeMapper.selectHotelRoomTypeByRoomTypeId(book.getRoomTypeId()).getRoomTypeName();


        String emailContent = "尊敬的" + bookName + "，" +
                "感谢您在本酒店预订了房间，以下是您的预订信息：房型【"+ typeName +"】，入住时间【" + inTime + "】，" +
                "离开时间【"+ outTime +"】，预约编码【"+ bookCode +"】，请带上身份证还有预约编码到前台登记入住！" +
                "希望您入住愉快！";

        System.out.println(emailContent);
        try {
            SendMailUtils.sendEmail(server, mailNumber, smtpPort, mailNumber, new String[]{recipientMailbox}, emailSubject, emailContent,  "text/html;charset=utf-8");
            return AjaxResult.success("订单发送邮箱成功！");
        }catch (Exception e){
            log.error("发送邮件失败，失败原因：【'{}'】", e.getMessage());
            throw new BaseException("订单发送邮箱失败，请联系后台管理员！");
            //return AjaxResult.success("订单发送邮箱失败，请联系后台管理员！");
        }

    }

    /**
     * 判断当前选择时间段的房型是否还有房
     *  主要判断，入住时间或者离开时间有一个在区间就代表匹配的
     * @param book
     * @return
     */
    @Override
    public boolean hasRoom(HotelBook book) {
        // 查询当前预约的入住时间的预订记录（用大于入住小于离开去匹配）
        HotelBook newBook = new HotelBook();
        newBook.setRoomTypeId(book.getRoomTypeId());
        newBook.setJudgeTime1(book.getInTime());
        newBook.setJudgeTime2(book.getOutTime());
        newBook.setMoveOut(0);// 订了房还没离开的
        List<HotelBook> hotelBooks = bookMapper.selectHotelBookList(newBook);

        // 查找当前房型有多少个房间
        List<HotelRoom> hotelRooms = roomMapper.selectHotelRoomList(new HotelRoom(book.getRoomTypeId()));

        // 如果预订记录数等于当前房型的房间数，就代表没有房了,否则代表有房
        if(hotelBooks.size() == hotelRooms.size() || hotelBooks.size() > hotelRooms.size()) {
            return false;
        }
        return true;
    }

    @Override
    public AjaxResult getNewsById(Long newsId) {
        HotelNews news = newsMapper.selectHotelNewsByNewsId(newsId);
        // 将封面全路径拼接一下
        news.setCover(ip + port + news.getCover());
        return AjaxResult.success(news);
    }

    @Override
    public AjaxResult getRoomTypeById(Long roomTypeId) {
        HotelRoomType roomType = roomTypeMapper.selectHotelRoomTypeByRoomTypeId(roomTypeId);
        // 将封面全路径拼接一下
        roomType.setCover(ip + port + roomType.getCover());
        // 将多图拼接一下全路径
        String images = roomType.getImages();
        if(StringUtils.isNotEmpty(images)) {
            List<String> imageList = new ArrayList<>();
            String[] split = images.split(",");
            for (int i = 0; i < split.length; i++) {
                String s = split[i];
                imageList.add(ip + port + s);
            }
            roomType.setImageList(imageList);
        }
        return AjaxResult.success(roomType);
    }


}
