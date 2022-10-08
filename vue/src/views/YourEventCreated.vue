<template>
  <el-table :data="state.tableData">
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="name" label="name"></el-table-column>
  </el-table>

</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";

const state = reactive({
  tableData: []
})

request.get("/event/creater/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
})
</script>

<style scoped>

</style>