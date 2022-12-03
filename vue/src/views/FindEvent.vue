<template>
  <div style="margin-bottom: 20px">
    <el-date-picker style="width: 200px; margin: 10px"
        v-model="date_from"
        type="date"
        placeholder="Date from"
    />
    <el-date-picker style="width: 200px; margin: 10px"
        v-model="date_to"
        type="date"
        placeholder="Date to"
    />
    <el-time-select style="width: 200px; margin: 10px"
        v-model="time_from"
        start="06:00"
        step="00:30"
        end="21:00"
        placeholder="Time from"
    />
    <el-time-select style="width: 200px; margin: 10px"
        v-model="time_to"
        start="06:00"
        step="00:30"
        end="21:00"
        placeholder="Time to"
    />
    <el-select style="width: 200px; margin: 10px" v-model="sportid" placeholder="Sport" clearable label="Sport">
      <el-option v-for="item in state.sport_options" :label="item.sportname" :value="item.id"/>
    </el-select>
    <el-select style="width: 200px; margin: 10px" v-model="capacity_from" placeholder="Min Capacity" clearable label="Min Capacity">
      <el-option v-for="item in capacity_options" :label="item" :value="item"/>
    </el-select>
    <el-select style="width: 200px; margin: 10px" v-model="capacity_to" placeholder="Max Capacity" clearable label="Max Capacity">
      <el-option v-for="item in capacity_options" :label="item" :value="item"/>
    </el-select>
    <el-button style="margin: 10px; width: 200px; float: right" type="primary" @click="find"  round :disabled="buttonEnable"><el-icon style="margin-right: 3px"><Search /></el-icon> Find</el-button>
  </div>

<!--  <el-table :data="state.tableData" stripe>-->
<!--    <el-table-column prop="id" label="id"></el-table-column>-->
<!--    <el-table-column prop="name" label="name"></el-table-column>-->
<!--    <el-table-column prop="date" label="date" :formatter="formatDate"></el-table-column>-->
<!--    <el-table-column prop="time" label="time"></el-table-column>-->

<!--    <el-table-column label="Operations">-->
<!--      <template #default="scope">-->
<!--        <el-button text @click="add(scope.$index)"-->
<!--        >Add</el-button-->
<!--        >-->
<!--      </template>-->
<!--    </el-table-column>-->
<!--  </el-table>-->
  <div class="main-user-info">
    <PostGroup v-for="(anime, i) in state.anime_list" :key="i" :anime="anime"/>
  </div>
</template>


<script setup>
import { Search } from '@element-plus/icons-vue'
import {computed, reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";
import PostGroup from "./PostGroup.vue";

const sportid = ref(localStorage.getItem('findevent_sportid')?parseInt(localStorage.getItem('findevent_sportid')):"")
const date_from = ref(localStorage.getItem('findevent_sportid')?localStorage.getItem('findevent_sportid'):"")
const date_to = ref(localStorage.getItem('findevent_date_to')?localStorage.getItem('findevent_date_to'):"")
const time_from = ref(localStorage.getItem('findevent_time_from')?localStorage.getItem('findevent_time_from'):"")
const time_to = ref(localStorage.getItem('findevent_time_to')?localStorage.getItem('findevent_time_to'):"")
const capacity_from = ref(localStorage.getItem('findevent_capacity_from')?localStorage.getItem('findevent_capacity_from'):"")
const capacity_to = ref(localStorage.getItem('findevent_capacity_to')?localStorage.getItem('findevent_capacity_to'):"")
const capacity_options = [2, 3, 5, 10, 20, 30, 50, 70, 100, 200, 500]

request.get('/sport').then(res => {
  state.sport_options = res
})

const formatDate = (row, column)  =>  {
  let data = row[column.property]
  if(data == null) {
    return null
  }
  let dt = new Date(data)
  return dt.getFullYear() + '-' + (dt.getMonth() + 1) + '-' + dt.getDate()
}

const buttonEnable = computed(() =>{
  if(sportid.value===""&&date_from.value===""&&date_to.value===""&&time_from.value===""&&time_to.value===""){
    return 1
  }
  else {
    return 0
  }
})

const state = reactive({
  tableDate: [],
  anime_list:[]
})



const find = () => {
  localStorage.setItem('findevent_sportid', sportid.value)
  localStorage.setItem('findevent_date_from', date_from.value)
  localStorage.setItem('findevent_date_to', date_to.value)
  localStorage.setItem('findevent_time_from', time_from.value)
  localStorage.setItem('findevent_time_to', time_to.value)
  localStorage.setItem('findevent_capacity_from', capacity_from.value)
  localStorage.setItem('findevent_capacity_to', capacity_to.value)
  request.get("/event/find", {
    params: {
      userid: localStorage.getItem('userid'),
      sportid: sportid.value,
      date_from: date_from.value,
      date_to: date_to.value,
      time_from: time_from.value,
      time_to: time_to.value,
      capacity_from: capacity_from.value,
      capacity_to: capacity_to.value
    }
  })
      .then(res => {
        state.tableData = res
        if (state.tableData) {
          for(let i = 0; i < state.tableData.length; i++) {
            request.get('/user/userid/' + state.tableData[i].createrid).then(res => {
              state.anime_list.push({
                title: state.tableData[i].name,
                date: state.tableData[i].date,
                time: state.tableData[i].time,
                location: state.tableData[i].location,
                participants: state.tableData[i].participantid,
                sport: state.tableData[i].sportid,
                id: state.tableData[i].id,
                description: state.tableData[i].description,
                createdBy: res.username
              })
            })
          }
        }
      })
}


// const add = (index) => {
//   request.get('/event/'+state.tableData[index].id).then(res => {
//     let event = res
//
//     if(event.participantid.length>0) {
//       event.participantid += ","
//       event.participantid += localStorage.getItem("userid")
//     }else{
//       event.participantid += localStorage.getItem("userid")
//     }
//
//     request.post('/event/update', event).then(res => {
//       if (res.code === '200') {
//         ElNotification({
//           type: 'success',
//           message: 'Join Success'
//         })
//         find()
//       } else {
//         ElNotification({
//           type: 'error',
//           message: res.msg
//         })
//       }
//     })
//   })
// }
</script>

<style scoped>
.main-user-info {
  background-color: rgb(217, 236, 255);
  width: 515px;
  margin: 2rem auto;
  border-radius: 2rem;
}
</style>
