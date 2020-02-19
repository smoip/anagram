<template>
  <div>
    <button @click="newRound" type="button" :disabled=isLoading>Start New Round!</button> 
    {{ word }}
    {{ anagrams }}
    <AnagramInput :anagrams="this.anagrams" />
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
