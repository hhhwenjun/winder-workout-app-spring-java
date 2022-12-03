<template>
  <el-scrollbar>
    <el-menu :default-openeds="['2', '3', '4']" router>
<!--      <el-menu-item index="/" >-->
<!--        <template #title>-->
<!--          <el-icon><house /></el-icon>Home-->
<!--        </template>-->
<!--      </el-menu-item>-->
      <el-sub-menu index="2" v-if="this.link =='partner'">
        <template #title>
          <el-icon><message /></el-icon>Mate
        </template>
          <el-menu-item index="/findmate">Find Your Mate</el-menu-item>
          <el-menu-item index="/youlike">Your Like</el-menu-item>
          <el-menu-item index="/likeyou">Like You</el-menu-item>
          <el-menu-item index="/yourmate">Your mate</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="3" v-if="this.link =='event'">
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
      <el-sub-menu index="4" v-if="this.link =='account'">
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
</script>

<script>
export default {
  name: "SideNavigator",
  data() {
    return {
      link: localStorage.getItem('link')
    }
  },
  watch: {
    // menu(){ return localStorage.getItem('link')}
    $route(to,from){
      console.log('watch')
      if(window.location.href.endsWith('/mywinder')){
        this.link = 'account'
      }
      else if(window.location.href.endsWith('/findevent')){
        this.link = 'event'
      }
      else if(window.location.href.endsWith('/findmate')){
        this.link = 'partner'
      }
    }
  },
  computed: {
    // menuShow(link){
    //   console.log("fuck")
    //   return link == localStorage.getItem("link")
    // }
    // menu(){
    //   // if(window.location.href.endsWith('/mywinder')){
    //   //   return 'account'
    //   // }
    //   // else if(window.location.href.endsWith('/findevent')){
    //   //   return'event'
    //   // }
    //   // else if(window.location.href.endsWith('/findmate')){
    //   //   return 'partner'
    //   return this.link
    //   // }
    // },
  },
  methods: {

    // menuShow(link) {
    //   if(link === localStorage.getItem("link") ){
    //     return true;
    //   }
    //   return false;
    // }
  }
}

</script>


<style>
.el-sub-menu{
  background-color: #c8dfff;
}
.el-menu-item{
  background-color: white;
}

</style>