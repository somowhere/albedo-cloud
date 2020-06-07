<template>
  <div class="app-container">
    <!--工具栏-->
    <div class="head-container">
      <div v-if="crud.props.searchToggle">
                <el-input class="filter-item input-small" v-model="query.title" clearable size="small" placeholder="输入标题搜索" @keyup.enter.native="toQuery" />
          <el-input class="filter-item input-small" v-model="query.name" clearable size="small" placeholder="输入名称搜索" @keyup.enter.native="toQuery" />
        <rrOperation />
      </div>
      <crudOperation :permission="permission" />
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
      <el-form ref="form" :inline="true" :model="form" label-width="120px" size="small">
        <el-form-item label="标题" prop="title" :rules="[{min: 0,max: 32,message: '长度在 0 到 32 个字符', trigger: 'blur'},]">
              <el-input v-model="form.title" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="作者" prop="author" :rules="[{required: true,message: '请输入作者', trigger: 'blur'},{min: 0,max: 50,message: '长度在 0 到 50 个字符', trigger: 'blur'},]">
              <el-input v-model="form.author" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="名称" prop="name" :rules="[{min: 0,max: 50,message: '长度在 0 到 50 个字符', trigger: 'blur'},]">
              <el-input v-model="form.name" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="邮箱" prop="email" :rules="[{min: 0,max: 100,message: '长度在 0 到 100 个字符', trigger: 'blur'},]">
              <el-input v-model="form.email" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="手机" prop="phone" :rules="[{min: 0,max: 32,message: '长度在 0 到 32 个字符', trigger: 'blur'},]">
              <el-input v-model="form.phone" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="activated_" prop="activated" :rules="[{required: true,message: '请输入activated_', trigger: 'blur'},{validator:validateDigits},]">
              <el-input v-model="form.activated" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="key" prop="number" :rules="[{validator:validateDigits},]">
              <el-input v-model="form.number" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="money_" prop="money" :rules="[{ validator:validateNumber},]">
              <el-input v-model="form.money" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="amount_" prop="amount" :rules="[{ validator:validateNumber},]">
              <el-input v-model="form.amount" class="input-small"></el-input>
        
        </el-form-item>
        <el-form-item label="reset_date" prop="resetDate" :rules="[]">
              <el-date-picker v-model="form.resetDate" type="datetime" value-format="yyyy-MM-dd HH:mm:ss" >
              </el-date-picker>
        
        </el-form-item>
        <el-form-item label="备注" prop="description" :rules="[{min: 0,max: 255,message: '长度在 0 到 255 个字符', trigger: 'blur'},]">
              <el-input v-model="form.description" class="input-small"></el-input>
        
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="text" @click="crud.cancelCU">取消</el-button>
        <el-button :loading="crud.status.cu === 2" type="primary" @click="crud.submitCU">确认</el-button>
      </div>
    </el-dialog>
    <!--表格渲染-->
    <el-table
      ref="table"
      v-loading="crud.loading"
      :data="crud.data"
      style="width: 100%;"
      @sort-change="crud.sortChange"
      @selection-change="crud.selectionChangeHandler"
    >
      <el-table-column type="selection" width="55" />
      <el-table-column align="center" label="标题" :show-overflow-tooltip="true" prop="title" />
      <el-table-column align="center" label="作者" :show-overflow-tooltip="true" prop="author" />
      <el-table-column align="center" label="名称" :show-overflow-tooltip="true" prop="name" />
      <el-table-column align="center" label="邮箱" :show-overflow-tooltip="true" prop="email" />
      <el-table-column align="center" label="手机" :show-overflow-tooltip="true" prop="phone" />
      <el-table-column align="center" label="activated_" :show-overflow-tooltip="true" prop="activated" />
      <el-table-column align="center" label="key" :show-overflow-tooltip="true" prop="number" />
      <el-table-column align="center" label="money_" :show-overflow-tooltip="true" prop="money" />
      <el-table-column align="center" label="amount_" :show-overflow-tooltip="true" prop="amount" />
      <el-table-column align="center" label="reset_date" :show-overflow-tooltip="true" prop="resetDate" />
      <el-table-column v-permission="[permission.edit,permission.del]" label="操作" width="120px" fixed="right">
        <template slot-scope="scope">
          <udOperation :data="scope.row" :permission="permission" />
        </template>
      </el-table-column>
    </el-table>
	<!--分页组件-->
    <pagination />
  </div>
</template>

<script>
import crudTestBook from '@/views/test/test-book/test-book-service'
import CRUD, { crud, form, header, presenter } from '@crud/crud'
import rrOperation from '@crud/RR.operation'
import udOperation from '@crud/UD.operation'
import crudOperation from '@crud/CRUD.operation'
import pagination from '@crud/Pagination'
import validate from '@/utils/validate'
import { mapGetters } from 'vuex'

const defaultForm = {
  title: null,
  author: null,
  name: null,
  email: null,
  phone: null,
  activated: null,
  number: null,
  money: null,
  amount: null,
  resetDate: null,
  description: null,
}
export default {
  name: 'TestBook',
  components: { crudOperation, rrOperation, udOperation, pagination },
  cruds() {
    return CRUD({ title: '测试书籍', crudMethod: { ...crudTestBook }})
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
        edit: 'test_testBook_edit',
        del: 'test_testBook_del'
      }
     }
  },
  computed: {
    ...mapGetters(["permissions","dicts"])
  },
  created() {
    this.delFlagOptions = this.dicts["sys_flag"]
  },
  methods: {

  }
};
</script>