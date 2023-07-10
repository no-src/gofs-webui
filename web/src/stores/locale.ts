import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useI18n } from 'vue-i18n'

export const useLocate = defineStore('locale', () => {
  const currentLocale = ref(new Locale('en', 'English'))
  const { locale } = useI18n()

  function get(): Locale {
    return currentLocale.value
  }

  function set(key: string, label: string) {
    currentLocale.value.key = key
    currentLocale.value.label = label
    locale.value = key
  }

  function all(): Locale[] {
    return [
      { key: 'en', label: 'English' },
      { key: 'zh-CN', label: '简体中文' }
    ]
  }

  return { get, set, all }
})

class Locale {
  key: string
  label: string

  constructor(key: string, label: string) {
    this.key = key
    this.label = label
  }
}
