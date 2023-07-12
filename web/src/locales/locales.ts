import en from './res/en.json'
import zhCN from './res/zh-CN.json'

export class Locale {
  key: string
  label: string

  constructor(key: string, label: string) {
    this.key = key
    this.label = label
  }
}

export const defaultLocale = new Locale('en', 'English')

export const allLocaleContent = {
  en: en,
  'zh-CN': zhCN
}

export const allLocaleDesc = [
  { key: 'en', label: 'English' },
  { key: 'zh-CN', label: '简体中文' }
]
