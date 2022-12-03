<template>
  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button
                   size="small"
                   type="danger"
                   @click="deleteMate(scope.$index)"
        >Delete</el-button>
      </template>
    </el-table-column>

  </el-table>
</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";
import {ElNotification} from "element-plus";

const state = reactive({
  tableData: []
})

request.get("/userrelation/mate/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
})

const deleteMate = (index) => {
  request.get('/userrelation/relation/'+localStorage.getItem("userid")).then(res => {
    let userRelation = res

    let listofMate = userRelation.mateid.split(",")
    let newMateId = ""


    for(var i =0;i<listofMate.length;i++){
      if(listofMate[i]!==String(state.tableData[index].id)){
        newMateId += listofMate[i]
        newMateId += ","
      }
    }

    if (newMateId!=""){
      newMateId = newMateId.substring(0,newMateId.length-1)
    }

    userRelation.mateid = newMateId

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Delete Successful'
        })
        location.reload()
      } else {
        ElNotification({
          type: 'error',
          message: res.msg
        })
      }
    })
  })

  request.get('/userrelation/relation/'+state.tableData[index].id).then(res => {
    let userRelation = res

    let listofMate = userRelation.mateid.split(",")
    let newMateId = ""


    for(var i =0;i<listofMate.length;i++){
      if(listofMate[i]!==String(localStorage.getItem("userid"))){
        newMateId += listofMate[i]
        newMateId += ","
      }
    }

    if (newMateId!=""){
      newMateId = newMateId.substring(0,newMateId.length-1)
    }

    userRelation.mateid = newMateId

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        location.reload()
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