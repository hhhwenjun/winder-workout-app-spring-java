<template>
  <div class="user-scroll-panel">
    <main>
      <PostPartner v-for="(anime, i) in anime_list" :key="i" :anime="anime"/>
    </main>
  </div>
</template>


<script>
import PostPartner from "./PostPartner.vue";

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
    getAnime() {
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
        "User 11",
        "User 12",
      ];
      const anime = [];
      for (let i = 0; i < 10; i++) {
        anime.push({
          title: anime_titles[
              Math.floor(Math.random() * anime_titles.length)
              ],
          description:
              "Alex Coolkid, 23 Blacksburg, VA",
        });
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
  },
  mounted() {
    this.anime_list = this.getAnime();
    window.addEventListener("scroll", this.handleScroll);
  },
};
</script>


<style scoped>
.user-scroll-panel {
  box-sizing: border-box;
  /*background-color: #2c3e50;*/
  min-height: 100vh;
  padding-top: 3rem;
}

main {
  pading: 0 2rem;
  max-width: 640px;
  margin: 0 auto;

}
</style>