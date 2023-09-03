<template>
  <a-form :model="config" :label-col="labelCol" :wrapper-col="wrapperCol">
    <a-form-item :label="$t('config-label.source')">
      <a-input v-model:value="config.source" />
    </a-form-item>
    <a-form-item :label="$t('config-label.dest')">
      <a-input v-model:value="config.dest" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_once')">
      <a-switch v-model:checked="config.sync_once" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_cron')">
      <a-input v-model:value="config.sync_cron" />
    </a-form-item>
    <a-form-item :label="$t('config-label.logically_delete')">
      <a-switch v-model:checked="config.logically_delete" />
    </a-form-item>
    <a-form-item :label="$t('config-label.clear_deleted')">
      <a-switch v-model:checked="config.clear_deleted" />
    </a-form-item>
    <a-form-item :label="$t('config-label.ignore_conf')">
      <a-input v-model:value="config.ignore_conf" />
    </a-form-item>
    <a-form-item :label="$t('config-label.ignore_deleted')">
      <a-switch v-model:checked="config.ignore_deleted" />
    </a-form-item>
    <a-form-item :label="$t('config-label.chunk_size')">
      <StorageInput v-model:value="config.chunk_size" />
    </a-form-item>
    <a-form-item :label="$t('config-label.checkpoint_count')">
      <NumberInput v-model:value="config.checkpoint_count" />
    </a-form-item>
    <a-form-item :label="$t('config-label.force_checksum')">
      <a-switch v-model:checked="config.force_checksum" />
    </a-form-item>
    <a-form-item :label="$t('config-label.checksum_algorithm')">
      <AlgorithmSelect v-model:value="config.checksum_algorithm" />
    </a-form-item>
    <a-form-item :label="$t('config-label.progress')">
      <a-switch v-model:checked="config.progress" />
    </a-form-item>
    <a-form-item :label="$t('config-label.max_tran_rate')">
      <StorageInput v-model:value="config.max_tran_rate" />
    </a-form-item>
    <a-form-item :label="$t('config-label.dry_run')">
      <a-switch v-model:checked="config.dry_run" />
    </a-form-item>
    <a-form-item :label="$t('config-label.copy_link')">
      <a-switch v-model:checked="config.copy_link" />
    </a-form-item>
    <a-form-item :label="$t('config-label.copy_unsafe_link')" v-if="config.copy_link">
      <a-switch v-model:checked="config.copy_unsafe_link" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_delay')">
      <a-switch v-model:checked="config.sync_delay" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_delay_events')" v-if="config.sync_delay">
      <NumberInput v-model:value="config.sync_delay_events" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_delay_time')" v-if="config.sync_delay">
      <TimespanInput v-model:value="config.sync_delay_time" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sync_workers')">
      <NumberInput v-model:value="config.sync_workers" />
    </a-form-item>
    <a-form-item :label="$t('config-label.retry_count')">
      <NumberInput v-model:value="config.retry_count" />
    </a-form-item>
    <a-form-item :label="$t('config-label.retry_wait')">
      <TimespanInput v-model:value="config.retry_wait" />
    </a-form-item>
    <a-form-item :label="$t('config-label.retry_async')">
      <a-switch v-model:checked="config.retry_async" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_level')">
      <a-radio-group v-model:value="config.log_level">
        <a-radio :value="0">DEBUG</a-radio>
        <a-radio :value="1">INFO</a-radio>
        <a-radio :value="2">WARN</a-radio>
        <a-radio :value="3">ERROR</a-radio>
      </a-radio-group>
    </a-form-item>
    <a-form-item :label="$t('config-label.log_file')">
      <a-switch v-model:checked="config.log_file" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_dir')">
      <a-input v-model:value="config.log_dir" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_flush')">
      <a-switch v-model:checked="config.log_flush" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_flush_interval')" v-if="config.log_flush">
      <TimespanInput v-model:value="config.log_flush_interval" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_event')">
      <a-switch v-model:checked="config.log_event" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_sample_rate')">
      <RateInput v-model:value="config.log_sample_rate" />
    </a-form-item>
    <a-form-item :label="$t('config-label.log_format')">
      <a-radio-group v-model:value="config.log_format">
        <a-radio value="text">text</a-radio>
        <a-radio value="json">json</a-radio>
      </a-radio-group>
    </a-form-item>
    <a-form-item :label="$t('config-label.log_split_date')">
      <a-switch v-model:checked="config.log_split_date" />
    </a-form-item>
    <a-form-item :label="$t('config-label.daemon')">
      <a-switch v-model:checked="config.daemon" />
    </a-form-item>
    <a-form-item :label="$t('config-label.daemon_pid')" v-if="config.daemon">
      <a-switch v-model:checked="config.daemon_pid" />
    </a-form-item>
    <a-form-item :label="$t('config-label.daemon_delay')" v-if="config.daemon">
      <TimespanInput v-model:value="config.daemon_delay" />
    </a-form-item>
    <a-form-item :label="$t('config-label.daemon_monitor_delay')" v-if="config.daemon">
      <TimespanInput v-model:value="config.daemon_monitor_delay" />
    </a-form-item>
    <a-form-item :label="$t('config-label.kill_ppid')">
      <a-switch v-model:checked="config.kill_ppid" />
    </a-form-item>
    <a-form-item :label="$t('config-label.sub')">
      <a-switch v-model:checked="config.sub" />
    </a-form-item>
    <a-form-item :label="$t('config-label.server')">
      <a-switch v-model:checked="config.server" />
    </a-form-item>
    <a-form-item :label="$t('config-label.server_addr')" v-if="config.server">
      <a-input v-model:value="config.server_addr" />
    </a-form-item>
    <a-form-item :label="$t('config-label.server_compress')" v-if="config.server">
      <a-switch v-model:checked="config.server_compress" />
    </a-form-item>
    <a-form-item :label="$t('config-label.manage')" v-if="config.server">
      <a-switch v-model:checked="config.manage" />
    </a-form-item>
    <a-form-item :label="$t('config-label.manage_private')" v-if="config.server && config.manage">
      <a-switch v-model:checked="config.manage_private" />
    </a-form-item>
    <a-form-item :label="$t('config-label.push_server')" v-if="config.server">
      <a-switch v-model:checked="config.push_server" />
    </a-form-item>
    <a-form-item :label="$t('config-label.report')" v-if="config.server && config.manage">
      <a-switch v-model:checked="config.report" />
    </a-form-item>
    <a-form-item :label="$t('config-label.session_connection')" v-if="config.server">
      <a-input v-model:value="config.session_connection" />
    </a-form-item>
    <a-form-item :label="$t('config-label.http3')">
      <a-switch v-model:checked="config.http3" />
    </a-form-item>
    <a-form-item :label="$t('config-label.tls')">
      <a-switch v-model:checked="config.tls" />
    </a-form-item>
    <a-form-item :label="$t('config-label.tls_cert_file')">
      <a-input v-model:value="config.tls_cert_file" />
    </a-form-item>
    <a-form-item :label="$t('config-label.tls_key_file')">
      <a-input v-model:value="config.tls_key_file" />
    </a-form-item>
    <a-form-item :label="$t('config-label.tls_insecure_skip_verify')">
      <a-switch v-model:checked="config.tls_insecure_skip_verify" />
    </a-form-item>
    <a-form-item :label="$t('config-label.users')">
      <a-input v-model:value="config.users" />
    </a-form-item>
    <a-form-item :label="$t('config-label.rand_user_count')">
      <NumberInput v-model:value="config.rand_user_count" />
    </a-form-item>
    <a-form-item :label="$t('config-label.rand_user_len')" v-if="config.rand_user_count > 0">
      <NumberInput v-model:value="config.rand_user_len" />
    </a-form-item>
    <a-form-item :label="$t('config-label.rand_pwd_len')" v-if="config.rand_user_count > 0">
      <NumberInput v-model:value="config.rand_pwd_len" />
    </a-form-item>
    <a-form-item :label="$t('config-label.rand_perm')" v-if="config.rand_user_count > 0">
      <a-checkbox-group v-model:value="randPerm">
        <a-checkbox value="r" name="type">{{ $t('rand-perm-enum.read') }}</a-checkbox>
        <a-checkbox value="w" name="type">{{ $t('rand-perm-enum.write') }}</a-checkbox>
        <a-checkbox value="x" name="type">{{ $t('rand-perm-enum.execute') }}</a-checkbox>
      </a-checkbox-group>
    </a-form-item>
    <a-form-item :label="$t('config-label.token_secret')">
      <a-input v-model:value="config.token_secret" />
    </a-form-item>
    <a-form-item :label="$t('config-label.checksum')">
      <a-switch v-model:checked="config.checksum" />
    </a-form-item>
    <a-form-item :label="$t('config-label.encrypt')">
      <a-switch v-model:checked="config.encrypt" />
    </a-form-item>
    <a-form-item :label="$t('config-label.encrypt_path')" v-if="config.encrypt">
      <a-input v-model:value="config.encrypt_path" />
    </a-form-item>
    <a-form-item :label="$t('config-label.encrypt_secret')" v-if="config.encrypt">
      <a-input v-model:value="config.encrypt_secret" />
    </a-form-item>
    <a-form-item :label="$t('config-label.decrypt')">
      <a-switch v-model:checked="config.decrypt" />
    </a-form-item>
    <a-form-item :label="$t('config-label.decrypt_path')" v-if="config.decrypt">
      <a-input v-model:value="config.decrypt_path" />
    </a-form-item>
    <a-form-item :label="$t('config-label.decrypt_secret')" v-if="config.decrypt">
      <a-input v-model:value="config.decrypt_secret" />
    </a-form-item>
    <a-form-item :label="$t('config-label.decrypt_out')" v-if="config.decrypt">
      <a-input v-model:value="config.decrypt_out" />
    </a-form-item>
    <a-form-item :label="$t('config-label.task_conf')">
      <a-input v-model:value="config.task_conf" />
    </a-form-item>
    <a-form-item :label="$t('config-label.task_client')">
      <a-switch v-model:checked="config.task_client" />
    </a-form-item>
    <a-form-item :label="$t('config-label.task_client_labels')" v-if="config.task_client">
      <a-input v-model:value="config.task_client_labels" />
    </a-form-item>
    <a-form-item :label="$t('config-label.task_client_max_worker')" v-if="config.task_client">
      <NumberInput v-model:value="config.task_client_max_worker" />
    </a-form-item>
    <a-form-item :wrapper-col="{ span: 14, offset: 4 }">
      <a-button type="primary" @click="onSubmit">{{ $t('btn.generate-config') }}</a-button>
      <a-button style="margin-left: 10px" @click="onReset">{{ $t('btn.reset-config') }}</a-button>
    </a-form-item>
  </a-form>
</template>

<script setup lang="ts">
import { computed, reactive, toRaw } from 'vue'
import { defaultConfig } from '@/config/defaultConfig'
import AlgorithmSelect from '@/components/AlgorithmSelect.vue'
import StorageInput from '@/components/StorageInput.vue'
import TimespanInput from '@/components/TimespanInput.vue'
import NumberInput from '@/components/NumberInput.vue'
import RateInput from '@/components/RateInput.vue'

const config = reactive(defaultConfig)

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

let randPerm = computed({
  get() {
    return config.rand_perm.split('')
  },
  set(newRandPerm: string[]) {
    config.rand_perm = newRandPerm.join('')
  }
})

const labelCol = { style: { width: '350px' } }
const wrapperCol = { span: 14 }

function onReset(e: any) {
  console.log('reset')
}
</script>
