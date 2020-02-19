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
  .current-score {
    font-size: 2em;
  }
</style>
