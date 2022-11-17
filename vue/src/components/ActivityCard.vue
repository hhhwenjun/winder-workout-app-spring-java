<template>
<div>
  <h3 class = "activity-title">
    {{sportname}}
  </h3>
  <h4 class = "activity-level">
    {{sportlevel}}
  </h4>
  <div class = "delete">
    Remove Activity
  </div>
</div>
</template>

<script>
export default {
  name: "ActivityCard",
  props: ['sportname', "sportlevel"]
}
</script>

<style scoped>

</style>