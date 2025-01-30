https://docs.gitlab.com/ee/administration/auth/ldap/

Edit /etc/gitlab/gitlab.rb:

```
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
  'main' => {
    'label' => 'LDAP',
    'host' =>  'ldap.mydomain.com',
    'port' => 636,
    'uid' => 'sAMAccountName',
    'bind_dn' => 'CN=Gitlab,OU=Users,DC=domain,DC=com',
    'password' => '<bind_user_password>',
    'encryption' => 'simple_tls',
    'verify_certificates' => true,
    'timeout' => 10,
    'active_directory' => false,
    'user_filter' => '(employeeType=developer)',
    'base' => 'dc=example,dc=com',
    'lowercase_usernames' => 'false',
    'retry_empty_result_with_codes' => [80],
    'allow_username_or_email_login' => false,
    'block_auto_created_users' => false
  }
}
```

Save the file and reconfigure GitLab:

```
sudo gitlab-ctl reconfigure
```

```
gitlab_rails['ldap_enabled'] = true
# gitlab_rails['prevent_ldap_sign_in'] = false

###! **remember to close this block with 'EOS' below**
 gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
   main: # 'main' is the GitLab 'provider ID' of this LDAP server
     label: 'LDAP'
     host: 'host'
     port: 389
     uid: 'uid'
     bind_dn: 'uid=tuz_gitlab,cn=users,cn=accounts,dc=,dc='
     password: '???'
     encryption: 'plain' # "start_tls" or "simple_tls" or "plain"
     verify_certificates: true
     smartcard_auth: false
     active_directory: true
     smartcard_ad_cert_field: 'altSecurityIdentities'
     smartcard_ad_cert_format: null # 'issuer_and_serial_number', 'issuer_and_subject' , 'principal_name'
     allow_username_or_email_login: false
     lowercase_usernames: false
     block_auto_created_users: false
     base: 'cn=users,cn=accounts,dc=,dc='
     user_filter: ''
     ## EE only

```
