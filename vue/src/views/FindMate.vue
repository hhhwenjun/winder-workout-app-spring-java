<template>
  <div style="margin-bottom: 20px">
    <el-select style="width: 200px; margin: 10px" v-model="sex" placeholder="Gender" clearable label="Gender">
      <el-option v-for="item in state.gender_options" :label="item.label" :value="item.value"/>
    </el-select>
    <el-input style="width: 200px; margin: 10px" v-model="ageLower" placeholder="Age from" clearable></el-input>
    <el-input style="width: 200px; margin: 10px" v-model="ageUpper" placeholder="Age to" clearable></el-input>
    <el-select style="width: 200px; margin: 10px" v-model="sport" placeholder="Sport" clearable label="Sport">
      <el-option v-for="item in state.sport_options" :label="item.sportname" :value="item.id"/>
    </el-select>
    <el-select style="width: 200px; margin: 10px" v-model="experience" clearable placeholder="Experience Level"
               label="Experience">
      <el-option v-for="item in state.level_options" :label="item" :value="item"/>
    </el-select>
    <el-button style="margin: 10px" type="primary" @click="match">
      <el-icon style="margin-right: 3px">
        <Search/>
      </el-icon>
      Match
    </el-button>
  </div>

  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button text @click="add(scope.$index)"
        >Like
        </el-button
        >
      </template>
    </el-table-column>

  </el-table>
</template>

<script setup>
import {Search} from '@element-plus/icons-vue'
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";

// set up the criteria for search
const sex = ref('')
const ageLower = ref('')
const ageUpper = ref('')
const sport = ref('')
const experience = ref('')

const state = reactive({
  tableDate: [],
  gender_options: [{value: 'female', label: 'Female'}, {value: 'male', label: 'Male'}],
  level_options: ["Beginner", "Intermediate", "Expert"],
  sport_options: []
})

// Get the required sport data to show as the options
request.get('/sport').then(res => {
  state.sport_options = res
})

const match = () => {
  request.get("/user/match", {
    params: {
      userId: localStorage.getItem('userid'),
      sex: sex.value,
      ageLower: ageLower.value,
      ageUpper: ageUpper.value,
      sport: sport.value,
      experience: experience.value
    }
  })
      .then(res => {
        state.tableData = res
      })
}

const add = (index) => {
  request.get('/userrelation/relation/' + localStorage.getItem("userid")).then(res => {
    let userRelation = res

    if (userRelation.likeid == null) userRelation.likeid = ""

    if (userRelation.likeid.length > 0) {
      userRelation.likeid += ","
      userRelation.likeid += state.tableData[index].id
    } else {
      userRelation.likeid += state.tableData[index].id
    }

    request.post('/userrelation/update', userRelation).then(res => {
      if (res.code === '200') {
        ElNotification({
          type: 'success',
          message: 'Like Successful'
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
</script>

<style scoped>

</style>