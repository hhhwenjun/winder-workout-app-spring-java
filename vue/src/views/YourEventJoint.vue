<template>
  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="name" label="name"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button v-if="state.tableData[scope.$index].createrid != state.userid"
            size="small"
            type="danger"
            @click="quit(scope.$index)"
        >Quit</el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";
import {ElNotification} from "element-plus";

const state = reactive({
  tableData: [],
  userid : localStorage.getItem("userid"),
  event:{
    name:"",
    createrid:"",
    time:"",
    location:"",
    description:"",
    participantid:"",}
})

request.get("/event/participate/"+state.userid).then( res => {
  state.tableData = res
})

const quit = (index) => {
  request.get('/event/'+state.tableData[index].id).then(res => {
    state.event = reactive(res)

    let listofParticipantId = state.event.participantid.split(",")
    let newParticipantId = ""

    for(var i =0;i<listofParticipantId.length;i++){
      if(listofParticipantId[i]!==state.userid){
        newParticipantId += listofParticipantId[i]
        newParticipantId += ","
      }
    }

    if (newParticipantId!=""){
      newParticipantId = newParticipantId.substring(0,newParticipantId.length-1)
    }

    state.event.participantid = newParticipantId

    request.post('/event/update', state.event).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Quit Success'
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