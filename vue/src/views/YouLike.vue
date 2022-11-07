<template>

  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button text type="danger" @click="dislike(scope.$index)"
        >Dislike</el-button
        >
      </template>
    </el-table-column>

  </el-table>
</template>

<script setup>
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";

request.get("/userrelation/like/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
})

const state = reactive({
  tableDate: []
})

const dislike = (index) => {
  request.get('/userrelation/relation/'+localStorage.getItem("userid")).then(res => {
    let userRelation = res

    let listOfLike = userRelation.likeid.split(",")
    let newLikeId = ""


    for(var i =0;i<listOfLike.length;i++){
      if(listOfLike[i]!==String(state.tableData[index].id)){
        newLikeId += listOfLike[i]
        newLikeId += ","
      }
    }

    if (newLikeId!=""){
      newLikeId = newLikeId.substring(0,newLikeId.length-1)
    }

    userRelation.likeid = newLikeId

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Dislike Successful'
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
}
</script>

<style scoped>

</style>