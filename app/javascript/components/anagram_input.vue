<template>
  <div>
    <div>
      <div class="guess-label">
        Type Guesses Here:
      </div>
      <textarea v-model="rawGuesses"/>
    </div>
    <GuessList guessKind="correct" :guesses=correctGuesses />
    <GuessList guessKind="incorrect" :guesses=incorrectGuesses />
    <Score :currentScore="this.currentScore" />
  </div>
</template>

<script>
import Score from './score.vue'
import GuessList from './guess_list.vue'

export default {
  props: [
    'anagrams'
  ],
  components: {
    Score,
    GuessList
  },
  methods: {
    clear () {
      this.rawGuesses = ""
    }
  },
  computed: {
    correctGuesses () {
      return this.guesses.filter(g => this.anagrams.includes(g))
    },
    incorrectGuesses () {
      return this.guesses.filter(g => !this.anagrams.includes(g))
    },
    guesses () {
      let splitGuesses = new Set(this.rawGuesses.split(' '))
      let uniqGuesses = [...splitGuesses]
      return uniqGuesses.filter(g => g != "")
    },
    currentPositive () {
      let positive = this.correctGuesses.map(word => word.length)
      return positive.reduce(
        (acc, cur) => {
          return acc + cur
        }, 0
      )
    },
    currentNegative () {
      let negative = this.incorrectGuesses.map(word => word.length)
      return negative.reduce(
        (acc, cur) => {
          return acc + cur
        }, 0
      )
    },
    currentScore () {
      return this.currentPositive - this.currentNegative
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
</style>
