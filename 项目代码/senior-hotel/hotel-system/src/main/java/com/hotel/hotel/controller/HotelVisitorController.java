package com.hotel.hotel.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
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
import com.hotel.hotel.domain.HotelVisitor;
import com.hotel.hotel.service.IHotelVisitorService;
import com.hotel.common.utils.poi.ExcelUtil;
import com.hotel.common.core.page.TableDataInfo;

/**
 * 游客Controller
 * 
 * @author gary
 * @date 2023-03-20
 */
@RestController
@RequestMapping("/hotel/visitor")
public class HotelVisitorController extends BaseController
{
    @Autowired
    private IHotelVisitorService hotelVisitorService;

    /**
     * 查询游客列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:list')")
    @GetMapping("/list")
    public TableDataInfo list(HotelVisitor hotelVisitor)
    {
        startPage();
        List<HotelVisitor> list = hotelVisitorService.selectHotelVisitorList(hotelVisitor);
        return getDataTable(list);
    }

    /**
     * 导出游客列表
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:export')")
    @Log(title = "游客", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HotelVisitor hotelVisitor)
    {
        List<HotelVisitor> list = hotelVisitorService.selectHotelVisitorList(hotelVisitor);
        ExcelUtil<HotelVisitor> util = new ExcelUtil<HotelVisitor>(HotelVisitor.class);
        util.exportExcel(response, list, "游客数据");
    }

    /**
     * 获取游客详细信息
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:query')")
    @GetMapping(value = "/{visitorId}")
    public AjaxResult getInfo(@PathVariable("visitorId") Long visitorId)
    {
        return AjaxResult.success(hotelVisitorService.selectHotelVisitorByVisitorId(visitorId));
    }

    /**
     * 新增游客
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:add')")
    @Log(title = "游客", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HotelVisitor hotelVisitor)
    {
        return toAjax(hotelVisitorService.insertHotelVisitor(hotelVisitor));
    }

    /**
     * 修改游客
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:edit')")
    @Log(title = "游客", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HotelVisitor hotelVisitor)
    {
        return toAjax(hotelVisitorService.updateHotelVisitor(hotelVisitor));
    }

    /**
     * 删除游客
     */
    @PreAuthorize("@ss.hasPermi('hotel:visitor:remove')")
    @Log(title = "游客", businessType = BusinessType.DELETE)
	@DeleteMapping("/{visitorIds}")
    public AjaxResult remove(@PathVariable Long[] visitorIds)
    {
        return toAjax(hotelVisitorService.deleteHotelVisitorByVisitorIds(visitorIds));
    }


    public static void main(String[] args) throws IOException {

        getShort();

        // 汉诺塔
        //Scanner sc = new Scanner(System.in);
        //int i1 = sc.nextInt();
        //hannuota(i1, 'a', 'b', 'c');

        // 进程排序
        //processSort();

        // 水仙花数
        //waterFlower();

        // 报价
        //getPrice();

        // 获取两个字符串最长公共串
        //System.out.println(getPublicLong());
    }
    // 第一行输入6 8，第二行输入k.*e（代表开始位置、道路、墙壁、出口）
    public static  void getShort() throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        String[] s1 = bf.readLine().split(" ");
        int n = Integer.parseInt(s1[0]);
        int m = Integer.parseInt(s1[1]);
        //建立地图、标记图
        char[][] maze = new char[n][m];
        boolean[][] visited = new boolean[n][m];
        //纪录步数
        int[][] dis = new int[n][m];
        //纪录初始的坐标
        int ki = 0, kj = 0;
        for(int i = 0; i < n; i++){
            String s = bf.readLine();
            for(int j = 0; j < m; j++){
                dis[i][j] = Integer.MAX_VALUE;
                char c = s.charAt(j);
                maze[i][j] = c;
                if(c == 'k'){
                    ki = i;
                    kj = j;
                }
            }
        }

        int count = 0, min = Integer.MAX_VALUE;
        Queue<Integer> queue = new ArrayDeque<>();
        //二维数组的性质，保存了坐标，并且节省了空间
        queue.add(ki * m + kj);
        visited[ki][kj] = true;
        dis[ki][kj]= 0;
        while(!queue.isEmpty()){
            int temp = queue.poll();
            int tempi = temp / m, tempj = temp % m;
            //支持八个方向的移动或者不移动（但是因为Math.abs(i - j) == 1限定了绝对值为1，所以变成了四个方向）
            for(int i = -1; i <= 1; i++){
                for(int j = -1; j <= 1; j++){
                    if(Math.abs(i - j) == 1 &&
                            tempi + i >= 0 &&
                            tempi + i < n &&
                            tempj + j >= 0 &&
                            tempj + j < m &&
                            !visited[tempi + i][tempj + j]){
                        if(maze[tempi + i][tempj + j] == '.'){
                            visited[tempi + i][tempj + j] = true;
                            dis[tempi + i][tempj + j] = dis[tempi][tempj] + 1;
                            queue.add((tempi + i) * m + (tempj + j));
                        }
                        if(maze[tempi + i][tempj + j] == 'e'){
                            visited[tempi + i][tempj + j] = true;
                            dis[tempi + i][tempj + j] = dis[tempi][tempj] + 1;
                            min = Math.min(min, dis[tempi][tempj] + 1);
                            count++;
                        }
                    }
                }
            }
        }
        if(count == 0) {
            System.out.print(-1);
        }else{
            System.out.print(count + " " + min);
        }
    }

    /**
     * 获取两个字符串最长公共串
     */
    public static  String getPublicLong() {
        Scanner sc = new Scanner(System.in);
        String str1 = sc.nextLine();
        String str2 = sc.nextLine();

        int flag = 0;
        String MaxStr = str1.length() > str2.length() ? str1 : str2;
        String MinStr = str1.length() > str2.length() ? str2 : str1;

        int minStrLen = MinStr.length();
        for(int i = 0; i < minStrLen; i++){
            for(int x = 0, y = minStrLen - i;  y <= minStrLen;  x++, y++){

                String subStr = MinStr.substring(x,y);

                if(MaxStr.contains(subStr)){
                    return subStr;
                }
            }
        }
        return null;
    }

    /**
     * 报价
     */
    public  static  void getPrice() {
        Scanner sc = new Scanner(System.in);
        String priceStrs = sc.nextLine();
        List<Integer> priceList = new LinkedList<>();
        List<Integer> result = new LinkedList<>();


        // 得到所有的每日报价
        String[] priceArr = priceStrs.split(" ");
        for (int i = 0; i < priceArr.length; i++) {
            String priceStr = priceArr[i];
            priceList.add(Integer.parseInt(priceStr));
        }

        int target = sc.nextInt();

        for (int i = 0; i < priceList.size(); i++) {
            Integer a = priceList.get(i);
            for (int j = 0; j < priceList.size(); j++) {
                Integer b = priceList.get(j);
                Integer two = a + b;
                // 除了自己与自己相加
                if(!b.equals(a) && two.equals(target)) {
                    result.add(a);
                }
            }
        }
        System.out.println(result.toString());

    }

    /**
     * 水仙花数
     * 输入一个整数a与一个整数b, 用空格分隔
     *
     * 输出a到b区间内的水仙花数
     */
    public static void waterFlower() {

        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();

        // 开始数
        Integer start = a;
        // 结束数
        Integer end = b;
        if(start > end) {
            start = b;
            end = a;
        }
        for (int i = a; i <= b; i++) {
            String numberStr = String.valueOf(i);

            Integer hundred = Integer.parseInt(numberStr.substring(0, 1));
            Integer ten = Integer.parseInt(numberStr.substring(1, 2));
            Integer singer = Integer.parseInt(numberStr.substring(2, 3));

            // 水仙花数的规则
            Integer sum = (hundred * hundred * hundred) + (ten * ten * ten) + (singer * singer * singer);
            if(sum.equals(i)) {
                System.out.println(i);
            }
        }
    }

    /**
     * 进程排序
     * 第一行输入两个整数n和k，n表示当前系统中运行的进程数；k表示要终止进程的PID
     * 第二行输入n个正整数，表示进程列表，每个整数表示进程的PID
     * 第三行输入n个正整数，表示进程列表中的进程对应的父进程PPID列表
     *
     * 输出当进程k终止时，所有会被终止的进程PID，并按PID升序排列，每个PID用空格分隔
     */
    public static  void processSort() {
        Scanner sc = new Scanner(System.in);
        // 进程个数
        int  n = sc.nextInt();
        // 要终止进程的pid
        int  k = sc.nextInt();
        // pid集合
        List<Integer> pidList = new LinkedList<>();
        // pPid集合
        List<Integer> pPidList = new LinkedList<>();
        // 最终停止的pid集合
        List<Integer> resultPidList = new LinkedList<>();
        // 先把要终止的k进程添加进来先
        resultPidList.add(k);


        // 输入进程pid
        for (int i = 0; i < n; i++) {
            int pid = sc.nextInt();
            pidList.add(pid);
        }

        // 输入pPid
        for (int i = 0; i < n; i++) {
            int pPid = sc.nextInt();
            pPidList.add(pPid);
        }


        // 找出pPidList集合里等于k的父进程id时的索引，并且根据索引去pidList找回对应的子进程（可能多个）
        for (int j = 0; j < pPidList.size(); j++) {
            Integer pPid = pPidList.get(j);
            if(pPid.equals(k)) {
                resultPidList.add(pidList.get(j));
            }
        }

        Collections.sort(resultPidList);

        System.out.println(resultPidList.toString());

    }

    /**
     * 汉诺塔算法
     * @param num
     * @param a 起始柱
     * @param b 辅助柱
     * @param c 目标柱
     */
    public static void hannuota(int num, char a, char b, char c) {
        if(num == 1) {
            System.out.println("第" + num + "个圆盘从" + a + "->" + c);
        }else {
            hannuota(num - 1, a, c, b);
            System.out.println("第" + num + "个圆盘从" + a + "->" + c);
            hannuota(num - 1, b, a, c);
        }
    }






}
