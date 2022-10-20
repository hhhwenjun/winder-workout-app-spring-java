<script setup>
import {ref, reactive, getCurrentInstance} from 'vue'
import {User, Lock} from '@element-plus/icons-vue'
import {ElNotification } from "element-plus";
import request from "../request";
import router from "../router";
const { proxy } = getCurrentInstance()
const checked1 = ref(true)

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

<style scoped>
p{
  font-size: 20px;
}

.login-page {
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
  font-size: 20px;
}

.login-page-section {
  min-height: 200px;
  width: 400px;
  padding: 8px;
  margin-top: 25px;
}

.winder-primary-button {
  height: 35px;
  width: 100%;
  font-size: 22px;
}

</style>

<template>
  <div class="login-page">
    <div class="login-page-section" >
      <h1 style="text-align: center; margin-bottom: 30px">Winder</h1>
      <el-form :model="user" :rules="rules" ref="ruleFormRef" size="large">
        User name:
        <el-form-item prop="username">
          <el-input v-model="user.username" :prefix-icon="User" />
        </el-form-item>
        Password:
        <el-form-item prop="password">
          <el-input v-model="user.password" :prefix-icon="Lock" show-password  />
        </el-form-item>
        <el-checkbox v-model="checked1" label="Keep me login." size="default" />
        <el-form-item>
          <el-button type="primary" class="winder-primary-button" @click="login">Login</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="login-page-section">
      <p>Or create your Winder account?</p>
      <el-button type="primary" class="winder-primary-button" @click="register">Register</el-button>
    </div>
  </div>
</template>