<template>
  <div class="user-scroll-panel">
    <div style="margin-bottom: 20px">
      <el-input style="width: 260px; margin-right: 10px" v-model="sex" placeholder="Sex" clearable></el-input>
      <el-input style="width: 260px; margin-right: 10px" v-model="ageLower" placeholder="Age from" clearable></el-input>
      <el-input style="width: 260px; margin-right: 10px" v-model="ageUpper" placeholder="Age to" clearable></el-input>
      <el-button type="primary" @click="match"><el-icon style="margin-right: 3px"><Search /></el-icon> Match</el-button>
    </div>

    <main>
      <PostPartner v-for="(anime, i) in anime_list" :key="i" :anime="anime"/>
    </main>
  </div>
</template>




<script>
import PostPartner from "./PostPartner.vue";
import { Search } from '@element-plus/icons-vue'
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";
import { getCurrentInstance } from 'vue';

const sex = ref('')
const ageLower = ref('')
const ageUpper = ref('')

const state = reactive({
  tableDate: []
})

export default {
  name: "FindWorkoutPartner",
  data() {
    return {
      anime_list: []
    }
  },
  components: {
    PostPartner,
  },
  methods: {
    //use fecth api to replace them
    match() {
      request.get("/user/match", {
        params: {
          userId: localStorage.getItem('userid'),
          sex: sex.value,
          ageLower: ageLower.value,
          ageUpper: ageUpper.value
        }
      })
          .then(res => {
            state.tableData = res;
            // this.getAnime();
            this.$forceUpdate()
          })
    },
    getAnime() {
      // const anime_titles = [
      //   "User 1",
      //   "User 2",
      //   "User 3",
      //   "User 4",
      //   "User 5",
      //   "User 6",
      //   "User 7",
      //   "User 8",
      //   "User 9",
      //   "User 10",
      //   "User 11",
      //   "User 12",
      // ];
      // const anime = [];
      // for (let i = 0; i < 10; i++) {
      //   anime.push({
      //     title: anime_titles[
      //         Math.floor(Math.random() * anime_titles.length)
      //         ],
      //     description:
      //         "Alex Coolkid, 23 Blacksburg, VA",
      //   });
      // }

      const anime_titles = [
        "User 1",
        "User 2",
        "User 3",
        "User 4",
        "User 5",
        "User 6",
        "User 7",
        "User 8",
        "User 9",
        "User 10",
      ];
      const anime_ages = [
        "24",
        "36",
        "25",
        "28",
        "30",
        "32",
        "23",
        "40",
        "27",
        "49",
      ];
      const anime_address = [
        "Blacksburg, VA, 22030",
        "College Park, MD, 15641",
        "Falls Church, VA, 45268",
        "Washington, D.C.",
        "Blacksburg, VA",
        "College Park, MD",
        "Falls Church, VA",
        "Washington, D.C.",
        "Blacksburg, VA",
        "College Park, MD",
      ];
      const anime_imgSrc = [
        "user1.jpg",
        "user2.jpg",
        "user3.jpg",
        "user4.jpg",
        "user5.jpg",
        "user6.jpg",
        "user7.jpg",
        "WinderIcon.jpg",
        "WinderIcon.jpg",
        "WinderIcon.jpg",
      ];
      const anime_ids = [
        1001,
        1002,
        1003,
        1004,
        1005,
        1006,
        1007,
        1008,
        1009,
        1010,
      ];
      const anime = [];
      // for (let i = 0; i < anime_titles.length; i++) {
      //   // let userIndex = Math.floor(Math.random() * anime.title.length);
      //   anime.push({
      //     imgScr: anime_imgSrc[i],
      //     title: anime_titles[i],
      //     age: anime_ages[i],
      //     description:
      //         "Student",
      //     address: anime_address[i],
      //     id: anime_ids[i]
      //   });
      // }

      // const anime = [];
      // this.match();
      if (state.tableData) {
        this.match()
      for (let i = 0; i < 3; i++ ) {

          anime.push({
            // title: state.tableData[i].id,
            // description: state.tableData[i].username
            imgScr: anime_imgSrc[i],
            title: state.tableData[i].username,
            age: state.tableData[i].age,
            description: state.tableData[i].sex,
            address: state.tableData[i].address,
            id: state.tableData[i].id
          })
        }
      }

      return anime;
    },
    handleScroll() {
      if (
          window.scrollY + window.innerHeight >=
          document.body.scrollHeight - 50
      ) {
        const new_anime = this.getAnime();
        this.anime_list = [...this.anime_list, ...new_anime];
      }
    },

    add(index) {
      request.get('/userrelation/relation/'+localStorage.getItem("userid")).then(res => {
        let userRelation = res

        if(userRelation.mateid.length>0) {
          userRelation.mateid += ","
          userRelation.mateid += state.tableData[index].id
        }else{
          userRelation.mateid += state.tableData[index].id
        }

        request.post('/userrelation/update', userRelation).then(res => {
          if (res.code === '200') {
            ElNotification({
              type: 'success',
              message: 'Match Success'
            })
            match()
          } else {
            ElNotification({
              type: 'error',
              message: res.msg
            })
          }
        })
      })
    }

  },
  mounted() {
    this.anime_list = this.getAnime();
    window.addEventListener("scroll", this.handleScroll);
  },
}
</script>


<style scoped>
.user-scroll-panel {
  box-sizing: border-box;
  min-height: 120vh;
}

main {
  background-color: lightgray;
  width: 565px;
  /*pading: 2rem 2rem;*/
  margin: 2rem auto;
  border-radius: 2rem;
}
</style>