<template>
  <div>
    <div style="width: 400px; margin: 200px auto;">
      <h1 style="text-align: center; margin-bottom: 30px">Account</h1>
      <el-form :model="user" :rules="rules" ref="ruleFormRef" size="large">
        <el-form-item prop="username">
          <el-input v-model="user.username" :prefix-icon="User" />
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="user.password" :prefix-icon="Lock" show-password  />
        </el-form-item>
        <h2>Information</h2>
        <el-form-item prop="sex">
          <el-input v-model="user.sex" placeholder="Sex" />
        </el-form-item>
        <el-form-item prop="age">
          <el-input v-model="user.age" placeholder="Age"  />
        </el-form-item>
        <el-form-item prop="phone">
          <el-input v-model="user.phone" placeholder="Phone" />
        </el-form-item>
        <el-form-item prop="email">
          <el-input v-model="user.email" placeholder="Email"  />
        </el-form-item>
        <el-form-item prop="address">
          <el-input v-model="user.address" placeholder="address" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="register">Register</el-button>
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

const rules = reactive({
  username: [
    { required: true, message: 'Please enter username', trigger: 'blur' }
  ],
  password: [
    { required: true, message: 'Please enter password', trigger: 'blur' }
  ],
})

const user = reactive({})


const register = () => {
  proxy.$refs.ruleFormRef.validate((valid) => {
    if(valid) {
      request.post('/user/register', user).then(res => {
        if (res.code === '200') {
          ElNotification({
            type: 'success',
            message: 'Login Success'
          })
          request.get("/user/username/"+user.username).then(res => {
            localStorage.setItem('userid', res.id)
            localStorage.setItem('username', res.username)
            router.push('/')
          })
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
        message: 'Wrong username or password'
      })
    }
  })
}
</script>

