export const defaultConfig = {
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
  copy_link: false,
  copy_unsafe_link: false,
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
}
