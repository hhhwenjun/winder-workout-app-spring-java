<template>
  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="name" label="name"></el-table-column>

    <el-table-column label="Operations">
        <el-button size="small" @click="handleEdit(scope.$index, scope.row)"
        >Edit</el-button
        >
        <el-button
            size="small"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
        >Delete</el-button
        >
    </el-table-column>
  </el-table>
</template>

<script setup>
import {reactive} from "vue";
import request from "../request.js";

const state = reactive({
  tableData: []
})

request.get("/event/participate/"+localStorage.getItem("userid")).then( res => {
  state.tableData = res
  console.log(state.tableData)
})
</script>

<style scoped>

</style>