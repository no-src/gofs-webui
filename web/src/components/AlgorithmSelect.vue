<template>
  <a-space>
    <a-select
      ref="select"
      v-model:value="value"
      style="width: 120px"
      :options="options"
      @change="$emit('update:value', value)"
    >
    </a-select>
  </a-space>
</template>

<script setup lang="ts">
import type { SelectProps } from 'ant-design-vue'
import { ref } from 'vue'

const options = ref<SelectProps['options']>([
  {
    value: 'md5',
    label: 'md5'
  },
  {
    value: 'sha1',
    label: 'sha1'
  },
  {
    value: 'sha256',
    label: 'sha256'
  },
  {
    value: 'sha512',
    label: 'sha512'
  },
  {
    value: 'crc32',
    label: 'crc32'
  },
  {
    value: 'crc64',
    label: 'crc64'
  },
  {
    value: 'adler32',
    label: 'adler32'
  },
  {
    value: 'fnv-1-32',
    label: 'fnv-1-32'
  },
  {
    value: 'fnv-1a-32',
    label: 'fnv-1a-32'
  },
  {
    value: 'fnv-1-64',
    label: 'fnv-1-64'
  },
  {
    value: 'fnv-1a-64',
    label: 'fnv-1a-64'
  },
  {
    value: 'fnv-1-128',
    label: 'fnv-1-128'
  },
  {
    value: 'fnv-1a-128',
    label: 'fnv-1a-128'
  }
])
const props = defineProps<{ value: string }>()
const value = ref(props.value)
</script>
