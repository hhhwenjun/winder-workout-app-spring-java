<template>
  <div>
    <div style="width: 400px; margin: 200px auto;">
      <h1 style="text-align: center; margin-bottom: 30px">Create A New Event</h1>
      <el-form :model="event" :rules="rules" ref="ruleFormRef" size="large">
        <el-form-item prop="name">
          <el-input v-model="event.name" placeholder="Event Name"/>
        </el-form-item>
        <el-form-item prop="sport">
          <el-select style="width: 200px" v-model="event.sportid" placeholder="Sport" clearable label="Sport">
            <el-option v-for="item in rules.sport_options" :label="item.sportname" :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item prop="date">
          <el-date-picker style="width: 200px"
                          v-model="event.date"
                          type="date"
                          placeholder="Pick a day"
          />
        </el-form-item>
        <el-form-item prop="time">
          <el-time-select style="width: 200px"
                          v-model="event.time"
                          start="06:00"
                          step="00:30"
                          end="21:00"
                          placeholder="Select time"
          />
        </el-form-item>
        <el-form-item prop="location">
          <el-input v-model="event.location" placeholder="Event Location"/>
        </el-form-item>
        <el-form-item prop="description">
          <el-input v-model="event.description" placeholder="Brief Description"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="submit">Submit</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>


<script setup>
import {reactive, getCurrentInstance, ref} from 'vue'
import {ElNotification} from "element-plus";
import request from "../request";
import router from "../router";

const {proxy} = getCurrentInstance()

const rules = reactive({
  name: [
    {required: true, message: 'Please enter name', trigger: 'blur'}
  ],
  sport_options: []
})

const state = reactive({})
// Get the required sport data to show as the options
request.get('/sport').then(res => {
  rules.sport_options = res
})

const event = reactive({
  name: "",
  createrid: localStorage.getItem("userid"),
  date: "",
  time: "",
  location: "",
  description: "",
  participantid: localStorage.getItem("userid"),
  sportid: ""
})


const submit = () => {
  console.log(event)
  proxy.$refs.ruleFormRef.validate((valid) => {
    if (valid) {
      request.post('/event/create', event).then(res => {
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