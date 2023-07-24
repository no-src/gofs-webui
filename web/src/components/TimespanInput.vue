<template>
  <a-space direction="vertical">
    <a-input-number
      v-model:value="timespan"
      :addon-after="tip"
      @change="$emit('update:value', value)"
      min="0"
      max="9999999"
    />
  </a-space>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'

const props = defineProps<{ value: string }>()
const value = ref(props.value)
const Minute = 60
const Hour = Minute * 60

const timespan = computed({
  get(): number {
    return toSeconds(value.value)
  },
  set(newValue: number) {
    value.value = secondsToString(newValue)
  }
})

const tip = computed(() => {
  if (timespan.value < Minute) {
    return 's'
  }
  return 's = ' + secondsToString(timespan.value)
})

function toSeconds(str: string): number {
  const h = str.match(/(\d+)h/)?.map(Number)[1] || 0
  const m = str.match(/(\d+)m/)?.map(Number)[1] || 0
  const s = str.match(/(\d+)s/)?.map(Number)[1] || 0
  return h * Hour + m * Minute + s
}

function secondsToString(t: number): string {
  if (t == 0) {
    return '0s'
  }
  let [h, m, s] = [0, 0, 0]
  if (t >= Hour) {
    h = Math.trunc(t / Hour)
  }
  if (t >= Minute) {
    m = Math.trunc((t - h * Hour) / Minute)
  }
  s = t - h * Hour - m * Minute
  let str = ''
  if (h > 0) {
    str += `${h}h`
  }
  if (m > 0) {
    str += `${m}m`
  }
  if (s > 0) {
    str += `${s}s`
  }
  return str
}
</script>
