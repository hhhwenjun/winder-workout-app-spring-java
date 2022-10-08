<template>
  <div>
    <div style="width: 400px; margin: 200px auto;">
      <h1 style="text-align: center; margin-bottom: 30px">New event</h1>
      <el-form :model="event" :rules="rules" ref="ruleFormRef" size="large">
        <el-form-item prop="name">
          <el-input v-model="event.name" placeholder="Name" />
        </el-form-item>
        <el-form-item prop="time">
          <el-input v-model="event.time" placeholder="Time"  />
        </el-form-item>
        <el-form-item prop="location">
          <el-input v-model="event.location" placeholder="Location" />
        </el-form-item>
        <el-form-item prop="description">
          <el-input v-model="event.description" placeholder="Description"  />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="submit">Submit</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>


<script setup>
import {reactive, getCurrentInstance} from 'vue'
import {ElNotification } from "element-plus";
import request from "../request";
import router from "../router";
const { proxy } = getCurrentInstance()

const rules = reactive({
  name: [
    { required: true, message: 'Please enter name', trigger: 'blur' }
  ],
})

const event = reactive({
  name:"",
  createrid: localStorage.getItem("userid"),
  time:"",
  location:"",
  description:"",
  participantid:localStorage.getItem("userid")

})


const submit = () => {
  proxy.$refs.ruleFormRef.validate((valid) => {
    if(valid) {
      console.log(event)
      request.post('/event/create', event).then(res => {
        console.log(event)
        if (res.code === '200') {
          ElNotification({
            type: 'success',
            message: 'Create Success'
          })
          router.push('/youreventcreated')
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
        message: 'Wrong information'
      })
    }
  })
}
</script>

<style scoped>

</style>