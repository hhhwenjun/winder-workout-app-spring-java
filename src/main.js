import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// import axios from "axios";

import Element from "element-plus";
import "element-plus/theme-chalk/index.css";

// createApp.prototype.axios = axios; // connection back and front
createApp(App).use(Element).use(store).use(router).mount("#app");
