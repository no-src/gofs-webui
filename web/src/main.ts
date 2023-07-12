import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
import { createI18n } from 'vue-i18n'

import App from './App.vue'
import router from './router'
import { defaultLocale, allLocaleContent } from './locales/locales'

const i18n = createI18n<false>({
  legacy: false,
  locale: defaultLocale.key,
  fallbackLocale: defaultLocale.key,
  messages: allLocaleContent
})

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(Antd)
app.use(i18n)

app.mount('#app')
