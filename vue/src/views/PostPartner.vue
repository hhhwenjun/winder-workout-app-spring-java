<template>
  <section class="all-boxes">
    <section class="user-info-panel">
      <img :src="getImg(anime.imgScr)" :alt="anime.title" />
      <div class="user-info-panel-inf">
        <h2>
          {{ anime.title }}
        </h2>
        <p>
          {{ anime.age }}, {{ anime.description }}
        </p>
        <p>
          {{ anime.address }}
        </p>
      </div>

    </section>
    <section class="activity-info-panel">
      <div class="activity-info-panel-act" v-for="item in getUserActivity(anime.id, userData)" :key="item.id">
        <div v-for="(value, index) in item" :key="index">
          <p>{{index}}: {{value}}</p>
        </div>
      </div>
      <div class="activity-info-panel-but">
        <button><font-awesome-icon icon="fa-brands fa-gratipay" size="7x"/></button>
      </div>
    </section>

  </section>
</template>

<script>
import userJson from "./db.json";
export default {
  props: ["anime"],
  name: "PostPartner",
  data() {
    return {
      userData: userJson.users
    }
  },
  methods: {
    getImg(url) {
      let filename = "../assets/userPhotos/" + url.toLowerCase();
      return new URL(filename, import.meta.url).href;
    },
    getUserActivity(userID, userData){
      let userActivity = [];
      for(let i = 0; i < userData.length; i++){
        if(userData[i]["userID"] === userID ){
          userActivity.push(userData[i]["activities"]);
          break;
        }
      }
      return userActivity;
    }
  }
}
// const imgUrl = new URL('./img.png', import.meta.url).href
// const user_activities = {
//   user_title: "user1",
//   user_activities: {Tennis: Beginner, Soccer: Intermediate},
// }

</script>

<style scoped>
p {
  font-size: 22px;
}
.all-boxes {
  display: flex;
  flex-direction:row;
  justify-content: flex-start;
  align-items: flex-end;
  background-color: #2c3e50;
  border: 2px solid #e6e6e6;
  border-radius: 2rem;
  padding: 1rem 2rem;
  box-shadow: 0px 3px 6px rgb(0, 0, 0, 0.15);
  color: #EF5B5B;
  /*color: rgba(251, 206, 59, 1);*/
  margin-bottom: 20px;
  width: 500px;
  text-align: left;
}

.user-info-panel {
  position: relative;
  width: 250px;
  align-items: start;
}

.user-info-panel img {
  width: 200px;
  height: 200px;
  padding: 4px;
  border-radius: 50%;
  border: whitesmoke 2px solid;

}

.user-info-panel-inf {
  min-height: 120px;
}

.activity-info-panel {
  position: relative;
  width: 250px;
  align-items: start;
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
  background: #2c3e50;
}

.activity-info-panel button:hover {
  background: whitesmoke;
}
</style>