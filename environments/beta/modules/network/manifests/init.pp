class network (
    $domains,
){
    notice(denormalize($domains))

    $domains_byname = parseyaml(inline_template('<%= @domains.inject({}) {|hash, zone| hash[zone["name"]] = zone; hash }.to_yaml %>'))
}
