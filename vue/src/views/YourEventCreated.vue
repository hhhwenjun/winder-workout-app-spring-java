<template>
  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="name" label="name"></el-table-column>


    <el-table-column label="Operations">
      <template #default="scope">

        <el-button text @click="edit(scope.$index)"
        >Edit</el-button
        >

        <el-dialog v-model="state.dialogTableVisible" title="Shipping address">
          <el-form :model="state.event" :rules="rules" ref="ruleFormRef" size="large">
            <el-form-item prop="name">
              <el-input v-model="state.event.name" placeholder="Name" />
            </el-form-item>
            <el-form-item prop="time">
              <el-input v-model="state.event.time" placeholder="Time"  />
            </el-form-item>
            <el-form-item prop="location">
              <el-input v-model="state.event.location" placeholder="Location" />
            </el-form-item>
            <el-form-item prop="description">
              <el-input v-model="state.event.description" placeholder="Description"  />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" style="width: 100%" @click="submit">Submit</el-button>
            </el-form-item>
          </el-form>
        </el-dialog>

        <el-button
            size="small"
            type="danger"
            @click="handleDelete(scope.$index)"
        >Delete</el-button>
      </template>
    </el-table-column>
  </el-table>

</template>

<script setup>
import {getCurrentInstance, reactive} from "vue";
import request from "../request.js";
import {ElNotification} from "element-plus";

const { proxy } = getCurrentInstance()

const state = reactive({
  tableData: [],
  dialogTableVisible : false,
  event:{
    name:"",
    createrid:"",
    time:"",
    location:"",
    description:"",
    participantid:""}
})
const rules = reactive({
  name: [
    { required: true, message: 'Please enter name', trigger: 'blur' }
  ],
})

request.get("/event/creater/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
})

const handleDelete = (index) => {
  request.delete("/event/"+state.tableData[index].id).then(res => {
    if (res.code === '200') {
      ElNotification({
        type: 'success',
        message: 'Delete Success'
      })
      location.reload()
    } else {
      ElNotification({
        type: 'error',
        message: res.msg
      })
    }
  })
}

const edit = (index) => {
  state.dialogTableVisible = true
  request.get('/event/'+state.tableData[index].id).then(res => {
    state.event = reactive(res)
  })
}

const submit = () => {
  proxy.$refs.ruleFormRef.validate((valid) => {
    if(valid) {
      request.post('/event/update', state.event).then(res => {
        if (res.code === '200') {
          ElNotification({
            type: 'success',
            message: 'Edit Success'
          })
          location.reload()
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