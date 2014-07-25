class services::params (
    $services,
)
{
    $services_bydomain = parseyaml(inline_template('<%= @services.inject({}) {|hash, service| key = service["fqdn"].split(".")[1..-1].join("."); (hash[key] ||= []) << service; hash }.to_yaml %>'))
    $services_namebyfqdn = parseyaml(inline_template('<%= @services.inject({}) {|hash, service| (hash[service["fqdn"]] ||= []) << service["name"]; hash }.to_yaml %>'))
    $services_fqdnbydomainandname = parseyaml(inline_template('<%= @services.inject({}) {|hash, service| key = service["fqdn"].split(".")[1..-1].join("."); (hash[key] ||= {})[service["name"]] = service["fqdn"]; hash }.to_yaml %>'))
}
