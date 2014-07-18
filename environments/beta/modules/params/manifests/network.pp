class params::network (
    $domains,
    $secret             = "ONktz0u8IMbbGZ/1kCKKfA==",
    $forwarders         = ['8.8.8.8', '8.8.4.4'],
){
    notice(denormalize($domains))

    $domains_hash       = parseyaml(inline_template('<%= @domains.inject({}) {|hash, zone| hash[zone["name"]] = zone; hash }.to_yaml %>'))
}
