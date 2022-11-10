<template>

  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>
    <el-table-column prop="sex" label="gender"></el-table-column>
    <el-table-column prop="age" label="age"></el-table-column>
    <el-table-column prop="bio" label="bio"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button text @click="add(scope.$index)"
        >Add Mate</el-button
        >
      </template>
    </el-table-column>

  </el-table>
</template>

<script setup>
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";

request.get("/userrelation/may-like/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
})

const state = reactive({
  tableDate: []
})

const add = (index) => {
  request.get('/userrelation/relation/'+localStorage.getItem("userid")).then(res => {

    // add this person to your mate
    let userRelation = res
    if (userRelation.mateid == null) userRelation.mateid = ''

    if(userRelation.mateid.length>0) {
      userRelation.mateid += ","
      userRelation.mateid += state.tableData[index].id
    }else{
      userRelation.mateid += state.tableData[index].id
    }

    // remove this person from may like list
    let listofMayLike = userRelation.maylikeid.split(",")
    let newMayLikeId = ""


    for(var i =0;i<listofMayLike.length;i++){
      if(listofMayLike[i]!==String(state.tableData[index].id)){
        newMayLikeId += listofMayLike[i]
        newMayLikeId += ","
      }
    }

    if (newMayLikeId!=""){
      newMayLikeId = newMayLikeId.substring(0,newMayLikeId.length-1)
    }

    userRelation.maylikeid = newMayLikeId

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Add Successful'
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

    // add you to this person mate
    let userRelation = res
    if (userRelation.mateid == null) userRelation.mateid = ''

    if(userRelation.mateid.length>0) {
      userRelation.mateid += ","
      userRelation.mateid += localStorage.getItem("userid")
    }else{
      userRelation.mateid += localStorage.getItem("userid")
    }

    // remove you from this person's like list
    let listofLike = userRelation.likeid.split(",")
    let newLikeId = ""


    for(var i =0;i<listofLike.length;i++){
      if(listofLike[i]!==String(localStorage.getItem("userid"))){
        newLikeId += listofLike[i]
        newLikeId += ","
      }
    }

    if (newLikeId!=""){
      newLikeId = newLikeId.substring(0,newLikeId.length-1)
    }

    userRelation.likeid = newLikeId

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