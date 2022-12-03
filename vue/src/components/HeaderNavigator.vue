<template>
  <div class="navigator-login">
      <div class="navigator">
      <router-link class="nav-link" to="/" index = "/">Home</router-link> |
        <router-link class="nav-link" to="/mywinder" index = "/mywinder" @click="setLink('account')">My Winder</router-link> |
        <router-link class="nav-link" to="/findmate" index = "/findworkoutpartner" @click="setLink('partner')">Workout Partner</router-link> |
        <router-link class="nav-link" to="/findevent" index = "/findgroupactivity" @click="setLink('event')">Group Activity</router-link>
      </div>
    </div>
  <div class="login">
    <Header></Header>
  </div>
</template>

<script>
import Header from "./Header.vue";
export default {
  name: "HeaderNavigator",
  components: {Header},
  methods: {
    setLink(link) {
      localStorage.setItem('link', link)
      console.log(localStorage.getItem("link"))
      console.log(window.location.href)
      // window.location.reload()


    }
  }
}


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