<template>
  <section class="all-boxes">
    <section class="user-info-panel">
      <img :src="getImg(anime.imgScr)" :alt="anime.title" />
      <div class="user-info-panel-inf">
        <h2>
          {{ anime.title }}
        </h2>
        <p>
          {{ anime.age }}, {{ anime.gender }}
        </p>
        <p style="line-break: strict">
          {{ anime.bio }}
        </p>
      </div>
    </section>
    <section class="activity-info-panel">
<!--      <div class="activity-info-panel-act" v-for="item in getUserActivity(anime.id, userJson)" :key="item.id">-->
<!--        <div v-for="(value, index) in item" :key="index">-->
<!--          <p>{{index}}: {{value}}</p>-->
<!--        </div>-->
<!--      </div>-->
      <div class="activity-info-panel-but">
        <button @click="add(anime)" :disabled="likeDisable" :class=
            "{activeLike: !likeDisable, disableLike: likeDisable}">
          <font-awesome-icon icon="fa-brands fa-gratipay" size="7x"/>
        </button>
      </div>
    </section>
  </section>
</template>

<script setup>
import {defineProps, defineEmits, computed, ref} from 'vue'
import userJson from "./db.json";
import request from "../request.js";
import {ElNotification} from "element-plus";
const props = defineProps({
  anime: []
});

const getImg = (url) => {
  let filename = "../assets/userPhotos/" + url.toLowerCase();
  return new URL(filename, import.meta.url).href;
};

// const getUserActivity = (userID, userData) => {
//   let userActivity = [];
//   for(let i = 0; i < userData.length; i++){
//     if(userData[i]["userID"] === userID ){
//       userActivity.push(userData[i]["activities"]);
//       break;
//     }
//   }
//   return userActivity;
// }

let likeDisable = ref(0)
const add = (anime) => {
  request.get('/userrelation/relation/' + localStorage.getItem("userid")).then(res => {
    let userRelation = res
    if (userRelation.likeid == null) userRelation.likeid = ""

    if (userRelation.likeid.length > 0) {
      userRelation.likeid += ","
      userRelation.likeid += anime.id
    } else {
      userRelation.likeid += anime.id
    }

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Like Successful'
        })
        // match()
      } else {
        ElNotification({
          type: 'error',
          message: res.msg
        })
      }
    })
  })
  likeDisable.value = 1
}


</script>

<style scoped>
p {
  font-size: 20px;
}
.all-boxes {
  display: flex;
  flex-direction:row;
  justify-content: flex-start;
  align-items: flex-end;
  background-color: rgba(59, 130, 215, 0.99);
  border: 2px solid #e6e6e6;
  border-radius: 2rem;
  padding: 1rem 2rem;
  box-shadow: 0px 3px 6px rgb(0, 0, 0, 0.15);
  color: #EF5B5B;
  /*color: rgba(251, 206, 59, 1);*/
  margin-bottom: 20px;
  width: 450px;
  text-align: left;
}

.user-info-panel {
  position: relative;
  width: 250px;
  align-items: start;
  /*border: black 2px solid;*/
}

.user-info-panel img {
  width: 100px;
  height: 100px;
  padding: 4px;
  border-radius: 50%;
  border: whitesmoke 2px solid;

}

.user-info-panel-inf {
  min-height: 120px;
  max-width: 200px;
}

.activity-info-panel {
  position: relative;
  width: 200px;
  align-items: start;
  /*border: black 2px solid;*/
}

.activity-info-panel-act {
  min-height: 200px;
}

.activity-info-panel-but {
  height: 120px;
  bottom: 0px;
}

.activity-info-panel button {
  height: 100px;
  width: 100px;
  margin-top: 10px;
  margin-left: 85px;
  color: crimson;
  border-radius: 50%;
  text-align: center;
  border: none;
  /*background: #2c3e50;*/
}

.activity-info-panel button:hover {
  background: whitesmoke;
}

.activeLike {
  background: #07564d;
}

.disableLike {
  background: whitesmoke;
  /*background: rgba(251, 206, 59, 1);*/
}
</style>