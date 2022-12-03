<template>
<div>
  <h3 class = "activity-title"></h3>
  <div class = "act-dropdown">
    <select v-model="userNewSport.sportname" clearable placeholder = "Select Sport" label = "Sport">
      <option
          v-for="item in state.sport_options"
          :key="item.sportname"
          :value="item.sportname"
          :label="item.sportname"
      />
    </select>
  </div>
  <h3 class = "activity-level"></h3>
  <div class = "act-radio">
    <select v-model="userNewSport.sportlevel" clearable placeholder = "Select Experience Level" label = "Level">
      <option
          v-for="item in level_options"
          :key="item.value"
          :value="item.value"
          :label="item.value"
      />
    </select>
  </div>
  <div class = "act-add" @click = "add"> Add</div>

</div>
</template>

<script setup>
// export default {
//   name: "ActivityCardEdit"
// }

import {reactive, ref} from 'vue'
import {ElNotification} from "element-plus";
import request from "../request";
import router from "../router/index.js";

const level_options = [
  {
    value: 'Beginner',
  },
  {
    value: 'Intermediate',
  },
  {
    value: 'Expert',
  },
]

let state = reactive({
  user: {},
  userTableData: [],
  userAddTableData: [],
  sport_options: []
})

request.get('/user/userid/' + localStorage.getItem("userid")).then(res => {
  state.user = reactive(res)
})

request.get('/experience/new-sport/' + localStorage.getItem("userid")).then(res => {
  state.sport_options = res
})

request.get('/experience/user-experience/' + localStorage.getItem("userid")).then(res => {
  state.userTableData = res
})

const deleteMate = (index) => {
  request.delete('/experience/delete-experience/' + localStorage.getItem("userid") + '/'
      + state.userTableData[index].sportid).then(res => {
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

const userNewSport = reactive({
  userid: localStorage.getItem("userid"),
  sportid:"",
  sportname: "",
  sportlevel: "",
})

const add = () => {
  request.get('/sport/sportname/'+userNewSport.sportname).then(res => {
    userNewSport.sportid = res.id
    console.log(userNewSport)
    request.post('/experience/create', userNewSport).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Create Success'
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