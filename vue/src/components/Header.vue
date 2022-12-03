<template>
  <div class="toolbar">
    <span style="margin-right: 8px; margin-top: 1px" v-if="user != null">{{ user_login }}</span>
    <el-button type="primary" style="width: 80px" @click="sign_out" v-if="user != null">Sign out</el-button>
  </div>
</template>

<script setup>

import {ref} from "vue";

const user_login = ref(localStorage.getItem("username"))

const sign_out = () => {
  localStorage.clear()
  location.reload()
}

const user = ref(localStorage.getItem("userid"))

</script>

<style scoped>
.toolbar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.el-icon{
  color: white;
}


</style>