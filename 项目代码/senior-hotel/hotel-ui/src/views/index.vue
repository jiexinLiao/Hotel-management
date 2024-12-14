<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          W 酒店是喜达屋旗下的全球现代奢华时尚生活品牌，其官方的定位是“Lifestye”品牌，业内普遍将其归类为大型的Boutique hotel路线。激发灵感、创造潮流、大胆创新的 W 酒店在业界影响深远，为宾客提供终极的入住体验。
        </blockquote>
        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>酒店管理系统</h2>
        <p>
          1、菜单管理。
        </p>
        <p>
          2、新闻管理。
        </p>
        <p>
          3、轮播图管理。
        </p>
        <p>
          4、证书管理。
        </p>
        <p>
          5、游客列表。
        </p>
        <p>
          6、产品管理。
        </p>
      </el-col>

    </el-row>
    <el-divider />

  </div>
</template>

<script>
  export default {
    name: "Index",
    data() {
      return {
        // 版本号
        version: "3.8.2",
      };
    },
    created() {
      this.setTheme()
    },
    methods: {
      setTheme() {
        // this.$cache.local.set(
        //   "layout-setting",
        //   `{
        //     "topNav":false,
        //     "tagsView":true,
        //     "fixedHeader":false,
        //     "sidebarLogo":false,
        //     "dynamicTitle":false,
        //     "sideTheme":"theme-light",
        //     "theme":"#D860DE"
        //   }`
        // );
      },
      goTarget(href) {
        window.open(href, "_blank");
      },
    },
  };
</script>

<style scoped lang="scss">
  .home {
    blockquote {
      padding: 10px 20px;
      margin: 0 0 20px;
      font-size: 17.5px;
      border-left: 5px solid #eee;
    }
    hr {
      margin-top: 20px;
      margin-bottom: 20px;
      border: 0;
      border-top: 1px solid #eee;
    }
    .col-item {
      margin-bottom: 20px;
    }

    ul {
      padding: 0;
      margin: 0;
    }

    font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 13px;
    color: #676a6c;
    overflow-x: hidden;

    ul {
      list-style-type: none;
    }

    h4 {
      margin-top: 0px;
    }

    h2 {
      margin-top: 10px;
      font-size: 26px;
      font-weight: 100;
    }

    p {
      margin-top: 10px;

      b {
        font-weight: 700;
      }
    }

    .update-log {
      ol {
        display: block;
        list-style-type: decimal;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0;
        margin-inline-end: 0;
        padding-inline-start: 40px;
      }
    }
  }
</style>

