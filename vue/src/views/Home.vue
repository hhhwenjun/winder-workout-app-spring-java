<template>
  <div>
    <div style="width: 600px; margin: 20px auto;">
      <el-card :model="state.user" ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">Welcome Home, {{state.user.username}}</h2>
        <div style="text-align: center; margin: auto">
          <el-avatar style="width: 200px; height: 200px; margin-bottom: 30px"
              src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
          />
        </div>
        <el-card>
          <div prop="bio" style="text-align: center;">
            {{state.user.bio}}
          </div>
        </el-card>
      </el-card>
    </div>
    <div style="width: 600px; margin: 20px auto;">
      <el-card ref="ruleFormRef" size="large">
        <h2 style="text-align: center; margin-bottom: 30px">My Favorite Sport</h2>
        <div>
          <el-table :data="state.tableData" stripe>
            <el-table-column prop="sportname" label="sportname"></el-table-column>
          </el-table>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup>
import {reactive} from 'vue'
import {ElNotification } from "element-plus";
import request from "../request";

let state = reactive({
  user:{},
  tableData: []
})

request.get('/user/userid/'+localStorage.getItem("userid")).then(res => {
  state.user = reactive(res)
})

request.get('user/sport/'+localStorage.getItem("userid")).then(res => {
  state.tableData = res
})

</script>

<style scoped>

</style>