<template>
  <div class = 'profile'>


<!--  pfp-->
  <div class = "card">
    <h2 class = "title">Profile Photo</h2>
    <div class = "contents pfp">
      <div class = "image">
        <img src = ""/>
      </div>
    </div>
  </div>
<!--pi-->
  <div class = "card">
    <h2 class = "title">Personal Information</h2>
    <div class = "contents pi">
      <div class = "sub age">
        <div class = "subtitle">Age</div>
        <div class = "field">
<!--          add field-->
        </div>
      </div>
      <div class = "sub gen">
        <div class = "subtitle">Gender</div>
        <div class = "field">
<!--add field-->
        </div>
      </div>
      <div class = "sub name">
        <div class = "subtitle">Name</div>
        <div class = "field">
<!--          add field-->
        </div>
      </div>
    </div>
  </div>
<!--bio-->
  <div class = "card">
    <h2 class = "title">Bio</h2>
    <div class = "contents bio">
      <div class = "bio-text">
<!--        enter text box-->
      </div>
    </div>
  </div>
<!--activities-->
  <div class = "card">
    <h2 class = "title"> Activities </h2>
    <div class = "contents activities">
<!--      <ActivityCard v-for = "row in state.userTableData" v-bind:sportname="row.sportname" v-bind:sportlevel = "row.sportlevel"></ActivityCard>-->
<!--      <h3 class = "add-title"> Add New Activity</h3>-->
      <ActivityCardEdit></ActivityCardEdit>
    </div>
  </div>
  </div>
</template>

<script>
import ActivityCardEdit from "../components/ActivityCardEdit.vue"
// import ActivityCard from "../components/ActivityCard.vue";
export default {
  name: "Profile",
  components: {ActivityCardEdit}
}
//
// import {ref, reactive, getCurrentInstance} from 'vue'
// import {User, Lock} from '@element-plus/icons-vue'
// import {ElNotification } from "element-plus";
// import request from "../request";
// import router from "../router";
//
// const { proxy } = getCurrentInstance()
//
// let state = reactive({
//   user:{}
// })
//
// request.get('/user/userid/'+localStorage.getItem("userid")).then(res => {
//   state.user = reactive(res)
// })
//
// const rules = reactive({
//   username: [
//     { required: true, message: 'Please enter username', trigger: 'blur' }
//   ],
//   password: [
//     { required: true, message: 'Please enter password', trigger: 'blur' }
//   ],
// })
//
// const profileedit = () => {
//   proxy.$refs.ruleFormRef.validate((valid) => {
//     if(valid) {
//       request.post('/user/update', state.user).then(res => {
//         if (res.code === '200') {
//           ElNotification({
//             type: 'success',
//             message: 'Edit Success'
//           })
//           localStorage.setItem('username', state.user.username)
//           location. reload()
//         } else {
//           ElNotification({
//             type: 'error',
//             message: res.msg
//           })
//         }
//       })
//     } else {
//       ElNotification({
//         type: 'error',
//         message: 'Errors'
//       })
//     }
//   })
// }
//
// import {reactive, ref} from 'vue'
// import {ElNotification} from "element-plus";
// import request from "../request";
// import router from "../router/index.js";
//
// const level_options = [
//   {
//     value: 'Beginner',
//   },
//   {
//     value: 'Intermediate',
//   },
//   {
//     value: 'Expert',
//   },
// ]
//
// let state = reactive({
//   user: {},
//   userTableData: [],
//   userAddTableData: [],
//   sport_options: []
// })
//
// request.get('/user/userid/' + localStorage.getItem("userid")).then(res => {
//   state.user = reactive(res)
// })
//
// request.get('/experience/new-sport/' + localStorage.getItem("userid")).then(res => {
//   state.sport_options = res
// })
//
// request.get('/experience/user-experience/' + localStorage.getItem("userid")).then(res => {
//   state.userTableData = res
// })
//
// const deleteMate = (index) => {
//   request.delete('/experience/delete-experience/' + localStorage.getItem("userid") + '/'
//       + state.userTableData[index].sportid).then(res => {
//     if (res.code === '200') {
//       ElNotification({
//         type: 'success',
//         message: 'Delete Success'
//       })
//       location.reload()
//     } else {
//       ElNotification({
//         type: 'error',
//         message: res.msg
//       })
//     }
//   })
// }
//
// const userNewSport = reactive({
//   userid: localStorage.getItem("userid"),
//   sportid:"",
//   sportname: "",
//   sportlevel: "",
// })
//
// const add = () => {
//   request.get('/sport/sportname/'+userNewSport.sportname).then(res => {
//     userNewSport.sportid = res.id
//     console.log(userNewSport)
//     request.post('/experience/create', userNewSport).then(res => {
//       if (res.code === '200') {
//         ElNotification({
//           type: 'success',
//           message: 'Create Success'
//         })
//         location.reload()
//       } else {
//         ElNotification({
//           type: 'error',
//           message: res.msg
//         })
//       }
//     })
//   })
// }


</script>

<style scoped>

/*------------------------pfp css---------------------*/
.image {
  width: 200px;
  height: 200px;
  border-radius: 100px;
}
.image > img{
  width:100%;
  height:100%;
}
.pfp {
  display: flex;
  justify-content: center;
}
/*-------------------personal information css----------------------*/
.pi {
  width: 90%;
  display: flex;
  justify-content: center;
  flex-flow: column;
}
.sub{
  display: grid;
}
.subtitle{
  grid-column: 1;
}
.field{
  grid-column: 2;
}
/*--------------------bio css------------------*/
.bio-text{
  width: 90%;
  height: 300px;
}
.profile{
  color: black;
}
</style>