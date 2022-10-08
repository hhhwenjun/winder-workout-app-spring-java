<template>
  <div class="toolbar">
    <el-dropdown>
      <el-icon style="margin-right: 8px; margin-top: 1px"
      ><setting
      /></el-icon>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item @click="to_profile">Profile</el-dropdown-item>
          <el-dropdown-item>button2</el-dropdown-item>
          <el-dropdown-item>button3</el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
    <span>{{ user_login }}</span>
    <el-button type="primary" style="width: 80px" @click="sign_out">Sign out</el-button>
  </div>
</template>

<script setup>

import {ref} from "vue";
import { Setting } from '@element-plus/icons-vue'
import router from "../router/index.js";

const user_login = ref(localStorage.getItem("username"))

const sign_out = () => {
  localStorage.clear()
  router.push("/login")
}

const to_profile = () => {
  router.push('/profileedit')
}

</script>

<style scoped>
.toolbar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  right: 20px;
}
</style>