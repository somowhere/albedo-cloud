<template>
  <div class="app-container">
    <!--工具栏-->
    <div class="head-container">
      <div v-if="crud.props.searchToggle">
        <el-input @keyup.enter.native="toQuery" class="filter-item input-small" clearable placeholder="输入名称搜索" size="small"
                  v-model="query.name"/>
        <rrOperation/>
      </div>
      <crudOperation :permission="permission"/>
    </div>
    <!--Form表单-->
    <el-dialog
      :before-close="crud.cancelCU"
      :close-on-click-modal="false"
      :title="crud.status.title"
      :visible.sync="crud.status.cu > 0"
      append-to-body
      width="800px"
    >
      <el-form :inline="true" :model="form" label-width="120px" ref="form" size="small">
        <el-form-item :rules="[{min: 0,max: 64,message: '长度在 0 到 64 个字符', trigger: 'blur'},]" label="名称" prop="name">
          <el-input class="input-small" v-model="form.name"></el-input>

        </el-form-item>
        <el-form-item :rules="[{required: true,message: '请输入url', trigger: 'blur'},{min: 0,max: 255,message: '长度在 0 到 255 个字符', trigger: 'blur'},]" label="url"
                      prop="url">
          <el-input class="input-small" v-model="form.url"></el-input>

        </el-form-item>
        <el-form-item :rules="[{required: true,message: '请输入用户名', trigger: 'blur'},{min: 0,max: 64,message: '长度在 0 到 64 个字符', trigger: 'blur'},]" label="用户名"
                      prop="username">
          <el-input class="input-small" v-model="form.username"></el-input>

        </el-form-item>
        <el-form-item :rules="[{min: 0,max: 64,message: '长度在 0 到 64 个字符', trigger: 'blur'},]" label="密码"
                      prop="password">
          <el-input class="input-small" v-model="form.password"></el-input>

        </el-form-item>
        <el-form-item :rules="[{min: 0,max: 255,message: '长度在 0 到 255 个字符', trigger: 'blur'},]" label="备注"
                      prop="description">
          <el-input class="input-small" v-model="form.description"></el-input>

        </el-form-item>
      </el-form>
      <div class="dialog-footer" slot="footer">
        <el-button @click="crud.cancelCU" type="text">取消</el-button>
        <el-button :loading="crud.status.cu === 2" @click="crud.submitCU" type="primary">确认</el-button>
      </div>
    </el-dialog>
    <!--表格渲染-->
    <el-table
      :data="crud.data"
      @selection-change="crud.selectionChangeHandler"
      @sort-change="crud.sortChange"
      ref="table"
      style="width: 100%;"
      v-loading="crud.loading"
    >
      <el-table-column type="selection" width="55"/>
      <el-table-column :show-overflow-tooltip="true" align="center" label="名称" prop="name"/>
      <el-table-column :show-overflow-tooltip="true" align="center" label="url" prop="url"/>
      <el-table-column :show-overflow-tooltip="true" align="center" label="用户名" prop="username"/>
      <el-table-column :show-overflow-tooltip="true" align="center" label="密码" prop="password"/>
      <el-table-column fixed="right" label="操作" v-permission="[permission.edit,permission.del]" width="120px">
        <template slot-scope="scope">
          <udOperation :data="scope.row" :permission="permission"/>
        </template>
      </el-table-column>
    </el-table>
    <!--分页组件-->
    <pagination/>
  </div>
</template>

<script>
  import crudDatasourceConf from '@/views/gen/datasource-conf/datasource-conf-service'
  import CRUD, {crud, form, header, presenter} from '@crud/crud'
  import rrOperation from '@crud/RR.operation'
  import udOperation from '@crud/UD.operation'
  import crudOperation from '@crud/CRUD.operation'
  import pagination from '@crud/Pagination'
  import validate from '@/utils/validate'
  import {mapGetters} from 'vuex'

  const defaultForm = {
    name: null,
    url: null,
    username: null,
    password: null,
    description: null,
  }
  export default {
    name: 'DatasourceConf',
    components: {crudOperation, rrOperation, udOperation, pagination},
    cruds() {
      return CRUD({title: '数据源', crudMethod: {...crudDatasourceConf}})
    },
    mixins: [presenter(), header(), form(defaultForm), crud()],
    // 数据字典
    data() {
      return {
        delFlagOptions: undefined,
        validateNumber: (rule, value, callback) => {
          validate.isNumber(rule, value, callback)
        },
        validateDigits: (rule, value, callback) => {
          validate.isDigits(rule, value, callback)
        },
        permission: {
          edit: 'gen_datasourceConf_edit',
          del: 'gen_datasourceConf_del'
        }
      }
    },
    computed: {
      ...mapGetters(["permissions", "dicts"])
    },
    created() {
      this.delFlagOptions = this.dicts["sys_flag"]
    },
    methods: {}
  };
</script>
