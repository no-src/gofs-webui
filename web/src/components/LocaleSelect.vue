<template>
  <a-menu
    v-model:selectedKeys="current.key"
    mode="horizontal"
    style="justify-content: flex-end; margin-bottom: 20px"
  >
    <a-sub-menu key="sub">
      <template #icon>
        <TranslationOutlined />
      </template>
      <template #title>{{ current.label }}</template>
      <a-menu-item
        v-for="locale in locales"
        :key="locale.name"
        @click="localeClick(locale.name, locale.desc)"
      >
        {{ locale.desc }}
      </a-menu-item>
    </a-sub-menu>
  </a-menu>
</template>

<script setup lang="ts">
import { computed, reactive } from 'vue'
import { TranslationOutlined } from '@ant-design/icons-vue'
import { useLocale } from '../stores/locale'

const localeStore = useLocale()
const locales = reactive(localeStore.all())
const current = computed(() => {
  return { key: [localeStore.get().name], label: localeStore.get().desc }
})

function localeClick(name: string, desc: string) {
  localeStore.set(name, desc)
}
</script>
