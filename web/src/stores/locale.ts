import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useI18n } from 'vue-i18n'
import { allLocales, defaultLocale, Locale } from '@/locales/locales'

export const useLocale = defineStore('locale', () => {
  const currentLocale = ref(defaultLocale)
  const { locale } = useI18n()

  function get(): Locale {
    return currentLocale.value
  }

  function set(name: string, desc: string) {
    currentLocale.value.name = name
    currentLocale.value.desc = desc
    locale.value = name
  }

  function all(): Locale[] {
    return allLocales
  }

  return { get, set, all }
})
