<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="房间号" prop="roomNum">
        <el-input
          v-model="queryParams.roomNum"
          placeholder="请输入房间号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间类型" prop="roomTypeId">
        <!--<el-input-->
          <!--v-model="queryParams.roomTypeId"-->
          <!--placeholder="请输入房间类型"-->
          <!--clearable-->
          <!--@keyup.enter.native="handleQuery"-->
        <!--/>-->
        <el-select clearable v-model="queryParams.roomTypeId" placeholder="请选择房间类型">
          <el-option
            v-for="item in roomTypeOptions"
            :key="item.roomTypeId"
            :label="item.roomTypeName"
            :value="item.roomTypeId">
          </el-option>
        </el-select>
      </el-form-item>
      <!--<el-form-item label="房间介绍" prop="roomIntroduce">-->
        <!--<el-input-->
          <!--v-model="queryParams.roomIntroduce"-->
          <!--placeholder="请输入房间介绍"-->
          <!--clearable-->
          <!--@keyup.enter.native="handleQuery"-->
        <!--/>-->
      <!--</el-form-item>-->
      <el-form-item label="是否上架" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择是否上架" clearable>
          <el-option
            v-for="dict in dict.type.sys_is_show"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['hotel:room:add']"
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
          v-hasPermi="['hotel:room:edit']"
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
          v-hasPermi="['hotel:room:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hotel:room:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="roomList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="房间id" align="center" prop="roomId" />
      <el-table-column label="房间号" align="center" prop="roomNum" />
      <el-table-column label="房间类型" align="center" prop="roomTypeName" />
      <el-table-column label="房间价格" align="center" prop="roomPrice" />
      <el-table-column label="封面" align="center" prop="roomCover" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.roomCover" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <!--<el-table-column label="房间介绍" align="center" prop="roomIntroduce" />-->
      <!--<el-table-column label="房间详情" align="center" prop="roomDetail" />-->
      <el-table-column label="是否上架" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_is_show" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hotel:room:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hotel:room:remove']"
          >删除</el-button>
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

    <!-- 添加或修改酒店房间对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="750px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="房间号" prop="roomNum">
          <el-input v-model="form.roomNum" placeholder="请输入房间号" />
        </el-form-item>
        <el-form-item label="房间类型" prop="roomTypeId">
          <el-select v-model="form.roomTypeId" placeholder="请选择房间类型">
            <el-option
              v-for="item in roomTypeOptions"
              :key="item.roomTypeId"
              :label="item.roomTypeName"
              :value="item.roomTypeId">
            </el-option>
          </el-select>
          <!--<el-input v-model="form.roomTypeId" placeholder="请输入房间类型id" />-->
        </el-form-item>
        <el-form-item label="房间价格" prop="roomPrice">
          <el-input v-model="form.roomPrice" placeholder="请输入房间价格" />
        </el-form-item>
        <el-form-item label="封面">
          <image-upload v-model="form.roomCover" :limit="1"/>
        </el-form-item>
        <el-form-item label="房间介绍" prop="roomIntroduce">
          <el-input v-model="form.roomIntroduce" placeholder="请输入房间介绍" />
        </el-form-item>
        <el-form-item label="房间详情">
          <editor v-model="form.roomDetail" :min-height="192"/>
        </el-form-item>
        <el-form-item label="是否上架">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_is_show"
              :key="dict.value"
:label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入排序" />
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
import { listRoom, getRoom, delRoom, addRoom, updateRoom } from "@/api/hotel/room";
import { listType } from "@/api/hotel/type";

export default {
  name: "Room",
  dicts: ['sys_is_show'],
  data() {
    return {
      // 房间类型数据
      roomTypeOptions: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 酒店房间表格数据
      roomList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        roomNum: null,
        roomTypeId: null,
        roomIntroduce: null,
        status: null,
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
    this.getRoomTypeOptions();
  },
  methods: {
    // 查询房间类型数据
    getRoomTypeOptions() {
      listType(null).then(response => {
        this.roomTypeOptions = response.rows;

    });
    },
    /** 查询酒店房间列表 */
    getList() {
      this.loading = true;
      listRoom(this.queryParams).then(response => {
        this.roomList = response.rows;
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
        roomId: null,
        roomNum: null,
        roomTypeId: null,
        roomPrice: null,
        roomCover: null,
        roomIntroduce: null,
        roomDetail: null,
        status: "0",
        orderNum: null,
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.roomId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加酒店房间";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const roomId = row.roomId || this.ids
      getRoom(roomId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改酒店房间";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.roomId != null) {
            updateRoom(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRoom(this.form).then(response => {
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
      const roomIds = row.roomId || this.ids;
      this.$modal.confirm('是否确认删除酒店房间编号为"' + roomIds + '"的数据项？').then(function() {
        return delRoom(roomIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('hotel/room/export', {
        ...this.queryParams
      }, `room_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
