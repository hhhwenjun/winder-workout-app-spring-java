<script setup>
import AppHeader from './components/AppHeader.vue';
import AppFooter from './components/AppFooter.vue';
import "./style.css";

</script>
<template>
  <div id="app" >
    <app-header></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css?family=Monda");

a,
a:visited,
a:hover,
a:active{
  color: white;
}

body {
  margin: 0 auto;
  max-width: 1300px;
}

</style>
