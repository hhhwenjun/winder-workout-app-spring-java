<template>
  <footer class="container">
    <section class="copyright">
      <font-awesome-icon icon="fa-solid fa-copyright"/>
      2022 Winder
    </section>
    <section class="links">
      <router-link to="/" class="link-text">About Us</router-link>
      |
      <router-link to="/" class="link-text">Contact Us</router-link>
      |
      <router-link to="/" class="link-text">Directions</router-link>
    </section>
    <section class="social-media-icons">
      Follow Us&nbsp;
      <router-link to="/"
      >
        <font-awesome-icon
            icon="fa-brands fa-square-twitter"
            size="lg"
        />
      </router-link
      >&nbsp;
      <router-link to="/"
      >
        <font-awesome-icon
            icon="fa-brands fa-square-facebook"
            size="lg"
        />
      </router-link
      >&nbsp;
      <router-link to="/"
      >
        <font-awesome-icon icon="fa-brands fa-square-instagram" size="lg"/>
      </router-link>
    </section>
  </footer>
</template>

<script>
export default {
  name: "AppFooter"
}
</script>

<style scoped>
footer {
  background: rgba(251, 206, 59, 1);
  min-height: 100px;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  font-family: Monda;
  gap: 0;
  padding: 0.25rem;
}

.copyright,
links,
social-media-icons {
  padding: 0.25rem;
  /*border: 2px solid #009688;*/
}

.link-text {
  text-decoration: none;
}

.link-text:hover {
  text-decoration: underline 1.5px;
}
</style>