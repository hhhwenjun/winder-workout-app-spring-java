<template>
  <div class="navigator-login">
    <div class="navigator">
      <router-link class="nav-link" to="/" index = "/" v-if="user == null">Home</router-link>
      <router-link class="nav-link" to="/mywinder" index = "/mywinder" v-if="user != null" @click="setLink('account')">My Winder</router-link>
      <router-link class="nav-link" to="/findmate" index = "/findworkoutpartner" v-if="user != null" @click="setLink('partner')"> | Workout Partner</router-link>
      <router-link class="nav-link" to="/findevent" index = "/findgroupactivity" v-if="user != null" @click="setLink('event')"> | Group Activity</router-link>
    </div>
  </div>
  <div class="login">
    <Header></Header>
  </div>
</template>

<script>
import Header from "./Header.vue";
import router from "../router/index.js";

export default {
  name: "HeaderNavigator",
  components: {Header},
  methods: {
    setLink(link) {
      localStorage.setItem('link', link)
      if (localStorage.getItem('link')=="account"){
        router.push("/login")
      }
      else if (localStorage.getItem('link')=="partner"){
        router.push("/findmate")
      }
      else if (localStorage.getItem('link')=="event"){
        router.push("/findevent")
      }
    }
  }
}

</script>

<script setup>
import {reactive, ref} from "vue";
const user = ref(localStorage.getItem("userid"))
</script>


<style scoped>
.navigator-login {
  font-size: 28px;
  font-weight: bold;
  font-family: Monda;
}

.navigator{
  display: inline-flex;
  justify-content: center;
  text-align: center;
  gap: 10px;
}
.nav-link {
  text-decoration: none;
}
.nav-link:hover {
  text-decoration: underline 2px black;
}

.login{
  margin-right: 20px;
}
</style>