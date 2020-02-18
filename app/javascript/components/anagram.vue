<template>
  <div>
    <div class="head-material">
      <h1>Anagram</h1>
      <p>
        <Round/>
      </p>
    </div>
  </div>
</template>

<script>
import Round from './round.vue'

export default {
  name: 'Anagram',
  components: {
    Round
  },

  methods: {
  },

  created () {
  },

  computed: {
  },

  data () {
    return {
    }
  }
}
</script>

<style scoped>
  .head-material {
    padding-bottom: 40px;
  }
</style>
