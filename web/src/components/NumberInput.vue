<template>
  <a-input-number
    v-model:value="value"
    :min="0"
    :max="99999"
    @change="$emit('update:value', value)"
  />
</template>

<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps<{ value: number }>()
const value = ref(props.value)
</script>
