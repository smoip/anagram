<template>
  <div id="app">
    <Anagram/>
  </div>
</template>

<script>
import Anagram from './components/anagram.vue'
export default {
  name: 'anagram',
  components: {
    Anagram
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 30px;
}
</style>
