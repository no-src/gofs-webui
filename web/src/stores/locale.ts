import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useI18n } from 'vue-i18n'
import { allLocaleDesc, defaultLocale, Locale } from '@/locales/locales'

export const useLocale = defineStore('locale', () => {
  const currentLocale = ref(defaultLocale)
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
    return allLocaleDesc
  }

  return { get, set, all }
})
