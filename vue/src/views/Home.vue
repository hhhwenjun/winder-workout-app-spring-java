<template>
  <el-table :data="state.tableData">
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

request.get("/user").then( res => {
  state.tableData = res
})
</script>
