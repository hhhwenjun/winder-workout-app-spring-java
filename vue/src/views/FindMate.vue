<template>
  <div style="margin-bottom: 20px">
    <el-select style="width: 200px; margin: 10px" v-model="sex" placeholder="Gender" clearable label="Gender">
      <el-option v-for="item in state.gender_options" :label="item.label" :value="item.value"/>
    </el-select>
    <el-input style="width: 200px; margin: 10px" v-model="ageLower" placeholder="Age from" clearable></el-input>
    <el-input style="width: 200px; margin: 10px" v-model="ageUpper" placeholder="Age to" clearable></el-input>
    <el-select style="width: 200px; margin: 10px" v-model="sport" placeholder="Sport" clearable label="Sport">
      <el-option v-for="item in state.sport_options" :label="item.sportname" :value="item.id"/>
    </el-select>
    <el-select style="width: 200px; margin: 10px" v-model="experience" clearable placeholder="Experience Level"
               label="Experience">
      <el-option v-for="item in state.level_options" :label="item" :value="item"/>
    </el-select>
    <el-button style="margin: 10px; width: 200px; float: right" type="primary" @click="match" round :disabled="buttonEnable">
      <el-icon style="margin-right: 3px">
        <Search/>
      </el-icon>
      Match
    </el-button>
  </div>
<!--  <el-table :data="state.tableData" stripe>-->
<!--&lt;!&ndash;    <el-table-column prop="id" label="id"></el-table-column>&ndash;&gt;-->
<!--    <el-table-column prop="username" label="username"></el-table-column>-->
<!--    <el-table-column prop="sex" label="gender"></el-table-column>-->
<!--    <el-table-column prop="age" label="age"></el-table-column>-->
<!--    <el-table-column prop="bio" label="bio"></el-table-column>-->

<!--    <el-table-column label="Operations">-->
<!--      <template #default="scope">-->
<!--        <el-button text @click="add(scope.$index)"-->
<!--        >Like-->
<!--        </el-button-->
<!--        >-->
<!--      </template>-->
<!--    </el-table-column>-->
<!--  </el-table>-->
  <div class="main-user-info">
    <PostPartner v-for="(anime, i) in anime_list" :key="i" :anime="anime"/>
  </div>
</template>

<script setup>
import {Search} from '@element-plus/icons-vue'
import {computed, reactive, ref, watch, onMounted, onBeforeMount, onUnmounted} from "vue";
import request from '../request';
import {ElNotification} from "element-plus";
import PostPartner from './PostPartner.vue';

// set up the criteria for search
const sex = ref(localStorage.getItem('findmate_sex')?localStorage.getItem('findmate_sex'):"")
const ageLower = ref(localStorage.getItem('findmate_ageLower')?localStorage.getItem('findmate_ageLower'):"")
const ageUpper = ref(localStorage.getItem('findmate_ageUpper')?localStorage.getItem('findmate_ageUpper'):"")
const sport = ref(localStorage.getItem('findmate_sport')?parseInt(localStorage.getItem('findmate_sport')):"")
const experience = ref(localStorage.getItem('findmate_experience')?localStorage.getItem('findmate_experience'):"")

const state = reactive({
  tableDate: [],
  gender_options: [{value: 'female', label: 'Female'}, {value: 'male', label: 'Male'}],
  level_options: ["Beginner", "Intermediate", "Expert"],
  sport_options: []
})

// Get the required sport data to show as the options
request.get('/sport').then(res => {
  state.sport_options = res
})

const buttonEnable = computed(() =>{
  if(sex.value!=""||ageLower.value!=""||ageUpper.value!=""||sport.value!=""){
    return 0
  }
  else {
    return 1
  }
})

const anime_list = computed(() =>{
  let anime_imgSrc = [
    "user1.jpg",
    "user2.jpg",
    "user3.jpg",
    "user4.jpg",
    "user5.jpg",
    "user6.jpg",
    "user7.jpg",
    "WinderIcon.jpg",
  ];
  const anime = [];
  if (state.tableData) {
    let i = 0;
    for(let obj in state.tableData) {
      let img_i = Math.floor(Math.random() * i);
      anime.push({
        imgScr: anime_imgSrc[img_i],
        title: state.tableData[i].username,
        age: state.tableData[i].age,
        gender: state.tableData[i].sex,
        bio: state.tableData[i].bio,
        sport: state.tableData[i].sportid,
        id: state.tableData[i].id
      })
      i++
    }
  }
  return anime;
})

const match = () => {
  localStorage.setItem('findmate_sex', sex.value)
  localStorage.setItem('findmate_ageLower', ageLower.value)
  localStorage.setItem('findmate_ageUpper', ageUpper.value)
  localStorage.setItem('findmate_sport', sport.value)
  localStorage.setItem('findmate_experience', experience.value)
  request.get("/user/match", {
    params: {
      userId: localStorage.getItem('userid'),
      sex: sex.value,
      ageLower: ageLower.value,
      ageUpper: ageUpper.value,
      sport: sport.value,
      experience: experience.value
    }
  })
      .then(res => {
        state.tableData = res
      })
}

// const add = (index) => {
//   request.get('/userrelation/relation/' + localStorage.getItem("userid")).then(res => {
//     let userRelation = res
//     console.log(index)
//     if (userRelation.likeid == null) userRelation.likeid = ""
//
//     if (userRelation.likeid.length > 0) {
//       userRelation.likeid += ","
//       // userRelation.likeid += state.tableData[index].id
//       userRelation.likeid += index
//     } else {
//       // userRelation.likeid += state.tableData[index].id
//       userRelation.likeid += index
//     }
//
//     request.post('/userrelation/update', userRelation).then(res => {
//       if (res.code === '200') {
//         ElNotification({
//           type: 'success',
//           message: 'Like Successful'
//         })
//         match()
//       } else {
//         ElNotification({
//           type: 'error',
//           message: res.msg
//         })
//       }
//     })
//   })
// }


// const handleScroll = () => {
//   if (
//       window.scrollY + window.innerHeight >=
//       document.body.scrollHeight - 50
//   ) {
//     const new_anime = this.getAnime();
//     this.anime_list = [...this.anime_list, ...new_anime];
//   }
// }
//
// onMounted(()=>{
//
//   // window.addEventListener("scroll", this.handleScroll);
// })
</script>


<style scoped>
.main-user-info {
  background-color: rgb(217, 236, 255);
  width: 515px;
  margin: 2rem auto;
  border-radius: 2rem;
}
</style>