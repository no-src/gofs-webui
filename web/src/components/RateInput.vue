<template>
  <a-row>
    <a-col :span="12">
      <a-slider
        v-model:value="value"
        :min="0"
        :max="1"
        :step="0.01"
        @change="$emit('update:value', value)"
      />
    </a-col>
    <a-col :span="4">
      <a-input-number
        v-model:value="value"
        :min="0"
        :max="1"
        :step="0.01"
        style="margin-left: 16px"
        @change="$emit('update:value', value)"
      />
    </a-col>
  </a-row>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps<{ value: number }>()
const value = ref(props.value)
</script>
