<template>
  <div>
    <textarea v-model="rawGuesses" label="Type Guesses Here:"/>
    <div class="user-guesses">
      {{ guesses }}
      <div class="correct">
        {{ correctGuesses }}
      </div>

      <div class="incorrect">
        {{ incorrectGuesses }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: [
    'anagrams'
  ],
  computed: {
    correctGuesses () {
      return this.guesses.filter(f => this.anagrams.includes(f))
    },
    incorrectGuesses () {
      return this.guesses.filter(f => !this.anagrams.includes(f))
    },
    guesses () {
      let splitGuesses = new Set(this.rawGuesses.split(' '))
      return [...splitGuesses]
    }
  },
  data () {
    return {
      rawGuesses: ""
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
