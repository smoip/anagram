<template>
  <div>
    <div class="guess-header">{{ headerString }}</div>
    <div v-bind:class="{ correct: isCorrect, incorrect: isIncorrect }">{{ displayString }}</div>
  </div>
</template>

<script>
export default {
  props: [
    'guesses',
    'guessKind'
  ],
  computed: {
    isCorrect () {
      return this.guessKind == "correct"
    },
    isIncorrect () {
      return this.guessKind != "correct"
    },
    separator () {
      if (this.isCorrect) {
        return "✓"
      } else {
        return "✖"
      }
    },
    displayString () {
      if (this.guesses.length > 0) {
        return this.guesses.join(`${this.separator} `) + this.separator
      }
    },
    headerString () {
      if (this.guesses.length == 0) {
        return null
      }
      if (this.isCorrect) {
        return "Correct!"
      }
      if (this.isIncorrect) {
        return "Inorrect!"
      }
    }
  }
}
</script>

<style scoped>
  .correct {
    color: green;
  }
  .incorrect {
    color: red;
  }
  .guess-header {
    padding: 5px;
    font-size: 1.5em;
  }
</style>
