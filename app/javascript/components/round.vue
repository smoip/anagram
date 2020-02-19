<template>
  <div>
    <button @click="newRound" type="button" :disabled=isLoading>Start New Round!</button> 
    <div>
      {{ word }}
    </div>
    <AnagramInput :anagrams="this.anagrams" ref="anagramComp"/>
  </div>
</template>

<script>
import AnagramInput from './anagram_input.vue'

export default {
  name: 'Round',

  components: {
    AnagramInput
  },

  methods: {
    newRound () {
      this.loading = true
      this.$http.get("/words/fetch_new.json")
        .then((resp) => {
            this.updateData(resp)
            this.loading = false
            this.$refs.anagramComp.clear()
          }
        ) 
    },

    updateData (response) {
      this.response = response.data
      this.word = response.data.data.attributes.original
      this.anagrams = response.data.data.attributes.anagrams
    },
  },

  computed: {
    isLoading () {
      return this.loading
    }
  },

  data () {
    return {
      response: {},
      word: "",
      anagrams: [],
      loading: false
    }
  }
}
</script>
