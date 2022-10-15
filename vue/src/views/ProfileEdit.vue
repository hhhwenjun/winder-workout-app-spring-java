<template>
  <div>
    <div style="width: 400px; margin: 20px auto;">
      <el-form :model="state.user" :rules="rules"  ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">Information</h2>
        <el-form-item prop="gender">
          <el-input v-model="state.user.sex" placeholder="Sex"/>
        </el-form-item>
        <el-form-item prop="age">
          <el-input v-model="state.user.age" placeholder="Age"  />
        </el-form-item>
        <el-form-item prop="phone">
          <el-input v-model="state.user.phone" placeholder="Phone" />
        </el-form-item>
        <el-form-item prop="email">
          <el-input v-model="state.user.email" placeholder="Email"  />
        </el-form-item>
        <el-form-item prop="address">
          <el-input v-model="state.user.address" placeholder="address" />
        </el-form-item>
        <el-form-item prop="bio">
          <el-input v-model="state.user.bio" placeholder="bio" type="textarea"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="profileedit">Finish</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import {ref, reactive, getCurrentInstance} from 'vue'
import {User, Lock} from '@element-plus/icons-vue'
import {ElNotification } from "element-plus";
import request from "../request";
import router from "../router";

const { proxy } = getCurrentInstance()

let state = reactive({
  user:{}
})

request.get('/user/userid/'+localStorage.getItem("userid")).then(res => {
  state.user = reactive(res)
  console.log(state.user);
})

const rules = reactive({
  username: [
    { required: true, message: 'Please enter username', trigger: 'blur' }
  ],
  password: [
    { required: true, message: 'Please enter password', trigger: 'blur' }
  ],
})

const profileedit = () => {
  proxy.$refs.ruleFormRef.validate((valid) => {
    if(valid) {
      console.log(state.user);
      request.post('/user/update', state.user).then(res => {
        if (res.code === '200') {
          ElNotification({
            type: 'success',
            message: 'Edit Success'
          })
          localStorage.setItem('username', state.user.username)
          location. reload()
        } else {
          ElNotification({
            type: 'error',
            message: res.msg
          })
        }
      })
    } else {
      ElNotification({
        type: 'error',
        message: 'Errors'
      })
    }
  })
}

</script>

<style scoped>

</style>