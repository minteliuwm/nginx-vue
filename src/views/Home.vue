<template>
  <div class="home">
    <div>{{desc}}</div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component
export default class MHome extends Vue {
  private desc: string = '';

  private async mounted() {
    this.desc = await this.$request('getAppDesc');
  }
}
</script>
