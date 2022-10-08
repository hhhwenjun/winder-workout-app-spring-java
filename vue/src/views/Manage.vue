<template>
  <el-container class="layout-container-demo" style="height: 1000px">
    <el-aside width="200px">
      <SideNavigator></SideNavigator>
    </el-aside>

    <el-container>
      <el-header style="text-align: right; font-size: 12px">
        <Header></Header>
      </el-header>

      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>

</template>



<script setup>
import {reactive, ref} from "vue";
import request from "../request.js";
import router from "../router/index.js";
import SideNavigator from "../components/SideNavigator.vue";
import Header from "../components/Header.vue";

const state = reactive({
  tableData: []
})

if(localStorage.getItem("username")==null){
  router.push('/login')
}
</script>
