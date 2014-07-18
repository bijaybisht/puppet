Facter.add("home") do
   setcode do
      Facter::Util::Resolution.exec('echo $HOME').chomp
   end
end
