import en from './res/en.json'
import zhCN from './res/zh-CN.json'
import { createI18n } from 'vue-i18n'

export class Locale {
  name: string
  desc: string

  constructor(name: string, desc: string) {
    this.name = name
    this.desc = desc
  }
}

export const defaultLocale = new Locale('en', 'English')

export const allLocales: Locale[] = [
  { name: 'en', desc: 'English' },
  { name: 'zh-CN', desc: '简体中文' }
]

export const i18n = createI18n<false>({
  legacy: false,
  locale: defaultLocale.name,
  fallbackLocale: defaultLocale.name,
  messages: {
    en: en,
    'zh-CN': zhCN
  }
})
