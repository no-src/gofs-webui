<template>
  <a-space direction="vertical">
    <a-input-number
      v-model:value="value"
      :addon-after="tip"
      @change="$emit('update:value', value.toString())"
      min="0"
    />
  </a-space>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'

const props = defineProps<{ value: string }>()
const value = ref(props.value)
const KB = 1024
const MB = KB * 1024
const GB = MB * 1024

const tip = computed(() => {
  const size = Number(value.value)
  if (size >= GB) {
    return `Byte ${toFixed(size / GB)}GB`
  } else if (size >= MB) {
    return `Byte ${toFixed(size / MB)}MB`
  } else if (size >= KB) {
    return `Byte ${toFixed(size / KB)}KB`
  } else {
    return `Byte`
  }
})

function toFixed(num: number): string {
  if (num % 1 == 0) {
    return `= ${num}`
  } else if (Math.abs(num % 1).toString().length < 5) {
    return `= ${num.toFixed(2)}`
  } else {
    return `≈ ${num.toFixed(2)}`
  }
}
</script>
