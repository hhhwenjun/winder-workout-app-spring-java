<template>
  <el-table :data="state.tableData">
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>
  </el-table>

  <el-button type="primary" style="width: 100%" @click="sign_out">Sign out</el-button>

</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";
import router from "../router/index.js";

const state = reactive({
  tableData: []
})

request.get("/user").then( res => {
  state.tableData = res
})

const sign_out = () => {
  localStorage.clear()
  router.push("/")
}
</script>
