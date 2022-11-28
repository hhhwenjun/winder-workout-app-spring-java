<template>

  <setction class="all-boxes">
    <section class="group-info-panel">
      <div>
        <p>Activity: {{anime.title}}</p>
        <p>Time: {{formatDate(anime.date)}} {{anime.time}}</p>
        <p>Location: {{anime.location}}</p>
        <p>Group Size: {{ numOfParticipants(anime.participants) }}</p>
        <p>Description: {{anime.description}} </p>
      </div>
      <div class="sport-logo">
<!--        <font-awesome-icon icon="fa-solid fa-person-hiking" size="7x"/>-->
        <img src="../assets/userPhotos/WinderIcon.jpg" alt="Winder">
      </div>
    </section>
    <section class="other-info-panel">
      <div class="created-by">
        <h2>
          Created by:
          <br />
          <br />
          &nbsp;&nbsp;&nbsp;&nbsp;{{ anime.createdBy }}
        </h2>
      </div>
      <div class="other-info-panel-but">
        <button @click="add(anime)" :disabled="likeDisable" :class=
            "{activeLike: !likeDisable, disableLike: likeDisable}">
          <font-awesome-icon icon="fa-brands fa-gratipay" size="7x"/>
        </button>
      </div>
    </section>
  </setction>
</template>

<script setup>

import request from "../request.js";
import {ElNotification} from "element-plus";
import {defineProps, ref} from "vue";

const props = defineProps({
  anime: []
});

function formatDate(dateString) {
  const date = new Date(dateString);
  // Then specify how you want your dates to be formatted
  return new Intl.DateTimeFormat('default', {dateStyle: 'short'}).format(date);
}

function numOfParticipants(participants) {
  let par_string = participants.split(',')
  console.log(par_string)
  return par_string.length.toString()
}

let likeDisable = ref(0)
const add = (anime) => {
  request.get('/event/'+anime.id).then(res => {
    let event = res

    if(event.participantid.length>0) {
      event.participantid += ","
      event.participantid += localStorage.getItem("userid")
    }else{
      event.participantid += localStorage.getItem("userid")
    }

    request.post('/event/update', event).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Join Success'
        })
        // find()
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
  flex-direction:column;
  justify-content: flex-start;
  align-items: flex-start;
  background-color: #07564d;
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
.group-info-panel {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  position: relative;
  width: 450px;
  min-height: 100px;
  align-items: start;
  /*border: 2px solid red;*/
}

.sport-logo {
  color: black;
  background-color: whitesmoke;
  border-radius: 30px;
  margin-top: 15px;
  /*outline: 2px solid black;*/
}
.other-info-panel {
  display: flex;
  flex-direction: row;
  position: relative;
  width: 450px;
  min-height: 100px;
  align-items: start;
  /*border: 2px solid black;*/
}

.created-by{
  width: 250px;
}
.other-info-panel-but {
  width: 200px;
  bottom: 0px;
  /*border: 2px solid black;*/
}
.other-info-panel button {
  height: 100px;
  width: 100px;
  margin-top: 10px;
  margin-left: 85px;
  color: crimson;
  border-radius: 50%;
  text-align: center;
  border: none;
  /*background: #07564d;*/
}

.other-info-panel button:hover {
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