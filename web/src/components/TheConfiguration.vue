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
        v-for="lang in languages"
        :key="lang.key"
        @click="langClick(lang.key, lang.label)"
      >
        {{ lang.label }}
      </a-menu-item>
    </a-sub-menu>
  </a-menu>

  <a-form :model="config" :label-col="labelCol" :wrapper-col="wrapperCol">
    <a-form-item :label="t('config-label.source')">
      <a-input v-model:value="config.source" />
    </a-form-item>
    <a-form-item :label="t('config-label.dest')">
      <a-input v-model:value="config.dest" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_once')">
      <a-switch v-model:checked="config.sync_once" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_cron')">
      <a-input v-model:value="config.sync_cron" />
    </a-form-item>
    <a-form-item :label="t('config-label.logically_delete')">
      <a-switch v-model:checked="config.logically_delete" />
    </a-form-item>
    <a-form-item :label="t('config-label.clear_deleted')">
      <a-switch v-model:checked="config.clear_deleted" />
    </a-form-item>
    <a-form-item :label="t('config-label.ignore_conf')">
      <a-input v-model:value="config.ignore_conf" />
    </a-form-item>
    <a-form-item :label="t('config-label.ignore_deleted')">
      <a-switch v-model:checked="config.ignore_deleted" />
    </a-form-item>
    <a-form-item :label="t('config-label.chunk_size')">
      <a-input-number v-model:value="config.chunk_size" />
    </a-form-item>
    <a-form-item :label="t('config-label.checkpoint_count')">
      <a-input-number v-model:value="config.checkpoint_count" />
    </a-form-item>
    <a-form-item :label="t('config-label.force_checksum')">
      <a-switch v-model:checked="config.force_checksum" />
    </a-form-item>
    <a-form-item :label="t('config-label.checksum_algorithm')">
      <AlgorithmSelect v-model:value="config.checksum_algorithm" />
    </a-form-item>
    <a-form-item :label="t('config-label.progress')">
      <a-switch v-model:checked="config.progress" />
    </a-form-item>
    <a-form-item :label="t('config-label.max_tran_rate')">
      <a-input-number v-model:value="config.max_tran_rate" />
    </a-form-item>
    <a-form-item :label="t('config-label.dry_run')">
      <a-switch v-model:checked="config.dry_run" />
    </a-form-item>
    <a-form-item :label="t('config-label.ssh_key')">
      <a-input v-model:value="config.ssh_key" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_delay')">
      <a-switch v-model:checked="config.sync_delay" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_delay_events')">
      <a-input-number v-model:value="config.sync_delay_events" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_delay_time')">
      <a-input v-model:value="config.sync_delay_time" />
    </a-form-item>
    <a-form-item :label="t('config-label.sync_workers')">
      <a-input-number v-model:value="config.sync_workers" />
    </a-form-item>
    <a-form-item :label="t('config-label.retry_count')">
      <a-input-number v-model:value="config.retry_count" />
    </a-form-item>
    <a-form-item :label="t('config-label.retry_wait')">
      <a-input v-model:value="config.retry_wait" />
    </a-form-item>
    <a-form-item :label="t('config-label.retry_async')">
      <a-switch v-model:checked="config.retry_async" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_level')">
      <a-radio-group v-model:value="config.log_level">
        <a-radio value="0">DEBUG</a-radio>
        <a-radio value="1">INFO</a-radio>
        <a-radio value="2">WARN</a-radio>
        <a-radio value="3">ERROR</a-radio>
      </a-radio-group>
    </a-form-item>
    <a-form-item :label="t('config-label.log_file')">
      <a-switch v-model:checked="config.log_file" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_dir')">
      <a-input v-model:value="config.log_dir" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_flush')">
      <a-switch v-model:checked="config.log_flush" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_flush_interval')">
      <a-input v-model:value="config.log_flush_interval" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_event')">
      <a-switch v-model:checked="config.log_event" />
    </a-form-item>
    <a-form-item :label="t('config-label.log_sample_rate')">
      <a-row>
        <a-col :span="12">
          <a-slider v-model:value="config.log_sample_rate" :min="0" :max="1" :step="0.01" />
        </a-col>
        <a-col :span="4">
          <a-input-number
            v-model:value="config.log_sample_rate"
            :min="0"
            :max="1"
            :step="0.01"
            style="margin-left: 16px"
          />
        </a-col>
      </a-row>
    </a-form-item>
    <a-form-item :label="t('config-label.log_format')">
      <a-radio-group v-model:value="config.log_format">
        <a-radio value="text">text</a-radio>
        <a-radio value="json">json</a-radio>
      </a-radio-group>
    </a-form-item>
    <a-form-item :label="t('config-label.log_split_date')">
      <a-switch v-model:checked="config.log_split_date" />
    </a-form-item>
    <a-form-item :label="t('config-label.daemon')">
      <a-switch v-model:checked="config.daemon" />
    </a-form-item>
    <a-form-item :label="t('config-label.daemon_pid')">
      <a-switch v-model:checked="config.daemon_pid" />
    </a-form-item>
    <a-form-item :label="t('config-label.daemon_delay')">
      <a-input v-model:value="config.daemon_delay" />
    </a-form-item>
    <a-form-item :label="t('config-label.daemon_monitor_delay')">
      <a-input v-model:value="config.daemon_monitor_delay" />
    </a-form-item>
    <a-form-item :label="t('config-label.kill_ppid')">
      <a-switch v-model:checked="config.kill_ppid" />
    </a-form-item>
    <a-form-item :label="t('config-label.sub')">
      <a-switch v-model:checked="config.sub" />
    </a-form-item>
    <a-form-item :label="t('config-label.server')">
      <a-switch v-model:checked="config.server" />
    </a-form-item>
    <a-form-item :label="t('config-label.server_addr')">
      <a-input v-model:value="config.server_addr" />
    </a-form-item>
    <a-form-item :label="t('config-label.server_compress')">
      <a-switch v-model:checked="config.server_compress" />
    </a-form-item>
    <a-form-item :label="t('config-label.manage')">
      <a-switch v-model:checked="config.manage" />
    </a-form-item>
    <a-form-item :label="t('config-label.manage_private')">
      <a-switch v-model:checked="config.manage_private" />
    </a-form-item>
    <a-form-item :label="t('config-label.push_server')">
      <a-switch v-model:checked="config.push_server" />
    </a-form-item>
    <a-form-item :label="t('config-label.report')">
      <a-switch v-model:checked="config.report" />
    </a-form-item>
    <a-form-item :label="t('config-label.session_connection')">
      <a-input v-mode:value="config.session_connection" />
    </a-form-item>
    <a-form-item :label="t('config-label.http3')">
      <a-switch v-model:checked="config.http3" />
    </a-form-item>
    <a-form-item :label="t('config-label.tls')">
      <a-switch v-model:checked="config.tls" />
    </a-form-item>
    <a-form-item :label="t('config-label.tls_cert_file')">
      <a-input v-model:value="config.tls_cert_file" />
    </a-form-item>
    <a-form-item :label="t('config-label.tls_key_file')">
      <a-input v-model:value="config.tls_key_file" />
    </a-form-item>
    <a-form-item :label="t('config-label.tls_insecure_skip_verify')">
      <a-switch v-model:checked="config.tls_insecure_skip_verify" />
    </a-form-item>
    <a-form-item :label="t('config-label.users')">
      <a-input v-model:value="config.users" />
    </a-form-item>
    <a-form-item :label="t('config-label.rand_user_count')">
      <a-input-number v-model:value="config.rand_user_count" />
    </a-form-item>
    <a-form-item :label="t('config-label.rand_user_len')">
      <a-input-number v-model:value="config.rand_user_len" />
    </a-form-item>
    <a-form-item :label="t('config-label.rand_pwd_len')">
      <a-input-number v-model:value="config.rand_pwd_len" />
    </a-form-item>
    <a-form-item :label="t('config-label.rand_perm')">
      <a-checkbox-group v-model:value="config.rand_perm" @change="onRandPermChange">
        <a-checkbox value="r" name="type">{{ t('rand-perm-enum.read') }}</a-checkbox>
        <a-checkbox value="w" name="type">{{ t('rand-perm-enum.write') }}</a-checkbox>
        <a-checkbox value="x" name="type">{{ t('rand-perm-enum.execute') }}</a-checkbox>
      </a-checkbox-group>
    </a-form-item>
    <a-form-item :label="t('config-label.token_secret')">
      <a-input v-model:value="config.token_secret" />
    </a-form-item>
    <a-form-item :label="t('config-label.checksum')">
      <a-switch v-model:checked="config.checksum" />
    </a-form-item>
    <a-form-item :label="t('config-label.encrypt')">
      <a-switch v-model:checked="config.encrypt" />
    </a-form-item>
    <a-form-item :label="t('config-label.encrypt_path')">
      <a-input v-model:value="config.encrypt_path" />
    </a-form-item>
    <a-form-item :label="t('config-label.encrypt_secret')">
      <a-input v-model:value="config.encrypt_secret" />
    </a-form-item>
    <a-form-item :label="t('config-label.decrypt')">
      <a-switch v-model:checked="config.decrypt" />
    </a-form-item>
    <a-form-item :label="t('config-label.decrypt_path')">
      <a-input v-model:value="config.decrypt_path" />
    </a-form-item>
    <a-form-item :label="t('config-label.decrypt_secret')">
      <a-input v-model:value="config.decrypt_secret" />
    </a-form-item>
    <a-form-item :label="t('config-label.decrypt_out')">
      <a-input v-model:value="config.decrypt_out" />
    </a-form-item>
    <a-form-item :label="t('config-label.task_conf')">
      <a-input v-model:value="config.task_conf" />
    </a-form-item>
    <a-form-item :label="t('config-label.task_client')">
      <a-switch v-model:checked="config.task_client" />
    </a-form-item>
    <a-form-item :label="t('config-label.task_client_labels')">
      <a-input v-model:value="config.task_client_labels" />
    </a-form-item>
    <a-form-item :label="t('config-label.task_client_max_worker')">
      <a-input-number v-model:value="config.task_client_max_worker" />
    </a-form-item>
    <a-form-item :wrapper-col="{ span: 14, offset: 4 }">
      <a-button type="primary" @click="onSubmit">{{ t('btn.generate-config') }}</a-button>
      <a-button style="margin-left: 10px" @click="onReset">{{ t('btn.reset-config') }}</a-button>
    </a-form-item>
  </a-form>
</template>

<script setup lang="ts">
import { reactive, ref, toRaw } from 'vue'
import { useI18n } from 'vue-i18n'
import AlgorithmSelect from '../components/AlgorithmSelect.vue'
import { TranslationOutlined } from '@ant-design/icons-vue'

const config = reactive({
  source: 'rs://127.0.0.1:8105',
  dest: './dest',
  sync_once: false,
  sync_cron: '',
  logically_delete: false,
  clear_deleted: false,
  ignore_conf: '',
  ignore_deleted: true,
  chunk_size: 1048576,
  checkpoint_count: 10,
  force_checksum: false,
  checksum_algorithm: 'md5',
  progress: false,
  max_tran_rate: 0,
  dry_run: false,
  ssh_key: '',
  sync_delay: false,
  sync_delay_events: 10,
  sync_delay_time: '30s',
  sync_workers: 1,
  retry_count: 15,
  retry_wait: '5s',
  retry_async: false,
  log_level: 1,
  log_file: true,
  log_dir: './logs/',
  log_flush: true,
  log_flush_interval: '3s',
  log_event: false,
  log_sample_rate: 1,
  log_format: 'text',
  log_split_date: false,
  daemon: false,
  daemon_pid: false,
  daemon_delay: '1s',
  daemon_monitor_delay: '3s',
  kill_ppid: false,
  sub: false,
  server: false,
  server_addr: ':443',
  server_compress: false,
  manage: false,
  manage_private: true,
  push_server: false,
  report: false,
  session_connection: 'memory:',
  http3: false,
  tls: true,
  tls_cert_file: 'cert.pem',
  tls_key_file: 'key.pem',
  tls_insecure_skip_verify: true,
  users: 'gofs|password|rwx',
  rand_user_count: 0,
  rand_user_len: 6,
  rand_pwd_len: 10,
  rand_perm: 'r',
  token_secret: '',
  checksum: false,
  encrypt: false,
  encrypt_path: '',
  encrypt_secret: '',
  decrypt: false,
  decrypt_path: '',
  decrypt_secret: '',
  decrypt_out: '',
  task_conf: '',
  task_client: false,
  task_client_labels: '',
  task_client_max_worker: 1
})

const onSubmit = () => {
  const configJson = JSON.stringify(config, null, 2)
  console.log('submit!', toRaw(config))
  const configBlob = new Blob([configJson], { type: 'application/json' })
  const configUrl = URL.createObjectURL(configBlob)
  const downloadLink = document.createElement('a')
  downloadLink.href = configUrl
  downloadLink.download = 'gofs.json'
  const clickEvent = new MouseEvent('click', {
    view: window,
    bubbles: true,
    cancelable: false
  })
  downloadLink.dispatchEvent(clickEvent)
}

function onRandPermChange(e: any) {
  console.log(`rand perm change:${toRaw(e)}`)
  config.rand_perm = e.join(',')
  return false
}

const { t, locale } = useI18n()
const labelCol = { style: { width: '350px' } }
const wrapperCol = { span: 14 }

function onReset(e: any) {
  console.log('reset')
}

const languages = reactive([
  { key: 'en', label: 'English' },
  { key: 'zh-CN', label: '简体中文' }
])

const current = ref({ key: ['en'], label: 'English' })

function langClick(key: string, label: string) {
  locale.value = key
  current.value.label = label
  console.log(locale.value)
}
</script>
