<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="新闻标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入新闻标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否显示" prop="isShow">
        <el-select v-model="queryParams.isShow" placeholder="请选择是否显示" clearable>
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
          v-hasPermi="['hotel:news:add']"
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
          v-hasPermi="['hotel:news:edit']"
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
          v-hasPermi="['hotel:news:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hotel:news:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="newsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="新闻id" align="center" prop="newsId" />
      <el-table-column label="新闻标题" align="center" prop="title" />
      <!--<el-table-column label="常识详细" align="center" prop="detail" />-->
      <el-table-column label="封面" align="center" prop="cover" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.cover" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="是否显示" align="center" prop="isShow">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_is_show" :value="scope.row.isShow"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hotel:news:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hotel:news:remove']"
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

    <!-- 添加或修改酒店新闻中心对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="650px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="新闻标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入新闻标题" />
        </el-form-item>
        <el-form-item label="常识详细">
          <editor v-model="form.detail" :min-height="192"/>
        </el-form-item>
        <el-form-item label="封面">
          <image-upload v-model="form.cover" :limit="1"/>
        </el-form-item>
        <el-form-item label="排序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="是否显示" prop="isShow">
          <el-select v-model="form.isShow" placeholder="请选择是否显示标志">
            <el-option
              v-for="dict in dict.type.sys_is_show"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
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
import { listNews, getNews, delNews, addNews, updateNews } from "@/api/hotel/news";

export default {
  name: "News",
  dicts: ['sys_is_show'],
  data() {
    return {
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
      // 酒店新闻中心表格数据
      newsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        isShow: null,
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
    /** 查询酒店新闻中心列表 */
    getList() {
      this.loading = true;
      listNews(this.queryParams).then(response => {
        this.newsList = response.rows;
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
        newsId: null,
        title: null,
        detail: null,
        cover: null,
        orderNum: null,
        isShow: null,
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
      this.ids = selection.map(item => item.newsId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加酒店新闻中心";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const newsId = row.newsId || this.ids
      getNews(newsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改酒店新闻中心";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.newsId != null) {
            updateNews(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNews(this.form).then(response => {
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
      const newsIds = row.newsId || this.ids;
      this.$modal.confirm('是否确认删除酒店新闻中心编号为"' + newsIds + '"的数据项？').then(function() {
        return delNews(newsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('hotel/news/export', {
        ...this.queryParams
      }, `news_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
