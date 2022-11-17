<template>

  <setction class="all-boxes">
    <section class="group-info-panel">
      <div>
        <p>{{anime.sport}}: {{anime.experience}}</p>
        <p>Time: {{anime.time}}</p>
        <p>Location: {{anime.location}}</p>
        <p>Group size: {{anime.size}}</p>
      </div>
      <div class="sport-logo">
        <font-awesome-icon icon="fa-solid fa-person-hiking" size="7x"/>
      </div>
    </section>
    <section class="other-info-panel">
      <div class="created-by">
        <h2>
          Created by:
          <br />
          <br />
          &nbsp;&nbsp;&nbsp;&nbsp;{{ anime.createdBy}}
        </h2>
      </div>

      <div class="other-info-panel-but">
        <button><font-awesome-icon icon="fa-brands fa-gratipay" size="7x"/></button>
      </div>
    </section>
  </setction>
</template>

<script>
export default {
  props: ["anime"],
  name: "PostGroup"
}
</script>

<style scoped>

p {
  font-size: 22px;
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
  width: 500px;
  text-align: left;
}
.group-info-panel {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  position: relative;
  width: 500px;
  min-height: 100px;
  align-items: start;
}

.sport-logo {
  color: black;
}
.other-info-panel {
  display: flex;
  flex-direction: row;
  position: relative;
  width: 500px;
  min-height: 120px;
  align-items: start;
}

.created-by{
  width: 250px;
}
.other-info-panel-but {
  width: 250px;
  bottom: 0px;
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
  background: #07564d;
}

.other-info-panel button:hover {
  background: whitesmoke;
}

</style>