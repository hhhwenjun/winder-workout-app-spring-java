<template>
  <div class="home-page">
    <section class="container">
      <h1> Make Friends, Get Fit.</h1>
      <p>Let Winder help you find workout partners and group activities. </p>
      <router-link
          :to="'/login'">
        <button class="el-button el-button--primary join-us">Join Us!</button>
      </router-link>
    </section>
 </div>
</template>

<script></script>

<style scoped>
.home-page {
  display: flex;
  flex-direction: column;
  background-color: rgba(235, 235, 235, 1);
  background-image: url("../assets/images/Image_BG.png");
  background-position: bottom;
  background-repeat: no-repeat;
  min-height: 650px;
}
.container {
  display: inline-block;
  align-items: center;
  text-align: center;
  /*border: solid 3px #1a1a1a;*/
}
h1{
  display: block;
  padding: 0.25rem;
  font-family: Monda;
  font-size: 54px;
  font-weight: bolder;
  margin-top: 15px;
  /*border: solid 3px #1a1a1a ;*/
}
p{
  display: block;
  padding: 0.25rem;
  font-family: Monda;
  font-size: 30px;
  font-style: italic;
  margin-top: -40px;
  /*border: solid 3px #1a1a1a;*/
}

button {
  background-color: #409eff;
  width: 350px;
  height: 70px;
  border: 0;
  margin-top: 45px;
  cursor: pointer;
  box-shadow: 0px 2px 2px 0px #409eff;
}
/*.button:hover {*/

/*  outline: white solid 3px;*/
/*}*/
.join-us {
  display: inline-block;
  /*width: 350px;*/
  /*height: 70px;*/
  /*background: #ff552f;*/
  color: #F5F5F5;
  font-family: Monda;
  font-size: 48px;
  font-weight: bolder;
  vertical-align: center;
}
</style>