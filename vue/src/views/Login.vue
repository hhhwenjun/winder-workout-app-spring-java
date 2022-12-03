<template>
  <div>
    <div style="width: 400px; margin: 200px auto;">
      <h1 style="text-align: center; margin-bottom: 30px">Winder</h1>
      <el-form :model="user" :rules="rules" ref="ruleFormRef" size="large">
        <el-form-item prop="username">
          <el-input v-model="user.username" :prefix-icon="User" />
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="user.password" :prefix-icon="Lock" show-password  />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="login">Login</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div>
      <h1>Or haven't register already?</h1>
      <el-button type="primary" style="width: 200px" @click="register">Register now</el-button>
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

// login validation rules
const rules = reactive({
  username: [
    { required: true, message: 'Please enter username', trigger: 'blur' }
  ],
  password: [
    { required: true, message: 'Please enter password', trigger: 'blur' }
  ],
})

const user = reactive({})

const login = () => {
  // when click, get the instance
  proxy.$refs.ruleFormRef.validate((valid) => {
    if(valid) {
      // send request to backend, promise
      request.post('/user/login', user).then(res => {
        if (res.code === '200') {
          ElNotification({
            type: 'success',
            message: 'Login Success'
          })
          request.get("/user/username/"+user.username).then(res => {
            localStorage.setItem('userid', res.id)
            localStorage.setItem('username', res.username)
            router.push('/')
            location.reload()
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

const register = () =>{
  router.push("/register")
}

if(localStorage.getItem("username")!=null){
  router.push('/')
}
</script>

