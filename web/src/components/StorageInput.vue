<template>
  <a-space direction="vertical">
    <a-input-number
      v-model:value="value"
      :addon-after="tip"
      @change="$emit('update:value', value)"
      min="0"
    />
  </a-space>
</template>

<script lang="ts" setup>
import { computed, ref } from 'vue'

const props = defineProps<{ value: number }>()
const value = ref(props.value)
const KB = 1024
const MB = KB * 1024
const GB = MB * 1024

const tip = computed(() => {
  if (value.value >= GB) {
    return `Byte ${toFixed(value.value / GB)}GB`
  } else if (value.value >= MB) {
    return `Byte ${toFixed(value.value / MB)}MB`
  } else if (value.value >= KB) {
    return `Byte ${toFixed(value.value / KB)}KB`
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
