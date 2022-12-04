<template>
  <div class="navigator-login">
    <div class="navigator">
      <p class="nav-link"  v-if="user == null">Home</p>
      <p class="nav-link"  v-if="user != null" @click="setLink('account')">My Winder</p>
      <p class="nav-link"  v-if="user != null" @click="setLink('partner')"> | Workout Partner</p>
      <p class="nav-link"  v-if="user != null" @click="setLink('event')"> | Group Activity</p>
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

      if (link=="account"){

        router.push("/login")
      }
      else if (link=="partner"){
        router.push("/findmate")
      }
      else if (link=="event"){
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
  font-size: 24px;
  font-family: Arial;
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
  text-decoration: underline 2px whitesmoke;
  cursor: pointer;
}

.login{
  margin-right: 20px;
}
</style>