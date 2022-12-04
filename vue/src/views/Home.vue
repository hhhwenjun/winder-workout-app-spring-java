<template>
  <div class="home-page">
    <section class="container">
      <h1> Make Friends, Get Fit.</h1>
      <router-link
          :to="'/login'">
        <button class="el-button el-button--primary join-us">Join Us</button>
      </router-link>
      <p> Photo by Guduru Ajay bhargav on Pexels. </p>
    </section>
 </div>
</template>



<style scoped>
.home-page {
  display: flex;
  flex-direction: column;
  background-color: rgba(235, 235, 235, 1);
  background-image: url("../assets/images/pexels-guduru-ajay-bhargav-863988.jpg");
  background-position: center;
  background-size: 100%;
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
  padding: 0.5rem;
  font-family: Leelawadee;
  color: white;
  font-size: 48px;
  margin: 50px auto;
  /*border: solid 3px #1a1a1a ;*/
}
p{
  display: block;
  padding: 0.5rem;
  font-family: Leelawadee;
  color: white;
  font-size: 20px;
  font-style: oblique;
  text-align: right;
  margin-top: 300px;
  /*border: solid 3px #1a1a1a;*/
}

button {
  width: 300px;
  height: 65px;
  border: 0;
  margin-top: 15px;
  border-radius: 20px;
  cursor: pointer;
}


/*  outline: white solid 3px;*/
/*}*/
.join-us {
  display: inline-block;
  color: #ffffff;
  font-family: "Arial Rounded MT Bold";
  font-size: 45px;
  vertical-align: center;
}
.join-us:hover {
  background: white;
  color: #337ecc;
}
</style>