<template>
  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>

  </el-table>
</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";

const state = reactive({
  tableData: []
})

request.get("/userrelation/mate/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
  console.log(state.tableData)
})

</script>

<style scoped>

</style>