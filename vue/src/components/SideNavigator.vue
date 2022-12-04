<template>
  <el-scrollbar>
    <el-menu :default-openeds="['2', '3', '4']" router>
      <!--      <el-menu-item index="/" >-->
      <!--        <template #title>-->
      <!--          <el-icon><house /></el-icon>Home-->
      <!--        </template>-->
      <!--      </el-menu-item>-->
      <el-sub-menu index="2" v-if="link =='partner'">
        <template #title>
          <el-icon><message /></el-icon>Mate
        </template>
        <el-menu-item index="/findmate">Find Your Mate</el-menu-item>
        <el-menu-item index="/youlike">Your Like</el-menu-item>
        <el-menu-item index="/likeyou">Like You</el-menu-item>
        <el-menu-item index="/yourmate">Your mate</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="3" v-if="link =='event'">
        <template #title>
          <el-icon><icon-menu /></el-icon>Event
        </template>
        <el-menu-item index="/findevent">Find Event</el-menu-item>
        <el-menu-item index="/createevent">Create Event</el-menu-item>
        <el-sub-menu index="3-1">
          <template #title>Your event</template>
          <el-menu-item index="/youreventcreated">Created Event</el-menu-item>
          <el-menu-item index="/youreventjoined">Joined Event</el-menu-item>
        </el-sub-menu>
      </el-sub-menu>
      <el-sub-menu index="4" v-if="link =='account'">
        <template #title>
          <el-icon><setting /></el-icon>Account
        </template>
        <el-menu-item index="/mywinder">Profile</el-menu-item>
        <el-menu-item index="/setpassword">Set password</el-menu-item>
        <el-menu-item index="/profileedit">Edit Profile</el-menu-item>
      </el-sub-menu>
    </el-menu>
  </el-scrollbar>
</template>


<script setup>
import { Menu as IconMenu, Message, Setting, House } from '@element-plus/icons-vue'
import {reactive, ref} from "vue";
const link = ref(localStorage.getItem("link"))
</script>




<style>
.el-sub-menu{
  background-color: #c8dfff;
}
.el-menu-item{
  background-color: white;
}

</style>