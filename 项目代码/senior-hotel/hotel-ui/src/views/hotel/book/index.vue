<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="预约编码" prop="bookCode">
        <el-input
          v-model="queryParams.bookCode"
          placeholder="请输入预约编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入住时间">
        <el-date-picker
          v-model="daterangeInTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="离开时间">
        <el-date-picker
          v-model="daterangeOutTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="预约人" prop="bookName">
        <el-input
          v-model="queryParams.bookName"
          placeholder="请输入预约人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约人手机" prop="bookPhone">
        <el-input
          v-model="queryParams.bookPhone"
          placeholder="请输入预约人手机"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约人邮箱" prop="bookEmail">
        <el-input
          v-model="queryParams.bookEmail"
          placeholder="请输入预约人邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['hotel:book:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['hotel:book:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['hotel:book:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hotel:book:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bookList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="预约编码" align="center" prop="bookCode" />
      <el-table-column label="房间类型" align="center" prop="roomTypeName" />
      <el-table-column label="入住时间" align="center" prop="inTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.inTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="离开时间" align="center" prop="outTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.outTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约人" align="center" prop="bookName" />
      <el-table-column label="预约人手机" align="center" prop="bookPhone" />
      <el-table-column label="预约人邮箱" align="center" prop="bookEmail" />
      <el-table-column label="是否入住" align="center" prop="moveIn">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_is_show" :value="scope.row.moveIn"/>
        </template>
      </el-table-column>
      <el-table-column label="是否离开" align="center" prop="moveOut">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_is_show" :value="scope.row.moveOut"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hotel:book:edit']"
          >修改</el-button>
          <el-button
            v-if="scope.row.moveIn == 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleMoveIn(scope.row)"
            v-hasPermi="['hotel:book:edit']"
          >办理入住</el-button>
          <el-button
            v-if="scope.row.moveIn == 1 && scope.row.moveOut == 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleMoveOut(scope.row)"
            v-hasPermi="['hotel:book:edit']"
          >办理退房</el-button>
          <!--<el-button-->
            <!--size="mini"-->
            <!--type="text"-->
            <!--icon="el-icon-delete"-->
            <!--@click="handleDelete(scope.row)"-->
            <!--v-hasPermi="['hotel:book:remove']"-->
          <!--&gt;删除</el-button>-->
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改酒店预约对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="入住时间" prop="inTime">
          <el-date-picker clearable
            v-model="form.inTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择入住时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="离开时间" prop="outTime">
          <el-date-picker clearable
            v-model="form.outTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择离开时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约人" prop="bookName">
          <el-input v-model="form.bookName" placeholder="请输入预约人" />
        </el-form-item>
        <el-form-item label="预约人手机" prop="bookPhone">
          <el-input v-model="form.bookPhone" placeholder="请输入预约人手机" />
        </el-form-item>
        <el-form-item label="预约人邮箱" prop="bookEmail">
          <el-input v-model="form.bookEmail" placeholder="请输入预约人邮箱" />
        </el-form-item>

        <el-form-item label="是否入住">
          <el-radio-group v-model="form.moveIn">
            <el-radio
              v-for="dict in dict.type.sys_is_show"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否离开">
          <el-radio-group v-model="form.moveOut">
            <el-radio
              v-for="dict in dict.type.sys_is_show"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { moveIn, moveOut, listBook, getBook, delBook, addBook, updateBook } from "@/api/hotel/book";

export default {
  name: "Book",
  dicts: ['sys_is_show'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 是否离开，1是 0否时间范围
      daterangeInTime: [],
      // 是否离开，1是 0否时间范围
      daterangeOutTime: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 酒店预约表格数据
      bookList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        roomTypeId: null,
        roomId: null,
        inTime: null,
        outTime: null,
        bookName: null,
        bookPhone: null,
        bookEmail: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询酒店预约列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeInTime && '' != this.daterangeInTime) {
        this.queryParams.params["beginInTime"] = this.daterangeInTime[0];
        this.queryParams.params["endInTime"] = this.daterangeInTime[1];
      }
      if (null != this.daterangeOutTime && '' != this.daterangeOutTime) {
        this.queryParams.params["beginOutTime"] = this.daterangeOutTime[0];
        this.queryParams.params["endOutTime"] = this.daterangeOutTime[1];
      }
      listBook(this.queryParams).then(response => {
        this.bookList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        bookId: null,
        roomTypeId: null,
        roomId: null,
        inTime: null,
        outTime: null,
        bookName: null,
        bookPhone: null,
        bookEmail: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeInTime = [];
      this.daterangeOutTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.bookId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加酒店预约";
    },
    /**  办理退房*/
    handleMoveOut(row) {
      moveOut(row.bookId).then((res) => {
        this.getList()
        this.$modal.msgSuccess(res.msg);
      }).catch((res) => {
        // 报错不用手动提示，系统统一拦截提示
      });
    },
    /** 办理入住操作*/
    handleMoveIn(row) {
      moveIn(row.bookId).then((res) => {
        console.log(1111111111111)
        this.getList()
        this.$modal.msgSuccess(res.msg + "房间号：" +res.data);
      }).catch((res) => {
        // 报错不用手动提示，系统统一拦截提示
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const bookId = row.bookId || this.ids
      getBook(bookId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改酒店预约";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.bookId != null) {
            updateBook(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBook(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const bookIds = row.bookId || this.ids;
      this.$modal.confirm('是否确认删除酒店预约编号为"' + bookIds + '"的数据项？').then(function() {
        return delBook(bookIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('hotel/book/export', {
        ...this.queryParams
      }, `book_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
