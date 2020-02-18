<template>
  <div>
    <input v-model="guesses">
    <div class="user-guesses">
      <div class="correct">
        {{ guesses }}
      </div>

      <div class="incorrect">
        {{ guesses }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      guesses: [],
      correct: [],
      incorrect: []
    }
  }
}
</script>

<style scoped>
  .user-guesses {
    font-weight: 50;
  }
  .correct {
    font-color: green;
  }
  .incorrect {
    font-color: red;
  }
</style>
