<template>
  <div id="app">

    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "hello vue!"
    }
  }
}
</script>

<style scoped>
.container {
  pozition:relative;
}
p {
  positon: absolute;
  left: 500px;
  font-size: 20px;
  text-align: right;
}
</style>
