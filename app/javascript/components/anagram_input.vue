<template>
  <div>
    <div>
      <textarea v-model="rawGuesses" class="text-input"/>
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
    },
    reduceGuesses (guesses) {
      let mapped = guesses.map(g => g.length)
      return mapped.reduce(
        (acc, cur) => {
          return acc + cur
        }, 0
      )
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
      return this.reduceGuesses(this.correctGuesses)
    },
    currentNegative () {
      return this.reduceGuesses(this.incorrectGuesses)
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
  .text-input {
    border-radius: 5px;
    margin: 5px;
    width: 50%;
    font-size: 1.5em;
    text-align: center;
    resize: none;
  }
</style>
