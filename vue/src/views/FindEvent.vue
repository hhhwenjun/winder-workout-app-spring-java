<template>
  <div style="margin-bottom: 20px">
    <el-input style="width: 260px; margin-right: 10px" v-model="sportid" placeholder="Sportid" clearable></el-input>
    <el-button type="primary" @click="find"><el-icon style="margin-right: 3px"><Search /></el-icon> Find</el-button>
  </div>

  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="name" label="name"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button text @click="add(scope.$index)"
        >Add</el-button
        >
      </template>
    </el-table-column>
  </el-table>
</template>

<script setup>
import { Search } from '@element-plus/icons-vue'
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";

const sportid = ref('')

const state = reactive({
  tableDate: []
})

const find = () => {
  request.get("/event/find", {
    params: {
      userid: localStorage.getItem('userid'),
      sportid: sportid.value
    }
  })
      .then(res => {
        state.tableData = res
      })
}

const add = (index) => {
  request.get('/event/'+state.tableData[index].id).then(res => {
    let event = res

    if(event.participantid.length>0) {
      event.participantid += ","
      event.participantid += localStorage.getItem("userid")
    }else{
      event.participantid += localStorage.getItem("userid")
    }

    request.post('/event/update', event).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Join Success'
        })
        find()
      } else {
        ElNotification({
          type: 'error',
          message: res.msg
        })
      }
    })
  })
}
</script>

<style scoped>

</style>
