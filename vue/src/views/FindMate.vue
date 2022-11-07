 <template>
  <div style="margin-bottom: 20px">
    <el-input style="width: 260px; margin-right: 10px" v-model="sex" placeholder="Sex" clearable></el-input>
    <el-input style="width: 260px; margin-right: 10px" v-model="ageLower" placeholder="Age from" clearable></el-input>
    <el-input style="width: 260px; margin-right: 10px" v-model="ageUpper" placeholder="Age to" clearable></el-input>
    <el-button type="primary" @click="match"><el-icon style="margin-right: 3px"><Search /></el-icon> Match</el-button>
  </div>

  <el-table :data="state.tableData" stripe>
    <el-table-column prop="id" label="id"></el-table-column>
    <el-table-column prop="username" label="username"></el-table-column>

    <el-table-column label="Operations">
      <template #default="scope">
        <el-button text @click="add(scope.$index)"
        >Like</el-button
        >
      </template>
    </el-table-column>

  </el-table>
</template>

<script setup>
import { Search } from '@element-plus/icons-vue'
import {reactive, ref} from "vue";
import request from "../request";
import {ElNotification} from "element-plus";

const sex = ref('')
const ageLower = ref('')
const ageUpper = ref('')

const state = reactive({
  tableDate: []
})

const match = () => {
  request.get("/user/match", {
    params: {
      userId: localStorage.getItem('userid'),
      sex: sex.value,
      ageLower: ageLower.value,
      ageUpper: ageUpper.value
    }
  })
      .then(res => {
    state.tableData = res
  })
}

const add = (index) => {
  request.get('/userrelation/relation/'+localStorage.getItem("userid")).then(res => {
    let userRelation = res

    if (userRelation.likeid == null) userRelation.likeid = ''

    if(userRelation.likeid.length>0) {
      userRelation.likeid += ","
      userRelation.likeid += state.tableData[index].id
    }else{
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