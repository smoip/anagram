<template>
  <div>

    <h3 class="current-score">
      Score:
      {{ currentScore }}
    </h3>
  </div>
</template>

<script>
export default {
  props: [
    'currentScore'
  ]
}
</script>

<style scoped>
  .current_score {
    font-weight: 100;
    color: #099602;
  }
</style>
