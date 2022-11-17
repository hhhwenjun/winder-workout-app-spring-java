<template>
  <div>
    <div style="width: 800px; margin: 20px auto;">
      <el-card :model="state.user" ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">Welcome Home, {{ state.user.username }}</h2>
        <div style="text-align: center; margin: auto">
          <el-avatar style="width: 200px; height: 200px; margin-bottom: 30px"
                     src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
          />
        </div>
        <el-card>
          <div prop="bio" style="text-align: center;">
            {{ state.user.bio }}
          </div>
        </el-card>
      </el-card>
    </div>
    <div style="width: 800px; margin: 20px auto;">
      <el-card ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">My Favorite Sport</h2>
        <div>
          <el-table :data="state.userTableData">
            <el-table-column prop="sportname" label="Sport Name"></el-table-column>
            <el-table-column prop="sportlevel" label="Level"></el-table-column>
            <el-table-column label="Operations">
              <template #default="scope">
                <el-button
                    size="small"
                    type="danger"
                    @click="deleteMate(scope.$index)"
                >Delete
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-card>
    </div>
    <div style="width: 800px; margin: 20px auto;">
      <el-card ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">Add Sport Preference</h2>
        <div>
          <el-select v-model="userNewSport.sportname" clearable placeholder="Select Sport" label="Sport">
            <el-option
                v-for="item in state.sport_options"
                :key="item.sportname"
                :label="item.sportname"
                :value="item.sportname"
            />
          </el-select>
          <el-select v-model="userNewSport.sportlevel" clearable placeholder="Select Level" label="Level"
                     style="margin-left: 50px">
            <el-option
                v-for="item in level_options"
                :key="item.value"
                :label="item.value"
                :value="item.value"
            />
          </el-select>
          <el-button
              size="small"
              type="danger"
              #default="scope"
              style="margin-left: 50px"
              @click="add"
          >Add
          </el-button>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup>
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

request.get('/experience/user-experience/' + "4").then(res => {
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
  sportid: "",
  sportname: "",
  sportlevel: "",
})

const add = () => {
  request.get('/sport/sportname/' + userNewSport.sportname).then(res => {
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